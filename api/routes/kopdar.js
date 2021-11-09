const { Router } = require("express");
const db = require("../config/db.js");
const router = Router();
const fs = require("fs");

// NEW GALLERIES

router.get("/kopdar/:id", (req, res) => {
  db.query(
    "SELECT * FROM kopdar WHERE title = ?",
    [req.params.id],
    (err, rows) => {
      if (err) {
        res.send(err);
      } else {
        res.send({
          data: rows,
        });
      }
    }
  );
});

// UPDATE

const newGal = (req, res) => {
  console.log(req);
  if (!req.files) {
    var sql = `UPDATE kopdar SET imgTitle = ?, imgDesc = ? WHERE id = ?;`;
    db.query(
      sql,
      [req.body.imgTitle, req.body.imgDesc, req.params.id],
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
    var title = post.imgTitle;
    var desc = post.imgDesc;
    var id = req.params.id;

    var files = req.files.img;
    var name = Date.now() + files.name;

    db.query("SELECT * FROM kopdar WHERE id = ?", [id], (err, row) => {
      if (err) {
        console.log(err);
      } else {
        var imgName = row[0].img;
      }
      console.log(imgName);

      const DIR_LEGAL = "public/images/kopdar";
      const imgDir = DIR_LEGAL + "/" + imgName;
      if (fs.existsSync(imgDir)) {
        fs.unlinkSync(imgDir);
      }

      files.mv(`public/images/kopdar/` + name, (err) => {
        if (err) return res.status(500).send(err);
        var sqlImg =
          "UPDATE kopdar SET imgTitle = ?, imgDesc = ?, img = ? WHERE id = ?;";
        db.query(sqlImg, [title, desc, name, id], (err, rows) => {
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

router.put("/kopdar/:id", newGal);

//----------------------------------------GALERI
// Del image
const DIR_LEGAL = "public/images/kopdar";
router.delete("/kopdar/:img", (req, res) => {
  if (!req.params.img) {
    console.log("No file received");
    var message = "Data img tidak diterima.";
  } else {
    console.log("file received");
    console.log(req.params.img);
    var sql = "DELETE FROM `kopdar` WHERE `img`='" + req.params.img + "'";
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
  var sql = "SELECT * FROM kopdar ORDER BY id DESC";
  db.query(sql, function(err, result) {
    if (result.length <= 0) message = "Legalitas Kosong!";

    res.send({ data: result, message: message });
  });
};

router.get("/kopdar", get);

// STORE IMG
const index = function(req, res) {
  if (req.method == "POST") {
    var post = req.body;
    var title = post.title;
    var date = post.date;
    var desc = post.desc;

    if (!req.files) return res.status(400).send("No files were uploaded.");

    var files = req.files.img;
    var messages = [];
    var errors = [];

    if (files.length > 1) {
      for (var i = 0; i < files.length; i++) {
        var names = Date.now() + files[i].name;
        // var items = { title: "", desc: "", img: names };
        // img.push(items);
        // console.log([i], names);
        files[i].mv(`public/images/kopdar/` + names, (err) => {
          if (err) return res.status(500).send(err);
        });
        var sql =
          "INSERT INTO `kopdar`(`title`,`desc`,`date`,`img`) VALUES ('" +
          title +
          "','" +
          desc +
          "','" +
          date +
          "','" +
          names +
          "')";

        db.query(sql, (err, result) => {
          if (err) {
            errors.push(err);
          } else {
            messages.push(result);
          }
        });
      }
      return res.status(201).send({
        msg: "Legalitas tersimpan",
        messages: messages,
        err: errors,
      });
    } else {
      var name = Date.now() + files.name;
      // var item = { title: "", desc: "", img: name };
      // img.push(item);

      files.mv(`public/images/kopdar/` + name, (err) => {
        if (err) return res.status(500).send(err);
        var sql =
          "INSERT INTO `galeri`(`title`,`desc`,`date`,`img`) VALUES ('" +
          title +
          "','" +
          desc +
          "','" +
          date +
          "','" +
          name +
          "')";

        db.query(sql, (err, result) => {
          if (err) {
            res.send(err);
          } else {
            res.send(result);
          }
        });
      });
    }
  } else {
    res.send("Legalitas tersimpan");
  }
};

router.post("/kopdar", index);

module.exports = router;
