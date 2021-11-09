const { Router } = require("express");
const db = require("../config/db.js");
const router = Router();
const fs = require("fs");

const update = (req, res) => {
  console.log(req);
  if (!req.files) {
    var sql = `UPDATE pelatihan SET title = ?, jenis = ?, subtitle = ?,waktu = ?,akses = ?,expire = ?, tempat = ?, url = ? WHERE id = ?;`;
    db.query(
      sql,
      [
        req.body.title,
        req.body.jenis,
        req.body.subtitle,
        req.body.waktu,
        req.body.akses,
        req.body.expire,
        req.body.tempat,
        req.body.url,
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
    var title = post.title;
    var jenis = post.jenis;
    var subtitle = post.subtitle;
    var waktu = post.waktu;
    var akses = post.akses;
    var expire = post.expire;
    var tempat = post.tempat;
    var url = post.url;
    var id = req.params.id;

    var files = req.files.img;
    var name = Date.now() + files.name;

    db.query("SELECT * FROM pelatihan WHERE id = ?", [id], (err, row) => {
      if (err) {
        console.log(err);
      } else {
        var imgName = row[0].img;
      }
      console.log(imgName);

      const DIR_LEGAL = "public/images/pelatihan";
      const imgDir = DIR_LEGAL + "/" + imgName;
      if (fs.existsSync(imgDir)) {
        fs.unlinkSync(imgDir);
      }

      files.mv(`public/images/pelatihan/` + name, (err) => {
        if (err) return res.status(500).send(err);
        var sqlImg =
          "UPDATE pelatihan SET title = ?, jenis = ?, subtitle = ?, waktu = ?, akses = ?, expire = ?, tempat = ?, url = ?, img = ? WHERE id = ?;";
        db.query(
          sqlImg,
          [title, jenis, subtitle, waktu, akses, expire, tempat, url, name, id],
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

router.put("/pelatihan/:id", update);

// del legal
const DIR_LEGAL = "public/images/pelatihan";
router.delete("/pelatihan/:img", (req, res) => {
  if (!req.params.img) {
    console.log("No file received");
    var message = "Data img tidak diterima.";
  } else {
    console.log("file received");
    console.log(req.params.img);
    var sql = "DELETE FROM `pelatihan` WHERE `img`='" + req.params.img + "'";
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
  var sql = "SELECT * FROM pelatihan WHERE jenis = 'offline'";
  db.query(sql, function(err, result) {
    if (result.length <= 0) message = "Legalitas Kosong!";

    res.send({ data: result, message: message });
  });
};

router.get("/pelatihanOffline", getKopdar);

const getOnline = (req, res) => {
  var message = "";
  var sql = "SELECT * FROM pelatihan WHERE jenis = 'online'";
  db.query(sql, function(err, result) {
    if (result.length <= 0) message = "Legalitas Kosong!";

    res.send({ data: result, message: message });
  });
};

router.get("/pelatihanOnline", getOnline);

// get legal
const get = (req, res) => {
  var message = "";
  var sql = "SELECT * FROM pelatihan";
  db.query(sql, function(err, result) {
    if (result.length <= 0) message = "Legalitas Kosong!";

    res.send({ data: result, message: message });
  });
};

router.get("/pelatihan", get);

// STORE IMG
const index = function(req, res) {
  if (req.method == "POST") {
    var post = req.body;
    console.log(req.files);
    var title = post.title;
    var jenis = post.jenis;
    var subtitle = post.subtitle;
    var tempat = post.tempat;
    var waktu = post.waktu;
    var akses = post.akses;
    var url = post.url;
    var expire = post.expire;

    if (!req.files) return res.status(400).send("No files were uploaded.");

    var file = req.files.img;
    var img = Date.now() + file.name;

    if (
      file.mimetype == "image/jpeg" ||
      file.mimetype == "image/png" ||
      file.mimetype == "image/gif"
    ) {
      file.mv(`public/images/pelatihan/` + img, (err) => {
        if (err) return res.status(500).send(err);
        var sql =
          "INSERT INTO `pelatihan`(`title`,`jenis`,`subtitle`,`img`,`tempat`, `waktu`,`akses`,`expire`,`url`) VALUES ('" +
          title +
          "','" +
          jenis +
          "','" +
          subtitle +
          "','" +
          img +
          "','" +
          tempat +
          "','" +
          waktu +
          "','" +
          akses +
          "','" +
          expire +
          "','" +
          url +
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

router.post("/pelatihan", index);

module.exports = router;
