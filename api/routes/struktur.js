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
    var sql = `UPDATE struktur SET name = ?, title = ?, telp = ?, nip = ?, prefix = ?  WHERE id = ?;`;
    db.query(
      sql,
      [
        req.body.name,
        req.body.title,
        req.body.telp,
        req.body.nip,
        req.body.prefix,
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
    var title = post.title;
    var nip = post.nip;
    var prefix = post.prefix;
    var id = req.params.id;

    var files = req.files.img;
    var name = Date.now() + files.name;

    db.query("SELECT * FROM struktur WHERE id = ?", [id], (err, row) => {
      if (err) {
        console.log(err);
      } else {
        var imgName = row[0].img;
      }
      console.log(imgName);

      const DIR_LEGAL = "public/images/struktur";
      const imgDir = DIR_LEGAL + "/" + imgName;
      if (fs.existsSync(imgDir)) {
        fs.unlinkSync(imgDir);
      }

      files.mv(`public/images/struktur/` + name, (err) => {
        if (err) return res.status(500).send(err);
        var sqlImg =
          "UPDATE struktur SET name = ?, title = ?, nip = ?, prefix = ?, img = ? WHERE id = ?;";
        db.query(sqlImg, [named, title, nip, prefix, name, id], (err, rows) => {
          if (err) {
            res.send(err);
          } else {
            res.send(rows);
          }
        });
      });
    });
  }
};

router.put("/struktur/:id", update);

// get legal
const getDir = (req, res) => {
  var message = "";
  var sql = "SELECT * FROM struktur WHERE prefix = 'direktur' ORDER BY id DESC";
  db.query(sql, function(err, result) {
    if (result.length <= 0) message = "Cabang Kosong!";

    res.send({ data: result, message: message });
  });
};

router.get("/strukturDir", getDir);

// get legal
const getPel = (req, res) => {
  var message = "";
  var sql = "SELECT * FROM struktur WHERE prefix = 'pelatih' ORDER BY id DESC";
  db.query(sql, function(err, result) {
    if (result.length <= 0) message = "Cabang Kosong!";

    res.send({ data: result, message: message });
  });
};

router.get("/strukturPel", getPel);

// get legal
const getOp = (req, res) => {
  var message = "";
  var sql = "SELECT * FROM struktur WHERE prefix = 'operasional' ORDER BY id DESC";
  db.query(sql, function(err, result) {
    if (result.length <= 0) message = "Cabang Kosong!";

    res.send({ data: result, message: message });
  });
};

router.get("/strukturOp", getOp);

// get legal
const getFin = (req, res) => {
  var message = "";
  var sql = "SELECT * FROM struktur WHERE prefix = 'finance' ORDER BY id DESC";
  db.query(sql, function(err, result) {
    if (result.length <= 0) message = "Cabang Kosong!";

    res.send({ data: result, message: message });
  });
};

router.get("/strukturFin", getFin);

// get legal
const getHum = (req, res) => {
  var message = "";
  var sql = "SELECT * FROM struktur WHERE prefix = 'human' ORDER BY id DESC";
  db.query(sql, function(err, result) {
    if (result.length <= 0) message = "Cabang Kosong!";

    res.send({ data: result, message: message });
  });
};

router.get("/strukturHum", getHum);

// get legal
const getMar = (req, res) => {
  var message = "";
  var sql = "SELECT * FROM struktur WHERE prefix = 'marketing' ORDER BY id DESC";
  db.query(sql, function(err, result) {
    if (result.length <= 0) message = "Cabang Kosong!";

    res.send({ data: result, message: message });
  });
};

router.get("/strukturMar", getMar);

// del legal
const DIR_LEGAL = "public/images/struktur";
router.delete("/struktur/:img", (req, res) => {
  if (!req.params.img) {
    console.log("No file received");
    var message = "Data img tidak diterima.";
  } else {
    console.log("file received");
    console.log(req.params.img);
    var sql = "DELETE FROM `struktur` WHERE `img`='" + req.params.img + "'";
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
  var sql = "SELECT * FROM `struktur`";
  db.query(sql, function(err, result) {
    if (result.length <= 0) message = "Cabang Kosong!";

    res.send({ data: result, message: message });
  });
};

router.get("/struktur", get);

// STORE IMG
const index = async (req, res) => {
  if (req.method == "POST") {
    var post = req.body;
    console.log(req.files);
    var name = post.name;
    var title = post.title;
    var nip = post.nip;
    var prefix = post.prefix;
    var telp = post.telp;

    if (!req.files) return res.status(400).send("No files were uploaded.");

    var file = req.files.img;
    var img = Date.now() + ".webp";
    var dir = "public/images/struktur/";

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
        "INSERT INTO `struktur`(`name`,`title`,`telp`,`nip`,`prefix`,`img`) VALUES ('" +
        name +
        "','" +
        title +
        "','" +
        telp +
        "','" +
        nip +
        "','" +
        prefix +
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

router.post("/struktur", index);

module.exports = router;
