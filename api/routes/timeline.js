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
  // title`,`lokasi`,`bulan`,`date_range`,
  if (!req.files) {
    var sql = `UPDATE timeline SET title = ?, lokasi = ?, bulan = ?, date_range = ?, url = ? WHERE id = ?;`;
    db.query(
      sql,
      [
        req.body.title,
        req.body.lokasi,
        req.body.bulan,
        req.body.date_range,
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
    var lokasi = post.lokasi;
    var bulan = post.bulan;
    var date_range = post.date_range;
    var url = post.url;
    var id = req.params.id;

    var files = req.files.img;
    var name = Date.now() + files.name;

    db.query("SELECT * FROM timeline WHERE id = ?", [id], (err, row) => {
      if (err) {
        console.log(err);
      } else {
        var imgName = row[0].img;
      }
      console.log(imgName);

      const DIR_LEGAL = "public/images/timeline";
      const imgDir = DIR_LEGAL + "/" + imgName;
      if (fs.existsSync(imgDir)) {
        fs.unlinkSync(imgDir);
      }

      files.mv(`public/images/timeline/` + name, (err) => {
        if (err) return res.status(500).send(err);
        var sqlImg =
          "UPDATE timeline SET title = ?, lokasi = ?, bulan = ?, date_range = ?, url = ?, img = ? WHERE id = ?;";
        db.query(
          sqlImg,
          [title, lokasi, bulan, date_range, url, name, id],
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

router.put("/timeline/:id", update);

// GROUP

// router.get("/groupFront", (req, res) => {
//   db.query(
//     "SELECT * FROM gallery_group ORDER BY id desc LIMIT 3",
//     (err, rows) => {
//       var data = rows.map((row) => row.lokasi);
//       var sql = `SELECT * FROM gallery WHERE lokasi IN (?, ?, ?)`;
//       db.query(sql, [data[0], data[1], data[2]], (error, resp) => {
//         if (error) {
//           return res.status(400).send({
//             msg: error,
//           });
//         } else {
//           //render ke view posts index
//           return res.status(200).send({
//             dataImg: resp, // <-- data posts
//             dataGroup: rows, // <-- data posts
//           });
//         }
//       });
//     }
//   );
// });

// router.get("/detail/:id", (req, res) => {
//   db.query(
//     "SELECT * FROM gallery_group WHERE id = ?",
//     [req.params.id],
//     (err, rows) => {
//       var data = rows[0].lokasi;
//       console.log(data);
//       var sql = `SELECT * FROM gallery WHERE lokasi = ?`;
//       db.query(sql, [data], (error, resp) => {
//         if (error) {
//           return res.status(400).send({
//             msg: error,
//           });
//         } else {
//           //render ke view posts index
//           return res.status(200).send({
//             dataImg: resp, // <-- data posts
//             dataGroup: rows, // <-- data posts
//           });
//         }
//       });
//     }
//   );
// });

//----------------------------------------GALERI-GROUP

router.delete("/timelineGroup/:id", (req, res) => {
  db.query(`DELETE FROM timeline_group WHERE id = ${req.params.id}`, function(
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

router.post("/timelineGroup", (req, res) => {
  console.log("post", req.body);
  db.query(
    `INSERT INTO timeline_group (bulan, status) VALUES (${db.escape(
      req.body.bulan
    )}, ${db.escape(req.body.status)})`,
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

router.get("/timeline/:bulan", (req, res) => {
  db.query(
    "SELECT * FROM timeline WHERE bulan = ? ORDER BY id desc",
    [req.params.bulan],
    (err, rows) => {
      if (err) {
        return res.status(400).send({
          msg: "Fail get group",
        });
      } else {
        //render ke view posts index
        return res.status(200).send({
          data: rows, // <-- data posts
        });
      }
    }
  );
});

router.get("/timelineGroupOn", (req, res) => {
  db.query(
    "SELECT * FROM timeline_group WHERE status = 'on' ORDER BY id DESC LIMIT 4",
    (err, rows) => {
      if (err) {
        return res.status(400).send({
          msg: "Fail get group",
        });
      } else {
        //render ke view posts index
        return res.status(200).send({
          data: rows, // <-- data posts
        });
      }
    }
  );
});

router.get("/timelineGroup", (req, res) => {
  db.query("SELECT * FROM timeline_group ORDER BY id", (err, rows) => {
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

// del legal
const DIR_LEGAL = "public/images/timeline";
router.delete("/timeline/:img", (req, res) => {
  if (!req.params.img) {
    console.log("No file received");
    var message = "Data img tidak diterima.";
  } else {
    console.log("file received");
    console.log(req.params.img);
    var sql = "DELETE FROM `timeline` WHERE `img`='" + req.params.img + "'";
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
  var sql = "SELECT * FROM `timeline`";
  db.query(sql, function(err, result) {
    if (result.length <= 0) message = "Cabang Kosong!";

    res.send({ data: result, message: message });
  });
};

router.get("/timeline", get);

// STORE IMG
const index = async (req, res) => {
  if (req.method == "POST") {
    var post = req.body;
    console.log(req.files);
    var title = post.title;
    var lokasi = post.lokasi;
    var bulan = post.bulan;
    var url = post.url;
    var date_range = post.date_range;

    if (!req.files) return res.status(400).send("No files were uploaded.");

    var file = req.files.img;
    var img = Date.now() + ".webp";
    var dir = "public/images/timeline/";

    if (
      file.mimetype == "image/jpeg" ||
      file.mimetype == "image/png" ||
      file.mimetype == "image/gif"
    ) {
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
        "INSERT INTO `timeline`(`title`,`lokasi`,`bulan`,`date_range`, `url`,`img`) VALUES ('" +
        title +
        "','" +
        lokasi +
        "','" +
        bulan +
        "','" +
        date_range +
        "','" +
        url +
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
    } else {
      const message =
        "This format is not allowed , please upload file with '.png','.gif','.jpg'";
      res.send({ message: message });
    }
  } else {
    res.send("Legalitas tersimpan");
  }
};

router.post("/timeline", index);

module.exports = router;
