const { Router } = require("express");
const db = require("../config/db.js");
const router = Router();

router.post("/kuis", (req, res) => {
  db.query(
    `INSERT INTO kuis (pertanyaan, options) VALUES (${db.escape(
      req.body.pertanyaan
    )}, ${db.escape(JSON.stringify(req.body.options))})`,
    (err, result) => {
      if (err) {
        return res.status(400).send({
          msg: err,
        });
      }
      return res.status(201).send({
        msg: "Visi / Misi tersimpan",
        kuis: result,
      });
    }
  );
});

router.get("/kuis", (req, res) => {
  db.query("SELECT * FROM kuis ORDER BY id desc", (err, rows) => {
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

// router.get("/visiOnly", (req, res) => {
//   var sql = "SELECT * FROM visi WHERE visi IS NOT NULL  ORDER BY id desc";
//   db.query(sql, (err, rows) => {
//     if (err) {
//       return res.status(400).send({
//         msg: "Database error",
//       });
//     } else {
//       //render ke view posts index
//       return res.status(200).send({
//         data: rows, // <-- data posts
//       });
//     }
//   });
// });

router.delete("/kuis/:id", (req, res) => {
  db.query(`DELETE FROM kuis WHERE id = ${req.params.id}`, function(
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
