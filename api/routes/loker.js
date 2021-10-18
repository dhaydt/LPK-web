const { Router } = require("express");
const db = require("../config/db.js");
const router = Router();

router.post("/loker", (req, res) => {
  db.query(
    `INSERT INTO loker (judul, bidang, kriteria, deskripsi, kualifikasi, jenis, gaji, note, deadline, alamat, pengalaman) VALUES (${db.escape(
      req.body.judul
    )}, ${db.escape(req.body.bidang)},${db.escape(
      req.body.kriteria
    )}, ${db.escape(req.body.deskripsi)}, ${db.escape(
      req.body.kualifikasi
    )}, ${db.escape(JSON.stringify(req.body.jenis))}, ${db.escape(
      req.body.gaji
    )}, ${db.escape(req.body.note)},${db.escape(
      req.body.deadline
    )}, ${db.escape(req.body.alamat)}, ${db.escape(req.body.pengalaman)})`,
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

router.get("/loker", (req, res) => {
  db.query("SELECT * FROM loker ORDER BY id desc", (err, rows) => {
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

router.get("/loker-random", (req, res) => {
  db.query("SELECT * FROM loker ORDER BY RAND() LIMIT 3", (err, rows) => {
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

router.get("/loker/:id", (req, res) => {
  var sql = `SELECT * FROM loker WHERE loker.id = ${req.params.id}`;
  db.query(sql, (err, rows) => {
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

router.delete("/loker/:id", (req, res) => {
  db.query(`DELETE FROM loker WHERE loker.id = ${req.params.id}`, function(
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

module.exports = router;
