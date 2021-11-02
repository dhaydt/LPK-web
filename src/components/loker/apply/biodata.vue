<template>
  <div class="dataApply">
    <b-row class="justify-content-center" no-gutters>
      <b-col md="12" class="justify-content-center">
        <el-form :model="model" :rules="rules" ref="form">
          <b-row class="justify-content-center ml-0">
            <!-- COLUMN 1               -->
            <b-col md="6">
              <el-form-item label="Nama Lengkap" prop="nama">
                <el-input
                  v-model="model.nama"
                  type="text"
                  placeholder="Masukan nama lengkapmu"
                ></el-input>
              </el-form-item>

              <el-form-item label="Tempat lahir" prop="tempat_lhr">
                <el-input
                  v-model="model.tempat_lhr"
                  type="text"
                  placeholder="Masukan tempat lahirmu"
                ></el-input>
              </el-form-item>

              <el-form-item label="Agama" prop="agama">
                <el-radio
                  v-model="model.agama"
                  class="mb-0 ml-0"
                  label="Islam"
                  border
                  >Islam</el-radio
                >
                <el-radio
                  v-model="model.agama"
                  class="mb-0 ml-0"
                  label="Non-Islam"
                  border
                  >Non-Islam</el-radio
                >
              </el-form-item>

              <el-form-item label="Nomor WhatsApp" prop="wa">
                <el-input
                  v-model="model.wa"
                  placeholder="Masukkan nomor whatsappmu"
                ></el-input>
              </el-form-item>

              <el-form-item label="Kota Domisili" prop="domisili">
                <el-input
                  v-model="model.domisili"
                  placeholder="Masukkan kota domisilimu"
                ></el-input>
              </el-form-item>

              <el-form-item label="Tingkat Pendidikan" prop="pendidikan">
                <el-select
                  class="el-input"
                  v-model="model.pendidikan"
                  placeholder="Pilih tingkat pendidikanmu"
                >
                  <el-option
                    v-for="item in pendidikan"
                    :key="item.value"
                    :label="item.text"
                    :value="item.value"
                  >
                  </el-option>
                </el-select>
              </el-form-item>

              <el-form-item label="Pengalaman Kerja" prop="pengalaman">
                <el-select
                  class="el-input"
                  v-model="model.pengalaman"
                  placeholder="Pengalaman bekerjamu"
                >
                  <el-option
                    v-for="item in pengalaman"
                    :key="item.value"
                    :label="item.text"
                    :value="item.value"
                  >
                  </el-option>
                </el-select>
              </el-form-item>

              <el-form-item label="Link Akun Facebook" prop="facebook">
                <el-input
                  type="text"
                  placeholder="Masukan link akun facebookmu"
                  v-model="model.facebook"
                ></el-input>
              </el-form-item>

              <el-form-item label="Bahasa yang Dikuasai" prop="bahasa">
                <el-input
                  type="textarea"
                  placeholder="Masukan bahasa yang kamu kuasai"
                  rows="3"
                  v-model="model.bahasa"
                ></el-input>
              </el-form-item>

              <el-form-item label="Pas Foto" prop="foto" class="text-left">
                <div class="custom-file">
                  <input
                    type="file"
                    @change="onSelectFoto()"
                    accept="images/jpeg, images/png"
                    class="custom-file-input"
                    id="foto"
                    aria-describedby="inputGroupFileAddon02"
                  />
                  <label class="btn uploadBtn" for="foto"
                    ><span>Upload file</span></label
                  >
                  <p class="uploaded">
                    {{ model.foto ? model.foto.name : "" }}
                  </p>
                </div>
              </el-form-item>

              <el-form-item label="Foto Ijazah" prop="ijazah" class="text-left">
                <div class="custom-file">
                  <input
                    type="file"
                    @change="onSelectIjazah()"
                    accept="images/jpeg, images/png"
                    class="custom-file-input"
                    id="ijaz"
                    aria-describedby="inputGroupFileAddon02"
                  />
                  <label class="btn uploadBtn" for="ijaz"
                    ><span>Upload file</span></label
                  >
                  <p class="uploaded">
                    {{ model.ijazah ? model.ijazah.name : "" }}
                  </p>
                </div>
              </el-form-item>

              <el-form-item
                label="Foto SKCK (Optional)"
                prop="skck"
                class="text-left"
              >
                <div class="custom-file">
                  <input
                    type="file"
                    @change="onSelectSkck()"
                    accept="images/jpeg, images/jpg, images/png"
                    class="custom-file-input"
                    id="skck"
                    aria-describedby="inputGroupFileAddon02"
                  />
                  <label class="btn uploadBtn" for="skck"
                    ><span>Upload file</span></label
                  >
                  <p class="uploaded">
                    {{ model.skck ? model.skck.name : "" }}
                  </p>
                </div>
              </el-form-item>
            </b-col>

            <!-- COLUMN 2 -->
            <b-col md="6">
              <el-form-item prop="kelamin" text-color="#07A148" label="Kelamin">
                <el-radio
                  v-model="model.kelamin"
                  label="laki-laki"
                  text-color="#07A148"
                  fill="#07A148"
                  class="mb-0 ml-0"
                  border
                  >Laki-laki</el-radio
                >
                <el-radio
                  v-model="model.kelamin"
                  label="perempuan"
                  text-color="#07A148"
                  class="mb-0 ml-0"
                  border
                  >Perempuan</el-radio
                >
              </el-form-item>

              <el-form-item label="Tanggal Lahir" prop="tgl_lhr">
                <el-input
                  v-model="model.tgl_lhr"
                  type="date"
                  placeholder="Masukan nama lengkapmu"
                ></el-input>
              </el-form-item>

              <el-form-item label="Status Marital" prop="menikah">
                <el-select
                  v-model="model.menikah"
                  class="el-input"
                  placeholder="Pilih status maritalmu"
                >
                  <el-option
                    v-for="item in menikah"
                    :key="item.value"
                    :label="item.text"
                    :value="item.value"
                  >
                  </el-option>
                </el-select>
              </el-form-item>

              <el-form-item label="Email" prop="email">
                <el-input
                  v-model="model.email"
                  placeholder="Masukkan emailmu"
                ></el-input>
              </el-form-item>

              <el-form-item label="Provinsi" prop="provinsi">
                <el-input
                  v-model="model.provinsi"
                  placeholder="Masukkan provinsi domisilimu"
                ></el-input>
              </el-form-item>

              <el-form-item label="Jurusan/Bidang Studi" prop="jurusan">
                <el-input
                  v-model="model.jurusan"
                  placeholder="Masukkan jurusan/bidang studi pendidikanmu"
                ></el-input>
              </el-form-item>

              <el-form-item
                label="Bisa mengoperasikan Komputer"
                prop="komputer"
                required
              >
                <el-radio
                  v-model="model.komputer"
                  class="mb-0 ml-0"
                  label="Ya"
                  border
                  >Ya</el-radio
                >
                <el-radio
                  v-model="model.komputer"
                  class="mb-0 ml-0"
                  label="Tidak"
                  border
                  >Tidak</el-radio
                >
              </el-form-item>

              <el-form-item label="Link Akun Instagram" prop="instagram">
                <el-input
                  type="text"
                  placeholder="Masukan link akun instagrammu"
                  v-model="model.instagram"
                ></el-input>
              </el-form-item>

              <el-form-item
                label="Alasan Kuat Kenapa Kami Harus Menerima Anda"
                prop="alasan"
              >
                <el-input
                  class="$color-success"
                  type="textarea"
                  placeholder="Masukan alasanmu dengan percaya diri dan jujur"
                  v-model="model.alasan"
                  rows="3"
                ></el-input>
              </el-form-item>

              <el-form-item label="Foto KTP/SIM" prop="ktp" class="text-left">
                <div class="custom-file">
                  <input
                    type="file"
                    @change="onSelectKtp()"
                    accept="images/jpeg, images/png"
                    class="custom-file-input"
                    id="ktp"
                    aria-describedby="inputGroupFileAddon02"
                  />
                  <label class="btn uploadBtn" for="ktp"
                    ><span>Upload file</span></label
                  >
                  <p class="uploaded">
                    {{ model.ktp ? model.ktp.name : "" }}
                  </p>
                </div>
              </el-form-item>

              <el-form-item
                label="Foto Sertifikat Pelatihan"
                prop="sertifikat"
                class="text-left"
              >
                <div class="custom-file">
                  <input
                    type="file"
                    @change="onSelectSert()"
                    accept="images/jpeg, images/png"
                    class="custom-file-input"
                    id="sert"
                    aria-describedby="inputGroupFileAddon03"
                  />
                  <label class="btn uploadBtn" for="sert"
                    ><span>Upload file</span></label
                  >
                  <p class="uploaded">
                    {{ model.sertifikat ? model.sertifikat.name : "" }}
                  </p>
                </div>
              </el-form-item>

              <el-form-item
                label="Portfolio / Berkas Pendukung"
                prop="portfolio"
                class="text-left"
              >
                <div class="custom-file">
                  <input
                    type="file"
                    @change="onSelect()"
                    accept="application/pdf"
                    class="custom-file-input"
                    id="inputGroupFile01"
                    aria-describedby="inputGroupFileAddon01"
                  />
                  <label class="btn uploadBtn" for="inputGroupFile01"
                    ><span>Upload file</span></label
                  >
                  <p class="uploaded">
                    {{ model.portfolio ? model.portfolio.name : "" }}
                  </p>
                </div>
              </el-form-item>
            </b-col>
          </b-row>
        </el-form>
      </b-col>
    </b-row>
  </div>
