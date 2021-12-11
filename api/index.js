const fileUpload = require("express-fileupload");
const bodyParser = require("body-parser");
const express = require("express");
const cors = require("cors");
const path = require("path");
const corsOptions = {
  // origin: "http://localhost:8080",
  origin: "https://generasiunggul.com",
  optionSuccessStatus: 200,
  credentials: true,
};

const app = express();

// Require API routes
const auth = require("./routes/auth");
const test = require("./routes/test");
const visi = require("./routes/visi");
const kuis = require("./routes/kuis");
const users = require("./routes/users");
const legal = require("./routes/legal");
const image = require("./routes/image");
const loker = require("./routes/loker");
const apply = require("./routes/apply");
const alumni = require("./routes/alumni");
const kopdar = require("./routes/kopdar");
const cabang = require("./routes/cabang");
const footer = require("./routes/footer");
const liputan = require("./routes/liputan");
const testi = require("./routes/testimoni");
const timeline = require("./routes/timeline");
const struktur = require("./routes/struktur");
const kurikulum = require("./routes/kurikulum");
const pelatihan = require("./routes/pelatihan");
const instruktur = require("./routes/instruktur");
const notifikasi = require("./routes/notifikasi");

app.use(bodyParser.json());
app.use(cors(corsOptions));

// UPLOAD
app.use(express.static(path.join(__dirname, "public")));
app.use(express.static("public"));
app.use(fileUpload());
// app.use(cors(corsOptions));
// Import API Routes
app.use(kuis);
app.use(test);
app.use(auth);
app.use(visi);
app.use(users);
app.use(legal);
app.use(image);
app.use(testi);
app.use(loker);
app.use(apply);
app.use(footer);
app.use(cabang);
app.use(alumni);
app.use(kopdar);
app.use(liputan);
app.use(struktur);
app.use(timeline);
app.use(kurikulum);
app.use(pelatihan);
app.use(instruktur);
app.use(notifikasi);

// Export express app
module.exports = app;


if (require.main === module) {
  const port = process.env.PORT || 3001;
  app.listen(port, () => {
    console.log(`API server listening on port ${port}`);
  });
}
