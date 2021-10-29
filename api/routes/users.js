const { Router } = require("express");
const db = require("../config/db.js");
const bcrypt = require("bcryptjs");
const router = Router();

router.delete("/users/:id", (req, res) => {
  db.query(`DELETE FROM users WHERE id = ?`, [req.params.id], (err, result) => {
    if (err) {
      return res.status(401).send({
        msg: err,
      });
    } else {
      return res.status(200).send({
        msg: "Data deleted",
        data: result,
      });
    }
  });
});

const update = (req, res) => {
  console.log(req);
  if (!req.body.new_password) {
    var sql = `UPDATE users SET nama_depan = ?, nama_bel = ?, email = ?, telp = ?, alamat = ?, role = ? WHERE id = ?;`;
    db.query(
      sql,
      [
        req.body.nama_depan,
        req.body.nama_bel,
        req.body.email,
        req.body.telp,
        req.body.alamat,
        req.body.role,
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
    bcrypt.hash(req.body.new_password, 10, (err, hash) => {
      if (err) {
        return res.status(500).send({
          msg: err,
        });
      } else {
        // has hashed pw => add to database
        var s = `UPDATE users SET nama_depan = ?, nama_bel = ?, email = ?, telp = ?, alamat = ?, role = ?, password = ? WHERE id = ?;`;
        db.query(
          s,
          [
            req.body.nama_depan,
            req.body.nama_bel,
            req.body.email,
            req.body.telp,
            req.body.alamat,
            req.body.role,
            hash,
            req.params.id,
          ],
          (err, result) => {
            if (err) {
              return res.status(400).send({
                msg: err,
              });
            }
            return res.status(201).send({
              msg: "Changed",
            });
          }
        );
      }
    });
  }
};

router.put("/users/:id", update);

router.get("/users", (req, res) => {
  db.query("SELECT * FROM users ORDER BY id desc", (err, rows) => {
    if (err) {
      return res.status(400).send({
        msg: err,
      });
    } else {
      //render ke view posts index
      return res.status(200).send({
        data: rows, // <-- data posts
      });
    }
  });
});

module.exports = router;
