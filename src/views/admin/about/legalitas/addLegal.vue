<template>
  <div class="addLegal">
    <b-row class="justify-content-center">
      <b-col md="8" sm="12">
        <b-card>
          <b-card-title class="text-left">Tambah Legalitas</b-card-title>
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

            <b-input-group prepend="Instansi" class="mb-2 mt-4 mr-sm-2 mb-sm-0">
              <b-form-input
                id="instansi"
                v-model="formFields.instansi"
                required
              ></b-form-input>
            </b-input-group>

            <b-input-group prepend="Image" class="mb-2 mt-4 mr-sm-2 mb-sm-0">
              <b-form-file
                type="file"
                v-on:change="onSelect()"
                accept="image/jpeg, image/png, image/gif"
                name="image"
                required
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
import axios from "axios";
export default {
  data() {
    return {
      formFields: {
        name: null,
        instansi: null,
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
    this.legalUrl = mainUrl + "/legal";
  },

  methods: {
    async onSubmit(e) {
      e.preventDefault();
      this.loading = true;
      let formData = new FormData();

      formData.append("name", this.formFields.name);
      formData.append("instansi", this.formFields.instansi);
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
      this.formFields.instansi = "";
      this.formFields.img = "";
      this.loading = false;
    },
    onSelect() {
      // const allowedTypes = ["image/jpeg", "image/jpg", "image/png"];
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

.card-title {
  text-transform: capitalize;
}
</style>
