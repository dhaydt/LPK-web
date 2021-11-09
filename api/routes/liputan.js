const { Router } = require("express");
const db = require("../config/db.js");
const router = Router();
const fs = require("fs");

const update = (req, res) => {
  console.log(req);
  if (!req.files) {
    var sql = `UPDATE liputan SET title = ?, subtitle = ?, quote = ?, content = ?, content2 = ?  WHERE id = ?;`;
    db.query(
      sql,
      [
        req.body.title,
        req.body.subtitle,
        req.body.quote,
        req.body.content,
        req.body.content2,
        // req.body.tag,
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
    var subtitle = post.subtitle;
    var quote = post.quote;
    var content = post.content;
    var content2 = post.content;
    var id = req.params.id;

    var files = req.files.img;
    var name = Date.now() + files.name;

    db.query("SELECT * FROM liputan WHERE id = ?", [id], (err, row) => {
      if (err) {
        console.log(err);
      } else {
        var imgName = row[0].img;
      }
      console.log(imgName);

      const DIR_LEGAL = "public/images/liputan";
      const imgDir = DIR_LEGAL + "/" + imgName;
      if (fs.existsSync(imgDir)) {
        fs.unlinkSync(imgDir);
      }

      files.mv(`public/images/liputan/` + name, (err) => {
        if (err) return res.status(500).send(err);
        var sqlImg =
          "UPDATE liputan SET title = ?, subtitle = ?, quote = ?, content = ?, content2 = ?, img = ? WHERE id = ?;";
        db.query(
          sqlImg,
          [title, subtitle, quote, content, content2, name, id],
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

router.put("/liputan/:id", update);

// GET LIPUTAN ID
const getRand = (req, res) => {
  var message = "";
  var sql = "SELECT * FROM liputan WHERE id <> ? ORDER by RAND() LIMIT 3";
  db.query(sql, [req.params.id], function(err, result) {
    if (err) {
      res.send(err);
    } else {
      res.send({ data: result, message: message });
    }
  });
};

router.get("/liputanRand/:id", getRand);

// GET SECOND LAST

const getSecond = (req, res) => {
  var message = "";
  var sql = `SELECT * FROM liputan ORDER BY id DESC LIMIT 1,3;`;
  db.query(sql, function(err, result) {
    if (result.length <= 0) message = "liputan Kosong!";

    res.send({ data: result, message: message });
  });
};

router.get("/liputanSecond", getSecond);

// GET LAST ID
const getLast = (req, res) => {
  var message = "";
  var sql = `SELECT * FROM liputan WHERE id=(SELECT max(id) FROM liputan)`;
  db.query(sql, function(err, result) {
    if (result.length <= 0) message = "liputan Kosong!";

    res.send({ data: result, message: message });
  });
};

router.get("/liputanLast", getLast);

// DELETE LIPUTAN
const DIR_LEGAL = "public/images/liputan";
router.delete("/liputan/:img", (req, res) => {
  if (!req.params.img) {
    console.log("No file received");
    var message = "Data img tidak diterima.";
  } else {
    console.log("file received");
    console.log(req.params.img);
    var sql = "DELETE FROM `liputan` WHERE `img`='" + req.params.img + "'";
    db.query(sql, function(err, result) {
      if (err) {
        return res.status(400).send(err);
      } else {
        const imgDir = DIR_LEGAL + "/" + req.params.img;
        if (fs.existsSync(imgDir)) {
          fs.unlinkSync(imgDir);
        }
        console.log("Berhasil menghapus liputan");
        // return res.status(200).send("Successfully! Image has been Deleted");
        res.send({ data: result, message: message });
      }
    });
  }
});

// GET LIPUTAN
const get = (req, res) => {
  var message = "";
  var sql = "SELECT * FROM `liputan`";
  db.query(sql, function(err, result) {
    if (result.length <= 0) message = "liputan Kosong!";

    res.send({ data: result, message: message });
  });
};

router.get("/liputan", get);

// GET LIPUTAN ID
const getId = (req, res) => {
  var message = "";
  var sql = "SELECT * FROM liputan WHERE id = ?";
  db.query(sql, [req.params.id], function(err, result) {
    if (err) {
      res.send(err);
    } else {
      res.send({ data: result, message: message });
    }
  });
};

router.get("/liputan/:id", getId);

// STORE LIPUTAN
const index = function(req, res) {
  if (req.method == "POST") {
    var post = req.body;
    console.log(req.files);
    var title = post.title;
    var subtitle = post.subtitle;
    var date = post.date;
    var quote = post.quote;
    var content = post.content;
    var content2 = post.content2;
    var user_id = post.user_id;
    var tag = post.tag;

    if (!req.files) return res.status(400).send("No files were uploaded.");

    var file = req.files.img;
    var img = Date.now() + file.name;

    if (
      file.mimetype == "image/jpeg" ||
      file.mimetype == "image/png" ||
      file.mimetype == "image/gif"
    ) {
      file.mv(`public/images/liputan/` + img, (err) => {
        if (err) return res.status(500).send(err);
        var sql =
          "INSERT INTO `liputan`(`title`,`subtitle`,`date`,`quote`,`content`,`content2`,`tag`,`user_id`,`img`) VALUES ('" +
          title +
          "','" +
          subtitle +
          "','" +
          date +
          "','" +
          quote +
          "','" +
          content +
          "','" +
          content2 +
          "','" +
          tag +
          "','" +
          user_id +
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
            msg: "Liputan tersimpan",
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

router.post("/liputan", index);

module.exports = router;
