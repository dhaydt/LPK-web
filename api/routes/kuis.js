const { Router } = require("express");
const db = require("../config/db.js");
const router = Router();

const updateTime = (req, res) => {
  console.log(req);
  var sql = `UPDATE waktu SET status = ? WHERE id = ?;`;
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

router.put("/kuisTime/:id", updateTime);

const update = (req, res) => {
  console.log(req);
  var sql = `UPDATE kuis SET status = ? WHERE id = ?;`;
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

router.put("/kuis/:id", update);

router.post("/kuis", (req, res) => {
  db.query(
    `INSERT INTO kuis (text, responses, jawaban, status, options) VALUES (${db.escape(
      req.body.text
    )}, ${db.escape(JSON.stringify(req.body.responses))}, ${db.escape(
      req.body.jawaban
    )}, ${db.escape(req.body.status)}, ${db.escape(
      JSON.stringify(req.body.options)
    )})`,
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

router.post("/kuisTime", (req, res) => {
  db.query(
    `INSERT INTO waktu (time, status) VALUES (${db.escape(
      req.body.time
    )}, ${db.escape(req.body.status)})`,
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

router.get("/kuisTime", (req, res) => {
  db.query("SELECT * FROM waktu ORDER BY id desc", (err, rows) => {
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

router.get("/kuisTimeOn", (req, res) => {
  db.query(
    "SELECT * FROM waktu WHERE status = 'on' ORDER BY id desc LIMIT 1",
    (err, rows) => {
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
    }
  );
});

router.get("/kuisOn", (req, res) => {
  db.query(
    "SELECT * FROM kuis WHERE status = 'on' ORDER BY id desc",
    (err, rows) => {
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

// router.get("/kuisFront", (req, res) => {
//   db.query("SELECT * FROM kuis LIMIT 3 ORDER BY id desc", (err, rows) => {
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

router.delete("/kuisTime/:id", (req, res) => {
  db.query(`DELETE FROM waktu WHERE id = ${req.params.id}`, function(
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