</template>

<script>
export default {
  data() {
    return {
      agama: [
        { text: "Islam", value: "Islam" },
        { text: "Non-Islam", value: "Non-Islam" },
      ],
      pengalaman: [
        { text: "Belum Pernah", value: "Belum pernah bekerja" },
        { text: "Sudah Pernah", value: "Sudah pernah bekerja" },
      ],
      options: [
        { text: "Laki-laki", value: "Laki-laki" },
        { text: "Perempuan", value: "Perempuan" },
      ],
      pendidikan: [
        { value: "S-3", text: "S-3" },
        { value: "S-2", text: "S-2" },
        { value: "S-1", text: "S-1" },
        { value: "D-4", text: "D-4" },
        { value: "D-3", text: "D-3" },
        { value: "D-2", text: "D-2" },
        { value: "D-1", text: "D-1" },
        { value: "SMA", text: "SMA" },
        { value: "SMP", text: "SMP" },
      ],

      menikah: [
        { value: "Menikah", text: "Menikah" },
        { value: "Lajang", text: "Lajang" },
        { value: "Berpisah", text: "Berpisah" },
      ],

      rules: {
        // nama: [
        //   {
        //     required: true,
        //     message: "Nama lengkap dibutukkan",
        //     trigger: "blur",
        //   },
        // ],
        // tempat_lhr: [
        //   {
        //     required: true,
        //     message: "Tempat lahir dibutukkan",
        //     trigger: "blur",
        //   },
        // ],
        // tgl_lhr: [
        //   {
        //     required: true,
        //     message: "Tanggal Lahir dibutukkan",
        //     trigger: "blur",
        //   },
        // ],
        // menikah: [
        //   {
        //     required: true,
        //     message: "Status menikah dibutukkan",
        //     trigger: "blur",
        //   },
        // ],
        // komputer: [
        //   {
        //     required: true,
        //     message: "Informasi ini diutuhkan dibutukkan",
        //     trigger: "blur",
        //   },
        // ],
        // bahasa: [
        //   {
        //     required: true,
        //     message: "Informasi dibutukkan",
        //     trigger: "blur",
        //   },
        // ],
        // instagram: [
        //   {
        //     required: true,
        //     message: "Informasi ini dibutukkan",
        //     trigger: "blur",
        //   },
        // ],
        // facebook: [
        //   {
        //     required: true,
        //     message: "Informasi ini dibutukkan",
        //     trigger: "blur",
        //   },
        // ],
        // wa: [
        //   {
        //     required: true,
        //     message: "Wa dibutukkan",
        //     trigger: "blur",
        //   },
        // ],
        // email: [
        //   {
        //     required: true,
        //     message: "Email dibutukkan",
        //     trigger: "blur",
        //   },
        //   {
        //     type: "email",
        //     message: "Invalid email",
        //     trigger: "change",
        //   },
        // ],
        // domisili: [
        //   {
        //     required: true,
        //     message: "Domisili dibutukkan",
        //     trigger: "blur",
        //   },
        // ],
        // provinsi: [
        //   {
        //     required: true,
        //     message: "Provinsi dibutukkan",
        //     trigger: "blur",
        //   },
        // ],
        // kelamin: [
        //   {
        //     required: true,
        //     message: "Kelamin dibutukkan",
        //     trigger: "blur",
        //   },
        // ],
        // pendidikan: [
        //   {
        //     required: true,
        //     message: "Pendidikan dibutukkan",
        //     trigger: "blur",
        //   },
        // ],
        // jurusan: [
        //   {
        //     required: true,
        //     message: "Jurusan dibutukkan",
        //     trigger: "blur",
        //   },
        // ],
        // agama: [
        //   {
        //     required: true,
        //     message: "Agama dibutukkan",
        //     trigger: "blur",
        //   },
        // ],
        // pengalaman: [
        //   {
        //     required: true,
        //     message: "pengalaman dibutukkan",
        //     trigger: "blur",
        //   },
        // ],
        // alasan: [
        //   {
        //     required: true,
        //     message: "Alasan anda dibutukkan",
        //     trigger: "blur",
        //   },
        // ],
        // portfolio: [
        //   {
        //     required: true,
        //     message: "File portfolio dibutukkan",
        //     trigger: "blur",
        //   },
        // ],
        // foto: [
        //   {
        //     required: true,
        //     message: "Foto dibutukkan",
        //     trigger: "blur",
        //   },
        // ],
        // ktp: [
        //   {
        //     required: true,
        //     message: "Foto ktp dibutukkan",
        //     trigger: "blur",
        //   },
        // ],
        // ijazah: [
        //   {
        //     required: true,
        //     message: "Foto ijazah dibutukkan",
        //     trigger: "blur",
        //   },
        // ],
        // skck: [
        //   {
        //     required: false,
        //     message: "Foto ini optional",
        //     trigger: "blur",
        //   },
        // ],
        // sertifikat: [
        //   {
        //     required: true,
        //     message: "Foto ini dibutukkan",
        //     trigger: "blur",
        //   },
        // ],
      },
      model: {
        nama: "",
        kelamin: "",
        tempat_lhr: "",
        tgl_lhr: "",
        agama: "",
        menikah: "",
        wa: "",
        email: "",
        domisili: "",
        provinsi: "",
        pendidikan: null,
        jurusan: "",
        pengalaman: "",
        komputer: "",
        facebook: "",
        instagram: "",
        bahasa: "",
        alasan: "",
        foto: null,
        ktp: null,
        ijazah: null,
        skck: null,
        sertifikat: null,
        portfolio: null,
        loker_id: "",
        status: "",
      },
    };
  },

  mounted() {
    window.scrollTo(0, 0);
    this.model.loker_id = this.$route.params.id;
    console.log(this.model.loker_id);
    this.model.status = "Lamaran Masuk";
  },

  methods: {
    validate() {
      return new Promise((resolve) => {
        this.$refs.form.validate((valid) => {
          let model = new FormData();

          model.append("nama", this.model.nama);
          model.append("tempat_lhr", this.model.tempat_lhr);
          model.append("tgl_lhr", this.model.tgl_lhr);
          model.append("menikah", this.model.menikah);
          model.append("komputer", this.model.komputer);
          model.append("bahasa", this.model.bahasa);
          model.append("instagram", this.model.instagram);
          model.append("facebook", this.model.facebook);
          model.append("wa", this.model.wa);
          model.append("email", this.model.email);
          model.append("domisili", this.model.domisili);
          model.append("provinsi", this.model.provinsi);
          model.append("kelamin", this.model.kelamin);
          model.append("pendidikan", this.model.pendidikan);
          model.append("jurusan", this.model.jurusan);
          model.append("agama", this.model.agama);
          model.append("pengalaman", this.model.pengalaman);
          model.append("alasan", this.model.alasan);
          model.append("loker_id", this.model.loker_id);
          model.append("status", this.model.status);
          model.append("portfolio", this.model.portfolio);
          model.append("foto", this.model.foto);
          model.append("ktp", this.model.ktp);
          model.append("ijazah", this.model.ijazah);
          model.append("sertifikat", this.model.sertifikat);
          model.append("skck", this.model.skck);
          this.$emit("on-validate", valid, this.model);
          resolve(valid);
        });
      });
    },

    onSelect() {
      // const allowedTypes = ["image/jpeg", "image/jpg", "image/png"];
      console.log("port", event.target.files[0]);
      console.log("port2", event.target.files[0].name);
      this.model.portfolio = event.target.files[0];
    },
    onSelectKtp() {
      // const allowedTypes = ["image/jpeg", "image/jpg", "image/png"];
      console.log("ktp", event.target.files[0]);
      this.model.ktp = event.target.files[0];
    },
    onSelectFoto() {
      // const allowedTypes = ["image/jpeg", "image/jpg", "image/png"];
      console.log("foto", event.target.files[0]);
      this.model.foto = event.target.files[0];
    },
    onSelectIjazah() {
      // const allowedTypes = ["image/jpeg", "image/jpg", "image/png"];
      console.log("ijazah", event.target.files[0]);
      this.model.ijazah = event.target.files[0];
    },
    onSelectSkck() {
      // const allowedTypes = ["image/jpeg", "image/jpg", "image/png"];
      console.log("skck", event.target.files[0]);
      this.model.skck = event.target.files[0];
    },
    onSelectSert() {
      // const allowedTypes = ["image/jpeg", "image/jpg", "image/png"];
      console.log("sert", event.target.files[0]);
      this.model.sertifikat = event.target.files[0];
    },
  },
};
</script>

