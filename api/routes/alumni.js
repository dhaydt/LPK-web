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
    var sql = `UPDATE alumni SET name = ?, address = ? WHERE id = ?;`;
    db.query(
      sql,
      [
        req.body.name,
        req.body.address,
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
    var id = req.params.id;

    var files = req.files.img;
    var name = Date.now() + files.name;

    db.query("SELECT * FROM alumni WHERE id = ?", [id], (err, row) => {
      if (err) {
        console.log(err);
      } else {
        var imgName = row[0].img;
      }
      console.log(imgName);

      const DIR_LEGAL = "public/images/alumni";
      const imgDir = DIR_LEGAL + "/" + imgName;
      if (fs.existsSync(imgDir)) {
        fs.unlinkSync(imgDir);
      }

      files.mv(`public/images/alumni/` + name, (err) => {
        if (err) return res.status(500).send(err);
        var sqlImg =
          "UPDATE alumni SET name = ?, address = ?, img = ? WHERE id = ?;";
        db.query(
          sqlImg,
          [named, address, name, id],
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

router.put("/alumni/:id", update);

// del legal
const DIR_LEGAL = "public/images/alumni";
router.delete("/alumni/:id/:img", (req, res) => {
  if (!req.params.img) {
    console.log("No file received");
    var message = "Data img tidak diterima.";
  } else {
    console.log("file received");
    console.log(req.params.img);
    var sql = "DELETE FROM `alumni` WHERE `id`='" + req.params.id + "'";
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
  var sql = "SELECT * FROM `alumni` ORDER BY id DESC";
  db.query(sql, function(err, result) {
    if (result.length <= 0) message = "Legalitas Kosong!";

    res.send({ data: result, message: message });
  });
};

router.get("/alumni", get);

// STORE IMG
const index = async (req, res) => {
  if (req.method == "POST") {
    var post = req.body;
    console.log(req.files);
    var name = post.name;
    var address = post.address;

    var file = req.files.img;
    var img = Date.now() + ".webp";
    var dir = "public/images/alumni/";

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
      "INSERT INTO `alumni`(`name`,`img`,`address`) VALUES ('" +
      name +
      "','" +
      img +
      "','" +
      address +
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
  } else {
    res.send("Legalitas tersimpan");
  }
};

router.post("/alumni", index);

module.exports = router;
