const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const path = require("path");
const fileUpload = require("express-fileupload");
const corsOptions = {
  origin: "https://generasiunggul.com",
  credentials: true, //access-control-allow-credentials:true
  optionSuccessStatus: 200,
};
// const fileURLToPath = require("url");
// Create express instance
const app = express();
// const dir = dirname(fileURLToPath());
// Require API routes
const users = require("./routes/users");
const test = require("./routes/test");
const auth = require("./routes/auth");
const visi = require("./routes/visi");
const legal = require("./routes/legal");
const liputan = require("./routes/liputan");
const cabang = require("./routes/cabang");
const image = require("./routes/image");
const pelatihan = require("./routes/pelatihan");
const testi = require("./routes/testimoni");

app.use(bodyParser.json());
app.use(cors(corsOptions));

// UPLOAD
app.use(express.static("public"));
app.use(express.static(path.join(__dirname, "public")));
app.use(fileUpload());
// app.use(cors(corsOptions));
// Import API Routes
app.use(users);
app.use(test);
app.use(auth);
app.use(visi);
app.use(legal);
app.use(liputan);
app.use(cabang);
app.use(image);
app.use(pelatihan);
app.use(testi);

// Export express app
module.exports = app;

// Start standalone server if directly running
if (require.main === module) {
  const port = process.env.PORT || 3001;
  app.listen(port, () => {
    // eslint-disable-next-line no-console
    console.log(`API server listening on port ${port}`);
  });
}
