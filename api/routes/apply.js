const { Router } = require("express");
const db = require("../config/db.js");
const router = Router();
const fs = require("fs");

// del legal
const DIR_LEGAL = "public/documents/apply";
router.delete("/apply/:portfolio", (req, res) => {
  if (!req.params.portfolio) {
    console.log("No file received");
    var message = "Data img tidak diterima.";
  } else {
    console.log("file received");
    console.log(req.params.portfolio);
    var sql =
      "DELETE FROM `apply` WHERE `portfolio`='" + req.params.portfolio + "'";
    db.query(sql, function(err, result) {
      if (err) {
        return res.status(400).send(err);
      } else {
        const imgDir = DIR_LEGAL + "/" + req.params.portfolio;
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
  var sql = `UPDATE apply SET status = ? WHERE id = ?;`;
  db.query(sql, [req.body.status, req.params.id], (err, result) => {
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
};

router.put("/apply/:id", update);

// PUT STATUS

// router.put("/apply/:id", (req, res) => {
//   console.log(req);
//   db.query(
//     `UPDATE INTO apply SET (status) WHERE id = (id) VALUES (${db.escape(
//       req.body.status
//     )}, ${db.escape(req.params.id)})`,
//     (err, result) => {
//       if (err) {
//         return res.status(400).send({
//           msg: err,
//         });
//       }
//       return res.status(201).send({
//         msg: "Visi / Misi tersimpan",
//         data: result,
//       });
//     }
//   );
// });

// get legal
const get = (req, res) => {
  var message = "";
  // ("SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate FROM Orders INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID");
  var sql =
    "SELECT apply.id, apply.nama, loker.judul, apply.wa, apply.email, apply.domisili, apply.provinsi, apply.kelamin, apply.pendidikan, apply.jurusan, apply.agama, apply.pengalaman, apply.alasan, apply.portfolio, apply.status, apply.kuis FROM apply " +
    "JOIN loker ON loker.id = apply.loker_id ";
  db.query(sql, function(err, result) {
    if (result.length <= 0) message = "Legalitas Kosong!";

    res.send({ data: result, message: message });
  });
};

router.get("/apply", get);

// STORE IMG
const index = function(req, res) {
  if (req.method == "POST") {
    var post = req.body;
    var nama = post.nama;
    var wa = post.wa;
    var email = post.email;
    var domisili = post.domisili;
    var provinsi = post.provinsi;
    var kelamin = post.kelamin;
    var pendidikan = post.pendidikan;
    var jurusan = post.jurusan;
    var agama = post.agama;
    var pengalaman = post.pengalaman;
    var kuis = post.kuis;
    var alasan = post.alasan;
    var loker_id = req.params.id;
    var status = post.status;
    // console.log(req);
    if (!req.files) return res.status(400).send("No files were uploaded.");

    var file = req.files.portfolio;
    var portfolio = Date.now() + file.name;

    if (
      // file.mimetype == "application/msword" ||
      // file.mimetype == "application/zip" ||
      // file.mimetype ==
      //   "application/vnd.openxmlformats-officedocument.wordprocessingml.document" ||
      // file.mimetype == "image/gif" ||
      file.mimetype == "application/pdf"
      // file.mimetype == "	image/png" ||
      // file.mimetype == "image/gif"
    ) {
      file.mv(`public/documents/apply/` + portfolio, (err) => {
        if (err) return res.status(500).send(err);
        var sql =
          "INSERT INTO `apply`(`nama`,`wa`,`email`,`domisili`,`provinsi`,`kelamin`,`pendidikan`,`jurusan`,`agama`,`pengalaman`,`kuis`,`alasan`,`portfolio`,`loker_id`,`status`) VALUES ('" +
          nama +
          "','" +
          wa +
          "','" +
          email +
          "','" +
          domisili +
          "','" +
          provinsi +
          "','" +
          kelamin +
          "','" +
          pendidikan +
          "','" +
          jurusan +
          "','" +
          agama +
          "','" +
          pengalaman +
          "','" +
          kuis +
          "','" +
          alasan +
          "','" +
          portfolio +
          "','" +
          loker_id +
          "','" +
          status +
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
        "This format is not allowed , please upload file with 'pdf'";
      res.send({ message: message });
    }
  } else {
    res.send("Legalitas tersimpan");
  }
};

router.post("/apply/:id", index);

module.exports = router;
