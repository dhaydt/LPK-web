<template>
  <div class="addTesti">
    <b-row class="justify-content-center">
      <b-col md="8" sm="12">
        <b-card>
          <b-card-title class="text-left">Tambah Testimoni</b-card-title>
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

            <b-input-group prepend="Alamat" class="mb-2 mt-4 mr-sm-2 mb-sm-0">
              <b-form-input
                id="address"
                v-model="formFields.address"
                required
              ></b-form-input>
            </b-input-group>

            <b-input-group
              prepend="Testimoni"
              class="mb-2 mt-4 mr-sm-2 mb-sm-0"
            >
              <b-form-textarea
                id="subjudul"
                v-model="formFields.content"
                required
              ></b-form-textarea>
            </b-input-group>

            <b-input-group prepend="Tipe" class="mb-2 mt-4 mr-sm-2 mb-sm-0">
              <b-form-select
                v-model="formFields.tipe"
                :options="tipe"
                required
              ></b-form-select>
            </b-input-group>

            <b-input-group
              prepend="Foto"
              v-if="formFields.tipe == `image`"
              class="mb-2 mt-4 mr-sm-2 mb-sm-0"
            >
              <b-form-file
                type="file"
                v-on:change="onSelect()"
                accept="image/jpeg, image/png, image/gif"
                name="image"
                :required="true"
                id="image"
              />
            </b-input-group>

            <b-input-group
              prepend="URL Youtube"
              v-if="formFields.tipe == `video`"
              class="mb-2 mt-4 mr-sm-2 mb-sm-0"
            >
              <b-form-input
                v-model="formFields.video"
                placeholder="ex: https://www.youtube.com/watch?v=3iRbrV36h7I"
                required
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
import axios from "axios";
export default {
  data() {
    return {
      formFields: {
        name: "",
        tipe: "null",
        video: "",
        address: "",
        content: "",
        img: null,
      },
      tipe: [
        { text: "Pilih tipe profil", value: "null" },
        { text: "Image", value: "image" },
        { text: "Youtube", value: "video" },
      ],
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
    this.legalUrl = mainUrl + "/testi";
  },

  methods: {
    async onSubmit(e) {
      e.preventDefault();
      this.loading = true;
      let formData = new FormData();

      formData.append("name", this.formFields.name);
      formData.append("address", this.formFields.address);
      formData.append("content", this.formFields.content);
      formData.append("img", this.formFields.img);
      formData.append("video", this.formFields.video);
      formData.append("tipe", this.formFields.tipe);
      await axios
        .post(this.legalUrl, formData)
        .then((res) => {
          console.log(res);
          this.loading = false;
          this.messages = "Testimoni tersimpan";
          this.variant = "success";
          this.showAlert();
          this.$root.$emit("getImg");
        })
        .catch((err) => {
          console.log(err);
        });
      this.formFields.name = "";
      this.formFields.address = "";
      this.formFields.content = "";
      this.formFields.video = "";
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
