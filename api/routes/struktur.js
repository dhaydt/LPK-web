const { Router } = require("express");
const db = require("../config/db.js");
const router = Router();
const fs = require("fs");

// get legal
const getDir = (req, res) => {
  var message = "";
  var sql = "SELECT * FROM struktur WHERE prefix = 'direktur'";
  db.query(sql, function(err, result) {
    if (result.length <= 0) message = "Cabang Kosong!";

    res.send({ data: result, message: message });
  });
};

router.get("/strukturDir", getDir);

// get legal
const getPel = (req, res) => {
  var message = "";
  var sql = "SELECT * FROM struktur WHERE prefix = 'pelatih'";
  db.query(sql, function(err, result) {
    if (result.length <= 0) message = "Cabang Kosong!";

    res.send({ data: result, message: message });
  });
};

router.get("/strukturPel", getPel);

// get legal
const getOp = (req, res) => {
  var message = "";
  var sql = "SELECT * FROM struktur WHERE prefix = 'operasional'";
  db.query(sql, function(err, result) {
    if (result.length <= 0) message = "Cabang Kosong!";

    res.send({ data: result, message: message });
  });
};

router.get("/strukturOp", getOp);

// get legal
const getFin = (req, res) => {
  var message = "";
  var sql = "SELECT * FROM struktur WHERE prefix = 'finance'";
  db.query(sql, function(err, result) {
    if (result.length <= 0) message = "Cabang Kosong!";

    res.send({ data: result, message: message });
  });
};

router.get("/strukturFin", getFin);

// get legal
const getHum = (req, res) => {
  var message = "";
  var sql = "SELECT * FROM struktur WHERE prefix = 'human'";
  db.query(sql, function(err, result) {
    if (result.length <= 0) message = "Cabang Kosong!";

    res.send({ data: result, message: message });
  });
};

router.get("/strukturHum", getHum);

// get legal
const getMar = (req, res) => {
  var message = "";
  var sql = "SELECT * FROM struktur WHERE prefix = 'marketing'";
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
const index = function(req, res) {
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
    var img = Date.now() + file.name;

    if (
      file.mimetype == "image/jpeg" ||
      file.mimetype == "image/png" ||
      file.mimetype == "image/gif"
    ) {
      file.mv(`public/images/struktur/` + img, (err) => {
        if (err) return res.status(500).send(err);
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
