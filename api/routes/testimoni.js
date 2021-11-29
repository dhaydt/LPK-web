const { Router } = require("express");
const db = require("../config/db.js");
const router = Router();
const fs = require("fs");

const multer = require("multer");
const sharp = require("sharp");
const storage = multer.memoryStorage();
const upload = multer({ storage });

const update = (req, res) => {
  console.log(req);
  if (!req.files) {
    var sql = `UPDATE testimoni SET name = ?, address = ?, content = ?, video = ? WHERE id = ?;`;
    db.query(
      sql,
      [
        req.body.name,
        req.body.address,
        req.body.content,
        req.body.video,
        req.params.id,
      ],
      (err, result) => {
        if (err) {
          return res.status(400).send({
            msg: err,
          });
        }
        return res.status(201).send({
          msg: "Legalitas tersimpan",
          data: result,
        });
      }
    );
  } else {
    var post = req.body;
    var named = post.name;
    var address = post.address;
    var content = post.content;
    var video = post.video;
    var id = req.params.id;

    var files = req.files.img;
    var name = Date.now() + files.name;

    db.query("SELECT * FROM testimoni WHERE id = ?", [id], (err, row) => {
      if (err) {
        console.log(err);
      } else {
        var imgName = row[0].img;
      }
      console.log(imgName);

      const DIR_LEGAL = "public/images/testi";
      const imgDir = DIR_LEGAL + "/" + imgName;
      if (fs.existsSync(imgDir)) {
        fs.unlinkSync(imgDir);
      }

      files.mv(`public/images/testi/` + name, (err) => {
        if (err) return res.status(500).send(err);
        var sqlImg =
          "UPDATE testimoni SET name = ?, address = ?, content = ?, video = ?, img = ? WHERE id = ?;";
        db.query(
          sqlImg,
          [named, address, content, video, name, id],
          (err, rows) => {
            if (err) {
              res.send(err);
            } else {
              res.send(rows);
            }
          }
        );
      });
    });
  }
};

router.put("/testi/:id", update);

// del legal
const DIR_LEGAL = "public/images/testi";
router.delete("/testi/:id/:img", (req, res) => {
  if (!req.params.img) {
    console.log("No file received");
    var message = "Data img tidak diterima.";
  } else {
    console.log("file received");
    console.log(req.params.img);
    var sql = "DELETE FROM `testimoni` WHERE `id`='" + req.params.id + "'";
    db.query(sql, function(err, result) {
      if (err) {
        return res.status(400).send(err);
      } else {
        const imgDir = DIR_LEGAL + "/" + req.params.img;
        if (fs.existsSync(imgDir)) {
          fs.unlinkSync(imgDir);
        }
        console.log("Berhasil menghapus legalitas");
        // return res.status(200).send("Successfully! Image has been Deleted");
        res.send({ data: result, message: message });
      }
    });
  }
});

// get legal
const get = (req, res) => {
  var message = "";
  var sql = "SELECT * FROM `testimoni` ORDER BY id DESC";
  db.query(sql, function(err, result) {
    if (result.length <= 0) message = "Legalitas Kosong!";

    res.send({ data: result, message: message });
  });
};

router.get("/testi", get);

// STORE IMG
const index = async (req, res) => {
  if (req.method == "POST") {
    var post = req.body;
    console.log(req.files);
    var name = post.name;
    var address = post.address;
    var content = post.content;
    var video = post.video;
    var tipe = post.tipe;

    if (req.body.tipe == "image") {
      var file = req.files.img;
      var img = Date.now() + ".webp";
      var dir = "public/images/testi/";

      fs.access(dir, (err) => {
        if (err) {
          fs.mkdirSync(dir);
        }
      });

      try {
        const { data } = file;
        await sharp(data)
          .webp({ quality: 5 })
          .toFile(dir + img);
      } catch (e) {
        return res.status(500).send({
          msg: e,
        });
      }

      var sql =
        "INSERT INTO `testimoni`(`name`,`img`,`address`, `content`, `tipe`) VALUES ('" +
        name +
        "','" +
        img +
        "','" +
        address +
        "','" +
        content +
        "','" +
        tipe +
        "')";

      db.query(sql, (err, result) => {
        if (err) {
          return res.status(400).send({
            msg: err,
          });
        }
        return res.status(201).send({
          msg: "Legalitas tersimpan",
          data: result,
        });
      });
    } else if (req.body.tipe === "video") {
      var sql2 =
        "INSERT INTO `testimoni`(`name`,`video`,`address`, `content`, `tipe`) VALUES ('" +
        name +
        "','" +
        video +
        "','" +
        address +
        "','" +
        content +
        "','" +
        tipe +
        "')";

      db.query(sql2, (err, result) => {
        if (err) {
          return res.status(400).send({
            msg: err,
          });
        }
        return res.status(201).send({
          msg: "Legalitas tersimpan",
          data: result,
        });
      });
    }
  } else {
    res.send("Legalitas tersimpan");
  }
};

router.post("/testi", index);

module.exports = router;
