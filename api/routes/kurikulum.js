const { Router } = require("express");
const db = require("../config/db.js");
const router = Router();
const fs = require("fs");

const multer = require("multer");
const sharp = require("sharp");
const storage = multer.memoryStorage();
const upload = multer({ storage });

// get legal
const getPengaya = (req, res) => {
  var message = "";
  var sql = "SELECT * FROM kurikulum WHERE tipe = 'pengayaan' ORDER BY id DESC";
  db.query(sql, function(err, result) {
    if (result.length <= 0) message = "Cabang Kosong!";

    res.send({ data: result, message: message });
  });
};

router.get("/kurikulumPengaya", getPengaya);
// get legal
const getUpgrade = (req, res) => {
  var message = "";
  var sql = "SELECT * FROM kurikulum WHERE tipe = 'upgrading' ORDER BY id DESC";
  db.query(sql, function(err, result) {
    if (result.length <= 0) message = "Cabang Kosong!";

    res.send({ data: result, message: message });
  });
};

router.get("/kurikulumUpgrade", getUpgrade);

// get legal
const getBasic = (req, res) => {
  var message = "";
  var sql = "SELECT * FROM kurikulum WHERE tipe = 'basic' ORDER BY id DESC";
  db.query(sql, function(err, result) {
    if (result.length <= 0) message = "Cabang Kosong!";

    res.send({ data: result, message: message });
  });
};

router.get("/kurikulumBasic", getBasic);

// del legal
const DIR_LEGAL = "public/images/kurikulum";
router.delete("/kurikulum/:img", (req, res) => {
  if (!req.params.img) {
    console.log("No file received");
    var message = "Data img tidak diterima.";
  } else {
    console.log("file received");
    console.log(req.params.img);
    var sql = "DELETE FROM `kurikulum` WHERE `img`='" + req.params.img + "'";
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

const update = (req, res) => {
  console.log(req);

  if (!req.files) {
    var sql = `UPDATE kurikulum SET name = ?, subtitle = ?, penyakit = ?, konten = ?, tipe = ? WHERE id = ?;`;
    db.query(
      sql,
      [
        req.body.name,
        req.body.subtitle,
        req.body.penyakit,
        req.body.konten,
        req.body.tipe,
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
    var subtitle = post.subtitle;
    var penyakit = post.penyakit;
    var konten = post.konten;
    var tipe = post.tipe;
    var id = req.params.id;

    var files = req.files.img;
    var name = Date.now() + files.name;

    db.query("SELECT * FROM kurikulum WHERE id = ?", [id], (err, row) => {
      if (err) {
        console.log(err);
      } else {
        var imgName = row[0].img;
      }
      console.log(imgName);

      const DIR_LEGAL = "public/images/kurikulum";
      const imgDir = DIR_LEGAL + "/" + imgName;
      if (fs.existsSync(imgDir)) {
        fs.unlinkSync(imgDir);
      }

      files.mv(`public/images/kurikulum/` + name, (err) => {
        if (err) return res.status(500).send(err);
        var sqlImg =
          "UPDATE kurikulum SET name = ?, subtitle = ?,penyakit = ?,konten = ?,tipe = ?, img = ? WHERE id = ?;";
        db.query(
          sqlImg,
          [named, subtitle, penyakit, konten, tipe, name, id],
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

router.put("/kurikulum/:id", update);

// get legal
const get = (req, res) => {
  var message = "";
  var sql = "SELECT * FROM kurikulum ORDER BY id DESC";
  db.query(sql, function(err, result) {
    if (result.length <= 0) message = "Cabang Kosong!";

    res.send({ data: result, message: message });
  });
};

router.get("/kurikulum", get);

// STORE IMG
const index = async (req, res) => {
  if (req.method == "POST") {
    var post = req.body;
    console.log(req.files);
    var name = post.name;
    var subtitle = post.subtitle;
    var penyakit = post.penyakit;
    var konten = post.konten;
    var tipe = post.tipe;

    if (!req.files) return res.status(400).send("No files were uploaded.");

    var file = req.files.img;
    var img = Date.now() + ".webp";
    var dir = "public/images/kurikulum/";

    if (
      file.mimetype == "image/jpeg" ||
      file.mimetype == "image/png" ||
      file.mimetype == "image/gif"
    ) {
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
        "INSERT INTO `kurikulum`(`name`,`subtitle`,`penyakit`,`konten`,`tipe`,`img`) VALUES ('" +
        name +
        "','" +
        subtitle +
        "','" +
        penyakit +
        "','" +
        konten +
        "','" +
        tipe +
        "','" +
        img +
        "')";

      db.query(sql, (err, result) => {
        if (err) {
          return res.status(400).send({
            msg: err,
          });
        }
        return res.status(201).send({
          msg: "Cabang tersimpan",
          data: result,
        });
      });
    } else {
      const message =
        "This format is not allowed , please upload file with '.png','.gif','.jpg'";
      res.send({ message: message });
    }
  } else {
    res.send("Legalitas tersimpan");
  }
};

router.post("/kurikulum", index);

module.exports = router;
