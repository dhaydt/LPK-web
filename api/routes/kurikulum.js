const { Router } = require("express");
const db = require("../config/db.js");
const router = Router();
const fs = require("fs");

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
const index = function(req, res) {
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
    var img = Date.now() + file.name;

    if (
      file.mimetype == "image/jpeg" ||
      file.mimetype == "image/png" ||
      file.mimetype == "image/gif"
    ) {
      file.mv(`public/images/kurikulum/` + img, (err) => {
        if (err) return res.status(500).send(err);
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
