<template>
  <div class="addVisi">
    <b-row class="justify-content-center">
      <b-col md="8" sm="12">
        <b-card>
          <b-card-title class="text-left">Tambah Visi / Misi</b-card-title>
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
            <b-input-group prepend="Visi" class="mb-2 mt-4 mr-sm-2 mb-sm-0">
              <b-form-input id="visi" v-model="form.visi"></b-form-input>
            </b-input-group>

            <b-input-group prepend="Misi" class="mb-2 mt-4 mr-sm-2 mb-sm-0">
              <b-form-input id="misi" v-model="form.misi"></b-form-input>
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
      visiUrl: "",
      form: {
        visi: "",
        misi: "",
      },
      loading: "",
      variant: "",
      dismissSecs: 5,
      dismissCountDown: 0,
      messages: "",
    };
  },

  created() {
    const mainUrl = localStorage.getItem("apiUrl");
    this.visiUrl = mainUrl + "/visi";
  },

  methods: {
    async onSubmit(e) {
      e.preventDefault();
      this.loading = true;
      if (this.form.misi == "" && this.form.visi == "") {
        console.log("null");
        this.loading = false;
        this.messages = "Isi salah satu antara visi / misi";
        this.variant = "danger";
        this.showAlert();
      } else {
        console.log("not null", this.form);
        try {
          const resp = await axios.post(this.visiUrl, this.form);
          console.log(resp);
        } catch (err) {
          console.log(err);
        }
        this.form.visi = "";
        this.form.misi = "";
        this.messages = "Data tersimpan";
        this.variant = "success";
        this.loading = false;
        this.showAlert();
        this.$root.$emit("getVisi");
      }
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
</style>
