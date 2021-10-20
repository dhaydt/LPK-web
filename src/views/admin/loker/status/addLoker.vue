<template>
  <div class="addVisi">
    <b-row class="justify-content-center">
      <b-col md="10" sm="12">
        <b-card>
          <b-card-title class="text-left"
            >Tambah Lowongan Pekerjaan</b-card-title
          >
          <b-alert
            :show="dismissCountDown"
            dismissible
            :variant="variant"
            @dismissed="dismissCountDown = 0"
            @dismiss-count-down="countDownChanged"
          >
            <p>{{ messages }}</p>
            <b-progress
              variant="warning"
              :max="dismissSecs"
              :value="dismissCountDown"
              height="4px"
            ></b-progress>
          </b-alert>
          <b-form @submit="onSubmit">
            <b-input-group prepend="Judul" class="mb-2 mt-4 mr-sm-2 mb-sm-0">
              <b-form-input id="visi" v-model="form.judul"></b-form-input>
            </b-input-group>

            <b-input-group prepend="Bidang" class="mb-2 mt-4 mr-sm-2 mb-sm-0">
              <b-form-input
                id="visi1"
                v-model="form.bidang"
                placeholder="Bidang pekerjaan, Ex: Informatika, Akutansi, Gudang, Design"
              ></b-form-input>
            </b-input-group>

            <b-input-group prepend="Kriteria" class="mb-2 mt-4 mr-sm-2 mb-sm-0">
              <b-form-input
                id="visi9"
                v-model="form.kriteria"
                placeholder="Kriteria singkat"
              ></b-form-input>
            </b-input-group>

            <b-input-group
              prepend="Deskripsi"
              class="mb-2 mt-4 mr-sm-2 mb-sm-0"
            >
              <ckeditor
                v-model="form.deskripsi"
                :editor="editor"
                required
              ></ckeditor>
            </b-input-group>

            <b-input-group
              prepend="Kualifikasi"
              class="mb-2 mt-4 mr-sm-2 mb-sm-0"
            >
              <ckeditor
                v-model="form.kualifikasi"
                :editor="editor"
                required
                des
              ></ckeditor>
            </b-input-group>

            <b-input-group
              prepend="Jenis"
              class="mb-2 mt-4 mb-sm-0"
              v-slot="{ ariaDescribedby }"
            >
              <b-row style="width: 85%">
                <b-col>
                  <b-form-checkbox-group
                    id="checkbox-group-1"
                    v-model="form.jenis"
                    class="form-control"
                    :options="jenis"
                    :aria-describedby="ariaDescribedby"
                    name="jenis"
                  ></b-form-checkbox-group>
                </b-col>
                <b-col md="12">
                  <strong class="form-control">{{ form.jenis }}</strong>
                </b-col>
              </b-row>
            </b-input-group>

            <b-input-group prepend="Gaji" class="mb-2 mt-4 mr-sm-2 mb-sm-0">
              <b-form-input
                id="gaji"
                v-model="form.gaji"
                placeholder="Kisaran gaji"
              ></b-form-input>
            </b-input-group>

            <b-input-group
              prepend="Expire"
              id="date"
              class="date mb-2 mt-4 mr-sm-2 mb-sm-0"
            >
              <b-form-datepicker
                id="example-datepicker"
                v-model="form.deadline"
                placeholder="Batas waktu lamaran"
                class="mb-2"
              ></b-form-datepicker>
            </b-input-group>

            <b-input-group prepend="Note" class="mb-2 mt-4 mr-sm-2 mb-sm-0">
              <b-form-input
                id="visi5"
                v-model="form.note"
                placeholder="Catatan untuk pelamar"
              ></b-form-input>
            </b-input-group>

            <b-input-group prepend="Alamat" class="mb-2 mt-4 mr-sm-2 mb-sm-0">
              <b-form-input
                id="visi6"
                v-model="form.alamat"
                placeholder="Alamat kantor"
              ></b-form-input>
            </b-input-group>

            <b-input-group
              prepend="Pengalaman"
              class="mb-2 mt-4 mr-sm-2 mb-sm-0"
            >
              <b-form-input
                id="misi"
                v-model="form.pengalaman"
                placeholder="Pengalaman kerja, Ex: 2 Tahun"
              ></b-form-input>
            </b-input-group>

            <b-button type="submit" variant="success" class="mt-4"
              ><div v-if="loading">
                <b-spinner small variant="primary"></b-spinner> Menyimpan...
              </div>
              <span v-if="!loading"
                ><i class="fa fa-save"></i> Simpan</span
              ></b-button
            >
          </b-form>
        </b-card>
      </b-col>
    </b-row>
  </div>
</template>

<script>
import CKEditor from "@ckeditor/ckeditor5-vue";
import ClassicEditor from "@ckeditor/ckeditor5-build-classic";
import axios from "axios";
export default {
  data() {
    return {
      visiUrl: "",
      jenis: [
        { text: "Paruh waktu", value: "Paruh waktu" },
        { text: "Penuh waktu", value: "Penuh waktu" },
        { text: "Fresh graduate", value: "Fresh Graduate" },
        { text: "Kontrak", value: "Kontrak" },
      ],
      form: {
        judul: "",
        bidang: "",
        kriteria: "",
        deskripsi: "",
        kualifikasi: "",
        jenis: [],
        gaji: "Rp. ",
        note: "",
        deadline: "",
        alamat: "",
        pengalaman: "",
      },
      editor: ClassicEditor,
      loading: "",
      variant: "",
      dismissSecs: 5,
      dismissCountDown: 0,
      messages: "",
    };
  },

  components: {
    ckeditor: CKEditor.component,
  },

  created() {
    const mainUrl = localStorage.getItem("apiUrl");
    this.visiUrl = mainUrl + "/loker";
  },

  methods: {
    async onSubmit(e) {
      e.preventDefault();
      this.loading = true;
      try {
        const resp = await axios.post(this.visiUrl, this.form);
        console.log(resp);
      } catch (err) {
        console.log(err);
      }
      this.form.judul = "";
      this.form.bidang = "";
      this.form.kriteria = "";
      this.form.deskripsi = "";
      this.form.kualifikasi = "";
      this.form.jenis = [];
      this.form.gaji = "";
      this.form.note = "";
      this.form.deadline = "";
      this.form.alamat = "";
      this.form.pengalaman = "";
      this.messages = "Data tersimpan";
      this.variant = "success";
      this.loading = false;
      this.showAlert();
      this.$root.$emit("getVisi");
    },

    countDownChanged(dismissCountDown) {
      this.dismissCountDown = dismissCountDown;
    },
    showAlert() {
      this.dismissCountDown = this.dismissSecs;
    },
  },
};
</script>

<style lang="scss" scoped>
.input-group-prepend {
  margin-right: -1px;
  display: flex;
  .input-group-text {
    min-width: 100px;
  }
}

#date.date .input-group-prepend .input-group-text {
  height: 38px;
}
</style>
