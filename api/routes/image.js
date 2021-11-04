const { Router } = require("express");
const db = require("../config/db.js");
const router = Router();
const fs = require("fs");

// NEW GALLERIES

// find ID

router.get("/image/:id", (req, res) => {
  db.query(
    "SELECT * FROM galeri WHERE title = ?",
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
  var sql = `UPDATE galeri SET imgTitle = ?, imgDesc = ? WHERE id = ?;`;
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
};

router.put("/image/:id", newGal);

//----------------------------------------GALERI
// Del image
const DIR_LEGAL = "public/images/newGaleri";
router.delete("/image/:img", (req, res) => {
  if (!req.params.img) {
    console.log("No file received");
    var message = "Data img tidak diterima.";
  } else {
    console.log("file received");
    console.log(req.params.img);
    var sql = "DELETE FROM `galeri` WHERE `img`='" + req.params.img + "'";
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
  var sql = "SELECT * FROM galeri ORDER BY id DESC";
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
        files[i].mv(`public/images/newGaleri/` + names, (err) => {
          if (err) return res.status(500).send(err);
        });
        var sql =
          "INSERT INTO `galeri`(`title`,`desc`,`date`,`img`) VALUES ('" +
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

      files.mv(`public/images/newGaleri/` + name, (err) => {
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

router.post("/image", index);

// ------------------------------------------------------------------------->>>>>>>>>>>>
//
//
//
//
//
//
//
//
//
//

//----------------------------------------KOPDAR-GROUP

router.get("/groupKopdarFront", (req, res) => {
  db.query(
    "SELECT * FROM gallery WHERE status = 'kopdar' ORDER BY lokasi desc",
    (err, rows) => {
      if (err) {
        res.send(err);
      } else {
        res.send(rows);
      }
    }
  );
});

router.delete("/groupKopdar/:id", (req, res) => {
  db.query(`DELETE FROM kopdar_group WHERE id = ${req.params.id}`, function(
    err,
    result
  ) {
    if (err) {
      return res.status(401).send({
        msg: "Fail to delete",
      });
    } else {
      return res.status(200).send({
        msg: "Data deleted",
        data: result,
      });
    }
  });
});

router.post("/groupKopdar", (req, res) => {
  console.log("post", req.body);
  db.query(
    `INSERT INTO kopdar_group (lokasi, date_range, konten) VALUES (${db.escape(
      req.body.lokasi
    )}, ${db.escape(req.body.date_range)}, ${db.escape(req.body.konten)})`,
    (err, result) => {
      if (err) {
        return res.status(400).send({
          msg: err,
        });
      }
      return res.status(201).send({
        msg: "Visi / Misi tersimpan",
        data: result,
      });
    }
  );
});

router.get("/groupKopdar", (req, res) => {
  db.query("SELECT * FROM kopdar_group ORDER BY id desc", (err, rows) => {
    if (err) {
      return res.status(400).send({
        msg: "Database error",
      });
    } else {
      //render ke view posts index
      return res.status(200).send({
        data: rows, // <-- data posts
      });
    }
  });
});

// update kopdar

// get kopdar

router.get("/detailKopdar/:id", (req, res) => {
  db.query(
    "SELECT * FROM gallery WHERE lokasi = ? AND status = 'kopdar'",
    [req.params.id],
    (err, rows) => {
      if (err) {
        res.send(err);
      } else {
        res.send(rows);
      }
    }
  );
});

const getKopdar = (req, res) => {
  var message = "";
  var sql = "SELECT * FROM gallery WHERE status = 'kopdar'";
  db.query(sql, function(err, result) {
    if (result.length <= 0) message = "Legalitas Kosong!";

    res.send({ data: result, message: message });
  });
};

router.get("/imageKopdar", getKopdar);

// Del image
const DIR_LEGALS = "public/images/galeri";
router.delete("/imageKopdar/:img", (req, res) => {
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
        const imgDir = DIR_LEGALS + "/" + req.params.img;
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

// STORE kopdar
const indexKopdar = function(req, res) {
  if (req.method == "POST") {
    var post = req.body;
    console.log(req.files);
    var title = post.title;
    var status = post.status;
    var lokasi = post.lokasi;
    var date_range = post.date_range;

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
          "INSERT INTO `gallery`(`title`,`status`,`img`,`lokasi`,`date_range`) VALUES ('" +
          title +
          "','" +
          status +
          "','" +
          img +
          "','" +
          lokasi +
          "','" +
          date_range +
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

router.post("/imageKopdar", indexKopdar);

// update image galeri

const updatedar = (req, res) => {
  console.log(req);
  var sql = `UPDATE gallery SET title = ?, date_range = ?, lokasi = ? WHERE id = ?;`;
  db.query(
    sql,
    [req.body.title, req.body.date_range, req.body.lokasi, req.params.id],
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

router.put("/imageKopdar/:id", updatedar);

// UPDATE IMAGE-----------------------------------------------------------------------------------------
// const update = (req, res) => {
//   console.log(req);
//   var sql = `UPDATE gallery SET title = ?, date_range = ?, lokasi = ? WHERE id = ?;`;
//   db.query(
//     sql,
//     [req.body.title, req.body.date_range, req.body.lokasi, req.params.id],
//     (err, result) => {
//       if (err) {
//         return res.status(400).send({
//           msg: err,
//         });
//       }
//       return res.status(201).send({
//         msg: "Legalitas tersimpan",
//         data: result,
//       });
//     }
//   );
// };

// router.put("/image/:id", update);
// IMAGE FRONTEND

router.get("/groupFront", (req, res) => {
  db.query(
    "SELECT * FROM gallery_group ORDER BY id desc LIMIT 3",
    (err, rows) => {
      var data = rows.map((row) => row.lokasi);
      var sql = `SELECT * FROM gallery WHERE lokasi IN (?, ?, ?)`;
      db.query(sql, [data[0], data[1], data[2]], (error, resp) => {
        if (error) {
          return res.status(400).send({
            msg: error,
          });
        } else {
          //render ke view posts index
          return res.status(200).send({
            dataImg: resp, // <-- data posts
            dataGroup: rows, // <-- data posts
          });
        }
      });
    }
  );
});

module.exports = router;
