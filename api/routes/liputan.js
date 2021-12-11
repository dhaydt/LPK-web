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
    if(req.body.type == 'youtube'){
    var youtube = req.body.youtube;

    var sql = `UPDATE liputan SET title = ?, subtitle = ?, quote = ?, content = ?, content2 = ?, youtube = ?  WHERE id = ?;`;
    db.query(
      sql,
      [
        req.body.title,
        req.body.subtitle,
        req.body.quote,
        req.body.content,
        req.body.content2,
        youtube,
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

    var sql5 = `UPDATE liputan SET title = ?, subtitle = ?, quote = ?, content = ?, content2 = ? WHERE id = ?;`;
    db.query(
      sql5,
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
    }
  } else {
    var post = req.body;
    var title = post.title;
    var subtitle = post.subtitle;
    var quote = post.quote;
    var content = post.content;
    var content2 = post.content;
    var id = req.params.id;
    
    if(req.body.type == 'image'){

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
    } else if(req.body.type == 'video'){
      var filesVideo = req.files.video;
      var nameVideo = Date.now() + filesVideo.name;
  
      db.query("SELECT * FROM liputan WHERE id = ?", [id], (err, row) => {
        if (err) {
          console.log(err);
        } else {
          var imgName = row[0].video;
        }
        console.log(imgName);
  
        const DIR_LEGAL = "public/images/liputan";
        const imgDir = DIR_LEGAL + "/" + imgName;
        if (fs.existsSync(imgDir)) {
          fs.unlinkSync(imgDir);
        }
  
        filesVideo.mv(`public/images/liputan/` + nameVideo, (err) => {
          if (err) return res.status(500).send(err);
          var sqlVideo =
            "UPDATE liputan SET title = ?, subtitle = ?, quote = ?, content = ?, content2 = ?, video = ? WHERE id = ?;";
          db.query(
            sqlVideo,
            [title, subtitle, quote, content, content2, nameVideo, id],
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
router.delete("/liputan/:id", (req, res) => {
  if (!req.params.id) {
    console.log("No file received");
    var message = "Data img tidak diterima.";
  } else {
    console.log("file received");
    console.log(req.params.id);
    var get = `SELECT * FROM liputan WHERE id = ?`
    db.query(get, [req.params.id], (err, rows) => {
      if(err){
        console.log(err)
        res.send(err)
      } {
        var row = rows[0];
        if(row.type == "image"){
          console.log(row.img)
          var sql = "DELETE FROM `liputan` WHERE `id`='" + row.id + "'";
          db.query(sql, function(err, result) {
            if (err) {
              return res.status(400).send(err);
            } else {
              const imgDir = DIR_LEGAL + "/" + row.img;
              if (fs.existsSync(imgDir)) {
                fs.unlinkSync(imgDir);
              }
              console.log("Berhasil menghapus liputan");
              // return res.status(200).send("Successfully! Image has been Deleted");
              return res.send({ data: result, message: message });
            }
          });
        } else if(row.type == "video"){
          console.log(row.video)
          var sql3 = "DELETE FROM `liputan` WHERE `id`='" + row.id + "'";
          db.query(sql3, function(err, result) {
            if (err) {
              return res.status(400).send(err);
            } else {
              const imgDir = DIR_LEGAL + "/" + row.video;
              if (fs.existsSync(imgDir)) {
                fs.unlinkSync(imgDir);
              }
              console.log("Berhasil menghapus liputan");
              // return res.status(200).send("Successfully! Image has been Deleted");
              return res.send({ data: result, message: message });
            }
          });
        } else {
          console.log(row.youtube)
          var sql2 = "DELETE FROM `liputan` WHERE `id`='" + row.id + "'";
          db.query(sql2, function(err, result) {
            if (err) {
              return res.status(400).send(err);
            } else {
              // const imgDir = DIR_LEGAL + "/" + req.params.img;
              // if (fs.existsSync(imgDir)) {
              //   fs.unlinkSync(imgDir);
              // }
              console.log("Berhasil menghapus liputan");
              // return res.status(200).send("Successfully! Image has been Deleted");
              return res.send({ data: result, message: message });
            }
          });
        }
      }
    })
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
const index = async (req, res) => {
  console.log(req.files);
  if (req.method == "POST") {
    var post = req.body;
    var title = post.title;
    var subtitle = post.subtitle;
    var date = post.date;
    var quote = post.quote;
    var content = post.content;
    var content2 = post.content2;
    var user_id = post.user_id;
    var tag = post.tag;
    var type = post.type;
    var youtube = post.youtube;

    // if (!req.files) return res.status(400).send("No files were uploaded.");
    if(req.body.type == "image"){
      var file = req.files.img;
      var img = Date.now() + ".webp";
      var dir = "public/images/liputan/";


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
        "INSERT INTO `liputan`(`title`,`type`,`subtitle`,`date`,`quote`,`content`,`content2`,`tag`,`user_id`,`img`) VALUES ('" +
        title +
        "','" +
        type +
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
      
    } else if (req.body.type === "video"){

      var filev = req.files.video;
      var video = Date.now() + filev.name;
      var dirs = "public/images/liputan/";


      fs.access(dirs, (err) => {
        if (err) {
          fs.mkdirSync(dir);
        }
      });

      filev.mv(dirs + video, (err) => {
        if (err) return res.status(500).send(err);

      var sql =
        "INSERT INTO `liputan`(`title`,`type`,`subtitle`,`date`,`quote`,`content`,`content2`,`tag`,`user_id`,`video`) VALUES ('" +
        title +
        "','" +
        type +
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
        video +
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
      var sql =
      "INSERT INTO `liputan`(`title`,`type`,`subtitle`,`date`,`quote`,`content`,`content2`,`tag`,`user_id`,`youtube`) VALUES ('" +
      title +
      "','" +
      type +
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
      youtube +
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
    }

  } else {
    res.send("Legalitas tersimpan");
  }
};

router.post("/liputan", index);

module.exports = router;
