<template>
  <div class="addLegal">
    <b-row class="justify-content-center">
      <b-col md="8" sm="12">
        <b-card>
          <b-card-title class="text-left">Tambah Struktur</b-card-title>
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
                placeholder="Nama pemegang jabatan"
                required
              ></b-form-input>
            </b-input-group>

            <b-input-group prepend="Jabatan" class="mb-2 mt-4 mr-sm-2 mb-sm-0">
              <b-form-input
                id="address"
                v-model="formFields.title"
                placeholder="Nama Jabatan"
                required
              ></b-form-input>
            </b-input-group>

            <b-input-group prepend="Telepon" class="mb-2 mt-4 mr-sm-2 mb-sm-0">
              <b-form-input
                id="telp"
                v-model="formFields.telp"
                placeholder="ex : 0812121212"
                required
              ></b-form-input>
            </b-input-group>
            <b-input-group prepend="NIP" class="mb-2 mt-4 mr-sm-2 mb-sm-0">
              <b-form-input
                id="telp"
                v-model="formFields.nip"
                placeholder="Nomor induk PAZ"
                required
              ></b-form-input>
            </b-input-group>
            <b-input-group prepend="Prefix" class="mb-2 mt-4 mr-sm-2 mb-sm-0">
              <b-form-select
                id="jarak"
                v-model="formFields.prefix"
                :options="prefix"
                required
              ></b-form-select>
            </b-input-group>

            <b-input-group prepend="Image" class="mb-2 mt-4 mr-sm-2 mb-sm-0">
              <b-form-file
                type="file"
                v-on:change="onSelect()"
                accept="image/jpeg, image/png, image/gif"
                name="image"
                id="image"
                required
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
import axios from "axios";
export default {
  data() {
    return {
      prefix: [
        { text: "Kode Jabatan", value: "null" },
        { text: "Direktur", value: "direktur" },
        { text: "Pelatih", value: "pelatih" },
        { text: "Operasional", value: "operasional" },
        { text: "Finance", value: "finance" },
        { text: "Human Capital", value: "human" },
        { text: "Marketing", value: "marketing" },
      ],
      formFields: {
        name: null,
        title: null,
        telp: null,
        nip: null,
        prefix: null,
        img: null,
      },
      file: null,
      legalUrl: "",
      loading: "",
      variant: "",
      dismissSecs: 5,
      dismissCountDown: 0,
      messages: "",
    };
  },

  created() {
    const mainUrl = localStorage.getItem("apiUrl");
    this.legalUrl = mainUrl + "/struktur";
  },

  methods: {
    async onSubmit(e) {
      e.preventDefault();
      this.loading = true;
      let formData = new FormData();

      formData.append("name", this.formFields.name);
      formData.append("title", this.formFields.title);
      formData.append("telp", this.formFields.telp);
      formData.append("nip", this.formFields.nip);
      formData.append("prefix", this.formFields.prefix);
      formData.append("img", this.formFields.img);
      await axios
        .post(this.legalUrl, formData)
        .then((res) => {
          console.log(res);
          this.loading = false;
          this.messages = "Legalitas tersimpan";
          this.variant = "success";
          this.showAlert();
          this.$root.$emit("getImg");
        })
        .catch((err) => {
          console.log(err);
        });
      this.formFields.name = "";
      this.formFields.title = "";
      this.formFields.telp = "";
      this.formFields.nip = "";
      this.formFields.prefix = null;
      this.formFields.img = "";
      this.loading = false;
    },
    onSelect() {
      // const allowedTypes = ["image/jpeg", "image/jpg", "image/png"];
      this.formFields.img = event.target.files[0];
      console.log(this.formFields.img);
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

.card-title {
  text-transform: capitalize;
}
</style>
