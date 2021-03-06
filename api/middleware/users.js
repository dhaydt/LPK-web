const jwt = require("jsonwebtoken");
module.exports = {
  validateRegister: (req, res, next) => {
    // username min length 3
    if (!req.body.nama_depan || req.body.nama_depan.length < 2) {
      return res.status(400).send({
        msg: "Please enter a nama depan with min. 2 chars",
      });
    }
    // password min 6 chars
    if (!req.body.password || req.body.password.length < 6) {
      return res.status(400).send({
        msg: "Please enter a password with min. 6 chars",
      });
    }
    // password (repeat) does not match
    // if (!req.body.c_password || req.body.password != req.body.c_password) {
    //   return res.status(400).send({
    //     msg: "Both passwords must match",
    //   });
    // }
    next();
  },
};

isLoggedIn: (req, res, next) => {
  try {
    const token = req.headers.authorization.split(" ")[1];
    const decoded = jwt.verify(token, "SECRETKEY");
    req.userData = decoded;
    next();
  } catch (err) {
    return res.status(401).send({
      msg: "Your session is not valid!",
    });
  }
};
