const { Router } = require("express");
const db = require("../config/db.js");
const router = Router();
const fs = require("fs");

const update = (req, res) => {
  console.log(req);
  if (!req.files) {
    var sql = `UPDATE legalitas SET name = ?, instansi = ? WHERE id = ?;`;
    db.query(
      sql,
      [req.body.name, req.body.instansi, req.params.id],
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
    var instansi = post.instansi;
    var id = req.params.id;

    var files = req.files.img;
    var name = Date.now() + files.name;

    db.query("SELECT * FROM legalitas WHERE id = ?", [id], (err, row) => {
      if (err) {
        console.log(err);
      } else {
        var imgName = row[0].img;
      }
      console.log(imgName);

      const DIR_LEGAL = "public/images/legal";
      const imgDir = DIR_LEGAL + "/" + imgName;
      if (fs.existsSync(imgDir)) {
        fs.unlinkSync(imgDir);
      }

      files.mv(`public/images/legal/` + name, (err) => {
        if (err) return res.status(500).send(err);
        var sqlImg =
          "UPDATE legalitas SET name = ?, instansi = ?, img = ? WHERE id = ?;";
        db.query(sqlImg, [named, instansi, name, id], (err, rows) => {
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

router.put("/legal/:id", update);

// del legal
const DIR_LEGAL = "public/images/legal";
router.delete("/legal/:img", (req, res) => {
  if (!req.params.img) {
    console.log("No file received");
    var message = "Data img tidak diterima.";
  } else {
    console.log("file received");
    console.log(req.params.img);
    var sql = "DELETE FROM `legalitas` WHERE `img`='" + req.params.img + "'";
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
  var sql = "SELECT * FROM `legalitas`";
  db.query(sql, function(err, result) {
    if (result.length <= 0) message = "Legalitas Kosong!";

    res.send({ data: result, message: message });
  });
};

router.get("/legal", get);

// STORE IMG
const index = function(req, res) {
  if (req.method == "POST") {
    var post = req.body;
    console.log(req.files);
    var name = post.name;
    var instansi = post.instansi;

    if (!req.files) return res.status(400).send("No files were uploaded.");

    var file = req.files.img;
    var img = Date.now() + file.name;

    if (
      file.mimetype == "image/jpeg" ||
      file.mimetype == "image/png" ||
      file.mimetype == "image/gif"
    ) {
      file.mv(`public/images/legal/` + img, (err) => {
        if (err) return res.status(500).send(err);
        var sql =
          "INSERT INTO `legalitas`(`name`,`instansi`,`img`) VALUES ('" +
          name +
          "','" +
          instansi +
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

router.post("/legal", index);

module.exports = router;
