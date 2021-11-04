<template>
  <div class="addGaleri">
    <b-row class="justify-content-center">
      <b-col md="8" sm="12">
        <b-card>
          <b-row>
            <b-col md="6">
              <b-card-title class="text-left">Tambah Galeri</b-card-title>
            </b-col>
          </b-row>
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
            <b-input-group
              prepend="Judul Group"
              class="mb-2 mt-4 mr-sm-2 mb-sm-0"
            >
              <b-form-input
                id="name"
                v-model="formFields.title"
                required
              ></b-form-input>
            </b-input-group>

            <b-input-group
              prepend="Deskripsi Group"
              class="mb-2 mt-4 mr-sm-2 mb-sm-0"
            >
              <b-form-input v-model="formFields.desc" required></b-form-input>
            </b-input-group>
            <b-input-group prepend="Tanggal" class="mb-2 mt-4 mr-sm-2 mb-sm-0">
              <b-form-input
                id="date"
                v-model="formFields.date"
                required
              ></b-form-input>
            </b-input-group>

            <b-input-group prepend="Foto" class="mb-2 mt-4 mr-sm-2 mb-sm-0">
              <b-form-file
                type="file"
                ref="imgs"
                v-on:change="onSelect()"
                accept="image/jpeg, image/png, image/gif"
                name="image"
                multiple
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
import axios from "axios";
export default {
  data() {
    return {
      formFields: {
        title: null,
        date: "",
        desc: "",
        img: [],
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
    this.legalUrl = mainUrl + "/image";
  },

  methods: {
    async onSubmit(e) {
      e.preventDefault();
      this.loading = true;
      let formData = new FormData();

      formData.append("title", this.formFields.title);
      formData.append("desc", this.formFields.desc);
      formData.append("date", this.formFields.date);
      for (var i = 0; i < this.formFields.img.length; i++) {
        var file = this.formFields.img[i];
        formData.append(`img`, file, file.name);
      }
      console.log(formData);
      await axios
        .post(this.legalUrl, formData)
        .then((res) => {
          console.log(res);
          this.loading = false;
          this.messages = "Galeri tersimpan";
          this.variant = "success";
          this.showAlert();
          this.$root.$emit("getImg");
        })
        .catch((err) => {
          console.log(err);
        });
      this.formFields.title = "";
      this.formFields.date = "";
      this.formFields.desc = "";
      this.$refs.imgs.reset();
      this.formFields.img = [];
      this.loading = false;
    },
    onSelect() {
      // const allowedTypes = ["image/jpeg", "image/jpg", "image/png"];
      // this.formFields.img = event.target.files[0];
      var files = event.target.files;
      for (var i = 0; i < files.length; i++) {
        var file = files[i];
        this.formFields.img.push(file);
      }
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

#date.date .input-group-prepend .input-group-text {
  height: 38px;
}

.card-title {
  text-transform: capitalize;
}
</style>
