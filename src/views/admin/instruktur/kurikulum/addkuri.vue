<template>
  <div class="addTesti">
    <b-row class="justify-content-center">
      <b-col md="10" sm="12">
        <b-card>
          <b-card-title class="text-left">Tambah Kurikulum</b-card-title>
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
            <b-input-group prepend="Nama" class="mb-2 mt-4 mr-sm-2 mb-sm-0">
              <b-form-input
                id="name"
                v-model="formFields.name"
                required
              ></b-form-input>
            </b-input-group>

            <b-input-group
              prepend="Sub Judul"
              class="mb-2 mt-4 mr-sm-2 mb-sm-0"
            >
              <b-form-input
                id="subjudul"
                v-model="formFields.subtitle"
                placeholder="Ex: Wajib diikuti oleh siapapun yang ingin belajar terapi PAZ "
                required
              ></b-form-input>
            </b-input-group>

            <b-input-group prepend="Penyakit" class="mb-2 mt-4 mr-sm-2 mb-sm-0">
              <b-form-input
                id="subjudul"
                v-model="formFields.penyakit"
                placeholder="Ex: Koroner, jantung bengkak, aritmea, lemah jantung"
                required
              ></b-form-input>
            </b-input-group>

            <b-input-group prepend="Tipe" class="mb-2 mt-4 mr-sm-2 mb-sm-0">
              <b-form-select
                id="subjudulll"
                v-model="formFields.tipe"
                :options="tipe"
                required
              ></b-form-select>
            </b-input-group>

            <b-input-group class="mb-2 mt-4 mr-sm-2 mb-sm-0">
              <template #prepend>
                <b-input-group-text style="height: 38.63px"
                  >Deskripsi</b-input-group-text
                >
              </template>
              <ckeditor
                v-model="formFields.konten"
                :editor="editor"
                required
              ></ckeditor>
            </b-input-group>

            <b-input-group prepend="Foto" class="mb-2 mt-4 mr-sm-2 mb-sm-0">
              <b-form-file
                type="file"
                ref="foto"
                v-on:change="onSelect()"
                accept="image/jpeg, image/png, image/gif"
                name="image"
                :required="true"
                id="image"
              />
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
      tipe: [
        { text: "Tipe Materi", value: null },
        { text: "Basic", value: "basic" },
        { text: "Upgrading", value: "upgrading" },
        { text: "Pengayaan", value: "pengayaan" },
      ],
      formFields: {
        name: "",
        subtitle: "",
        penyakit: "",
        konten: null,
        tipe: null,
        img: null,
      },
      file: null,
      legalUrl: "",
      loading: "",
      dateNow: "",
      variant: "",
      dismissSecs: 5,
      dismissCountDown: 0,
      messages: "",
      editor: ClassicEditor,
    };
  },
  components: {
    ckeditor: CKEditor.component,
  },

  created() {
    const mainUrl = localStorage.getItem("apiUrl");
    this.legalUrl = mainUrl + "/kurikulum";
  },

  methods: {
    async onSubmit(e) {
      e.preventDefault();
      this.loading = true;
      let formData = new FormData();

      formData.append("name", this.formFields.name);
      formData.append("subtitle", this.formFields.subtitle);
      formData.append("penyakit", this.formFields.penyakit);
      formData.append("konten", this.formFields.konten);
      formData.append("tipe", this.formFields.tipe);
      formData.append("img", this.formFields.img);
      await axios
        .post(this.legalUrl, formData)
        .then((res) => {
          console.log(res);
          this.loading = false;
          this.messages = "Kurikulum tersimpan";
          this.variant = "success";
          this.showAlert();
          this.$root.$emit("getImg");
        })
        .catch((err) => {
          console.log(err);
        });
      this.formFields.name = "";
      this.formFields.subtitle = "";
      this.formFields.penyakit = "";
      this.formFields.konten = "";
      this.$refs.foto.reset();
      this.loading = false;
    },
    onSelect() {
      // const allowedTypes = ["image/jpeg", "image/jpg", "image/png"];
      // console.log();
      this.formFields.img = event.target.files[0];
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

.card-title {
  text-transform: capitalize;
}
</style>
