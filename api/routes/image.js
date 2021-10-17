const { Router } = require("express");
const db = require("../config/db.js");
const router = Router();
const fs = require("fs");

// del legal
const DIR_LEGAL = "public/images/galeri";
router.delete("/image/:img", (req, res) => {
  if (!req.params.img) {
    console.log("No file received");
    var message = "Data img tidak diterima.";
  } else {
    console.log("file received");
    console.log(req.params.img);
    var sql = "DELETE FROM `gallery` WHERE `img`='" + req.params.img + "'";
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
const getKopdar = (req, res) => {
  var message = "";
  var sql = "SELECT * FROM gallery WHERE status = 'kopdar'";
  db.query(sql, function(err, result) {
    if (result.length <= 0) message = "Legalitas Kosong!";

    res.send({ data: result, message: message });
  });
};

router.get("/imageKopdar", getKopdar);
// get legal
const get = (req, res) => {
  var message = "";
  var sql = "SELECT * FROM gallery WHERE status = 'galeri'";
  db.query(sql, function(err, result) {
    if (result.length <= 0) message = "Legalitas Kosong!";

    res.send({ data: result, message: message });
  });
};

router.get("/image", get);

// STORE IMG
const index = function(req, res) {
  if (req.method == "POST") {
    var post = req.body;
    console.log(req.files);
    var title = post.title;
    var status = post.status;
    var date = post.date;

    if (!req.files) return res.status(400).send("No files were uploaded.");

    var file = req.files.img;
    var img = Date.now() + file.name;

    if (
      file.mimetype == "image/jpeg" ||
      file.mimetype == "image/png" ||
      file.mimetype == "image/gif"
    ) {
      file.mv(`public/images/galeri/` + img, (err) => {
        if (err) return res.status(500).send(err);
        var sql =
          "INSERT INTO `gallery`(`title`,`status`,`img`,`date`) VALUES ('" +
          title +
          "','" +
          status +
          "','" +
          img +
          "','" +
          date +
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

router.post("/image", index);

module.exports = router;