<style lang="scss">
@import "@/assets/main.scss";

.el-form-item__content .el-radio.is-bordered.is-checked {
  border-color: #07a148 !important;
}

.el-radio__input.is-checked .el-radio__inner {
  border-color: #07a148 !important;
  background: #07a148 !important;
}

.el-radio__input.is-checked + .el-radio__label {
  color: #07a148 !important;
}

.el-form-item.is-required .el-form-item__label {
  text-align: left;
  vertical-align: middle;
  float: left;
  display: block;
  font-size: 14px;
  color: #606266;
  width: 100%;
  padding: 0 12px 0 0;
}

.el-radio.is-bordered {
  padding: 12px 20px 0 10px;
  border-radius: 4px;
  border: 1px solid #dcdfe6;
  margin-right: 5px;
  box-sizing: border-box;
  height: 40px !important;
  width: 48%;
}

.is-focus input {
  border-color: #07a148 !important;
}

.el-input__inner:focus,
.el-textarea__inner:focus {
  border-color: #07a148 !important;
}

.el-form-item__content .custom-file {
  background-image: url("data:image/svg+xml,%3csvg width='100%25' height='100%25' xmlns='http://www.w3.org/2000/svg'%3e%3crect width='100%25' height='100%25' fill='none' rx='4' ry='4' stroke='%23E9E9E9FF' stroke-width='4' stroke-dasharray='8%2c 14' stroke-dashoffset='0' stroke-linecap='square'/%3e%3c/svg%3e");
  border-radius: 4px;
  height: 112px;
}

.btn.uploadBtn {
  position: absolute;
  width: 102px;
  height: 32px;
  left: 40%;
  top: 30%;
  line-height: 1;
  background: #ffffff;
  border: 1px solid #07a148;
  box-sizing: border-box;
  border-radius: 4px;
  span {
    font-style: normal;
    font-weight: 600;
    font-size: 12px;
    line-height: 16px;
    letter-spacing: 0.04em;
    transition: 0.2s;
    color: #07a148;
  }
}

.btn.uploadBtn:hover {
  border-color: $paz-secondary;
  span {
    color: $paz-secondary;
  }
}

p.uploaded {
  position: relative;
  text-align: center;
  top: 15px;
}
</style>
