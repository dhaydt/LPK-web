<template>
  <div class="addPelatihan">
    <b-row class="justify-content-center">
      <b-col md="8" sm="12">
        <b-card>
          <b-card-title class="text-left">Tambah Pelatihan</b-card-title>
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
              <b-form-input
                id="name"
                v-model="formFields.title"
                placeholder="Nama pelatihan"
                required
              ></b-form-input>
            </b-input-group>

            <b-input-group prepend="Jenis" class="mb-2 mt-4 mr-sm-2 mb-sm-0">
              <b-form-select
                v-model="formFields.jenis"
                :options="options"
                required
              ></b-form-select>
            </b-input-group>

            <b-input-group
              prepend="Sub Judul"
              class="mb-2 mt-4 mr-sm-2 mb-sm-0"
            >
              <b-form-input
                id="subjudul"
                v-model="formFields.subtitle"
                placeholder="Keterangan pelatihan"
              ></b-form-input>
            </b-input-group>

            <b-input-group prepend="Tempat" class="mb-2 mt-4 mr-sm-2 mb-sm-0">
              <b-form-input
                id="tempat"
                v-model="formFields.tempat"
                placeholder="Tempat pelatihan"
                required
              ></b-form-input>
            </b-input-group>

            <b-input-group
              prepend="Waktu"
              id="date"
              class="date mb-2 mt-4 mr-sm-2 mb-sm-0"
            >
              <b-form-datepicker
                id="example-datepicker"
                v-model="formFields.waktu"
                class="mb-2"
              ></b-form-datepicker>
            </b-input-group>

            <b-input-group
              prepend="Waktu Akses"
              class="mb-2 mt-4 mr-sm-2 mb-sm-0"
            >
              <b-form-input
                id="akses"
                v-model="formFields.akses"
                placeholder="Waktu akses pelatihan"
                required
              ></b-form-input>
            </b-input-group>

            <b-input-group prepend="Berlaku" class="mb-2 mt-4 mr-sm-2 mb-sm-0">
              <b-form-input
                id="berlaku"
                v-model="formFields.expire"
                placeholder="Masa berlaku pelatihan"
                required
              ></b-form-input>
            </b-input-group>

            <b-input-group prepend="URL" class="mb-2 mt-4 mr-sm-2 mb-sm-0">
              <b-form-input
                id="url"
                v-model="formFields.url"
                placeholder="ex: https://www.facebook.com"
                required
              ></b-form-input>
            </b-input-group>

            <b-input-group prepend="Foto" class="mb-2 mt-4 mr-sm-2 mb-sm-0">
              <b-form-file
                type="file"
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
import axios from "axios";
export default {
  data() {
    return {
      selected: "null",
      options: [
        { value: null, text: "Pilih jenis pelatihan" },
        { value: "offline", text: "Offline" },
        { value: "online", text: "Online" },
      ],
      formFields: {
        title: null,
        jenis: null,
        subtitle: "",
        tempat: "",
        waktu: "",
        akses: "",
        expire: "",
        url: "",
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
    };
  },

  created() {
    const mainUrl = localStorage.getItem("apiUrl");
    this.legalUrl = mainUrl + "/pelatihan";
  },

  methods: {
    async onSubmit(e) {
      e.preventDefault();
      this.loading = true;
      let formData = new FormData();

      formData.append("title", this.formFields.title);
      formData.append("jenis", this.formFields.jenis);
      formData.append("subtitle", this.formFields.subtitle);
      formData.append("tempat", this.formFields.tempat);
      formData.append("waktu", this.formFields.waktu);
      formData.append("akses", this.formFields.akses);
      formData.append("expire", this.formFields.expire);
      formData.append("url", this.formFields.url);
      formData.append("img", this.formFields.img);
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
      this.formFields.jenis = null;
      this.formFields.subtitle = "";
      this.formFields.tempat = "";
      this.formFields.waktu = "";
      this.formFields.akses = "";
      this.formFields.expire = "";
      this.formFields.url = "";
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

#date.date .input-group-prepend .input-group-text {
  height: 38px;
}

.card-title {
  text-transform: capitalize;
}
</style>
