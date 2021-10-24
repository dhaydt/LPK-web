const { Router } = require("express");
const db = require("../config/db.js");
const router = Router();
const fs = require("fs");

// del legal
const DIR_LEGAL = "public/documents/apply";
router.delete("/apply/:id", (req, res) => {
  db.query(
    "SELECT * FROM apply WHERE id = ?",
    [req.params.id],
    (err, result) => {
      if (err) {
        console.log(err);
        res.send(err);
      } else {
        // res.send(result);
        var data = result[0];

        var sql = "DELETE FROM `apply` WHERE `id`='" + req.params.id + "'";
        db.query(sql, (err, result) => {
          if (err) {
            res.send(err);
          } else {
            // res.send("success delete database");

            const imgSkck = DIR_LEGAL + "/" + data.skck;
            const imgFoto = DIR_LEGAL + "/" + data.foto;
            const imgKtp = DIR_LEGAL + "/" + data.ktp;
            const imgIjazah = DIR_LEGAL + "/" + data.ijazah;
            const imgSert = DIR_LEGAL + "/" + data.sertifikat;
            const imgPort = DIR_LEGAL + "/" + data.portfolio;
            if (fs.existsSync(imgPort)) {
              fs.unlinkSync(imgPort);
              if (fs.existsSync(imgFoto)) {
                fs.unlinkSync(imgFoto);
                if (fs.existsSync(imgKtp)) {
                  fs.unlinkSync(imgKtp);
                  if (fs.existsSync(imgIjazah)) {
                    fs.unlinkSync(imgIjazah);
                    if (fs.existsSync(imgSert)) {
                      fs.unlinkSync(imgSert);
                      if (fs.existsSync(imgSkck)) {
                        fs.unlinkSync(imgSkck);
                      }
                    }
                  }
                }
              }
            }
            res.send({ data: result });
          }
        });
      }
    }
  );
  // if (!req.params.portfolio) {
  //   console.log("No file received");
  //   var message = "Data img tidak diterima.";
  // } else {
  //   console.log("file received");
  //   console.log(req.params.portfolio);
  //   var sql =
  //     "DELETE FROM `apply` WHERE `portfolio`='" + req.params.portfolio + "'";
  //   db.query(sql, function(err, result) {
  //     if (err) {
  //       return res.status(400).send(err);
  //     } else {
  //       const imgDir = DIR_LEGAL + "/" + req.params.portfolio;
  //       if (fs.existsSync(imgDir)) {
  //         fs.unlinkSync(imgDir);
  //       }
  //       console.log("Berhasil menghapus legalitas");
  //       // return res.status(200).send("Successfully! Image has been Deleted");
  //       res.send({ data: result, message: message });
  //     }
  //   });
  // }
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
    "SELECT apply.id, apply.nama, loker.judul, apply.wa, apply.facebook, apply.instagram, apply.nilai, apply.tempat_lhr, apply.tgl_lhr, apply.bahasa, apply.komputer, apply.foto, apply.ktp, apply.sertifikat, apply.ijazah, apply.skck, apply.email, apply.domisili, apply.provinsi, apply.kelamin, apply.pendidikan, apply.jurusan, apply.agama, apply.pengalaman, apply.alasan, apply.portfolio, apply.status, apply.pertanyaan, apply.jawaban FROM apply " +
    "JOIN loker ON loker.id = apply.loker_id ";
  db.query(sql, function(err, result) {
    // if (result.length <= 0) message = "Legalitas Kosong!";
    if (err) {
      res.send(err);
    } else {
      res.send({ data: result, message: message });
    }
  });
};

router.get("/apply", get);

// STORE IMG
const index = function(req, res) {
  if (req.method == "POST") {
    var post = req.body;

    var nama = post.nama;
    var tempat = post.tempat_lhr;
    var tgl = post.tgl_lhr;
    var menikah = post.menikah;
    var komputer = post.komputer;
    var bahasa = post.bahasa;
    var ig = post.instagram;
    var fb = post.facebook;
    var wa = post.wa;
    var email = post.email;
    var domisili = post.domisili;
    var provinsi = post.provinsi;
    var kelamin = post.kelamin;
    var pendidikan = post.pendidikan;
    var jurusan = post.jurusan;
    var agama = post.agama;
    var pengalaman = post.pengalaman;
    var pertanyaan = post.pertanyaan;
    var jawaban = post.jawaban;
    var nilai = post.nilai;
    var alasan = post.alasan;
    var loker_id = req.params.id;
    var status = post.status;
    if (!req.files) return res.status(400).send("No files were uploaded.");
    console.log(nilai);
    var filePorto = req.files.portfolio;
    var fileFoto = req.files.foto;
    var fileKtp = req.files.ktp;
    var fileIjazah = req.files.ijazah;
    var fileSertifikat = req.files.sertifikat;
    var fileSkck = req.files.skck;

    var portfolio = "porto" + Date.now() + filePorto.name;
    var foto = "foto" + Date.now() + fileFoto.name;
    var ktp = "ktp" + Date.now() + fileKtp.name;
    var ijazah = "ijazah" + Date.now() + fileIjazah.name;
    var sertifikat = "serti" + Date.now() + fileSertifikat.name;
    var skck = fileSkck ? "skck" + Date.now() + fileSkck.name : "null";

    filePorto.mv(`public/documents/apply/` + portfolio, (err) => {
      if (err)
        return res.status(500).send({ error: err, msg: "fail move porto" });

      fileFoto.mv(`public/documents/apply/` + foto, (err) => {
        if (err)
          return res.status(500).send({ error: err, msg: "fail move foto" });
        fileKtp.mv(`public/documents/apply/` + ktp, (err) => {
          if (err)
            return res.status(500).send({ error: err, msg: "fail move ktp" });
          fileIjazah.mv(`public/documents/apply/` + ijazah, (err) => {
            if (err)
              return res
                .status(500)
                .send({ error: err, msg: "fail move ijazah" });
            fileSertifikat.mv(`public/documents/apply/` + sertifikat, (err) => {
              if (err)
                return res
                  .status(500)
                  .send({ error: err, msg: "fail move sertifikat" });
              if (skck !== "null") {
                fileSkck.mv(`public/documents/apply/` + skck, (err) => {
                  if (err)
                    return res.status(500).send({
                      error: err,
                      msg: "fail move skck",
                    });
                  var sql =
                    "INSERT INTO `apply`(`nama`,`wa`,`email`,`domisili`,`provinsi`,`kelamin`,`pendidikan`,`jurusan`,`agama`,`pengalaman`,`pertanyaan`,`jawaban`,`nilai`,`alasan`,`tempat_lhr`,`tgl_lhr`,`menikah`,`komputer`,`bahasa`,`instagram`,`facebook`,`foto`,`ktp`,`ijazah`,`sertifikat`,`skck`,`portfolio`,`loker_id`,`status`) VALUES ('" +
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
                    pertanyaan +
                    "','" +
                    jawaban +
                    "','" +
                    nilai +
                    "','" +
                    alasan +
                    "','" +
                    tempat +
                    "','" +
                    tgl +
                    "','" +
                    menikah +
                    "','" +
                    komputer +
                    "','" +
                    bahasa +
                    "','" +
                    ig +
                    "','" +
                    fb +
                    "','" +
                    foto +
                    "','" +
                    ktp +
                    "','" +
                    ijazah +
                    "','" +
                    sertifikat +
                    "','" +
                    skck +
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
                      msg: "Data apply tersimpan",
                      data: result,
                    });
                  });
                });
              } else {
                var sql =
                  "INSERT INTO `apply`(`nama`,`wa`,`email`,`domisili`,`provinsi`,`kelamin`,`pendidikan`,`nilai`,`jurusan`,`agama`,`pengalaman`,`pertanyaan`,`jawaban`,`alasan`,`tempat_lhr`,`tgl_lhr`,`menikah`,`komputer`,`bahasa`,`instagram`,`facebook`,`foto`,`ktp`,`ijazah`,`sertifikat`,`portfolio`,`loker_id`,`status`) VALUES ('" +
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
                  nilai +
                  "','" +
                  jurusan +
                  "','" +
                  agama +
                  "','" +
                  pengalaman +
                  "','" +
                  pertanyaan +
                  "','" +
                  jawaban +
                  "','" +
                  alasan +
                  "','" +
                  tempat +
                  "','" +
                  tgl +
                  "','" +
                  menikah +
                  "','" +
                  komputer +
                  "','" +
                  bahasa +
                  "','" +
                  ig +
                  "','" +
                  fb +
                  "','" +
                  foto +
                  "','" +
                  ktp +
                  "','" +
                  ijazah +
                  "','" +
                  sertifikat +
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
              }
            });
          });
        });
      });
    });
  } else {
    res.send("Legalitas tersimpan");
  }
};

router.post("/apply/:id", index);

module.exports = router;
