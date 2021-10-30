const { Router } = require("express");
const db = require("../config/db.js");
const router = Router();
const fs = require("fs");

const update = (req, res) => {
  console.log(req);
  var sql = `UPDATE testimoni SET name = ?, address =?, content = ? WHERE id = ?;`;
  db.query(
    sql,
    [req.body.name, req.body.address, req.body.content, req.params.id],
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

router.put("/testi/:id", update);

// del legal
const DIR_LEGAL = "public/images/testi";
router.delete("/testi/:img", (req, res) => {
  if (!req.params.img) {
    console.log("No file received");
    var message = "Data img tidak diterima.";
  } else {
    console.log("file received");
    console.log(req.params.img);
    var sql = "DELETE FROM `testimoni` WHERE `img`='" + req.params.img + "'";
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
  var sql = "SELECT * FROM `testimoni`";
  db.query(sql, function(err, result) {
    if (result.length <= 0) message = "Legalitas Kosong!";

    res.send({ data: result, message: message });
  });
};

router.get("/testi", get);

// STORE IMG
const index = function(req, res) {
  if (req.method == "POST") {
    var post = req.body;
    console.log(req.files);
    var name = post.name;
    var address = post.address;
    var content = post.content;

    if (!req.files) return res.status(400).send("No files were uploaded.");

    var file = req.files.img;
    var img = Date.now() + file.name;

    if (
      file.mimetype == "image/jpeg" ||
      file.mimetype == "image/png" ||
      file.mimetype == "image/gif"
    ) {
      file.mv(`public/images/testi/` + img, (err) => {
        if (err) return res.status(500).send(err);
        var sql =
          "INSERT INTO `testimoni`(`name`,`img`,`address`, `content`) VALUES ('" +
          name +
          "','" +
          img +
          "','" +
          address +
          "','" +
          content +
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

router.post("/testi", index);

module.exports = router;
