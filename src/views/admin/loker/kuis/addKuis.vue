<template>
  <div class="addVisi">
    <b-row class="justify-content-center">
      <b-col md="10" sm="12">
        <b-card>
          <b-card-title class="text-left">Tambah Pertanyaan</b-card-title>
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
              prepend="Pertanyaan"
              class="mb-2 mt-4 mr-sm-2 mb-sm-0"
            >
              <b-form-input
                id="visi"
                v-model="form.pertanyaan"
                placeholder="Masukkan pertanyaan untuk kuis"
              ></b-form-input>
            </b-input-group>

            <b-input-group
              prepend="Pilihan A"
              class="mb-2 mt-4 mr-sm-2 mb-sm-0"
            >
              <b-form-input
                id="visi1"
                v-model="form.options.a"
                placeholder="Pilihan jawaban A"
              ></b-form-input>
            </b-input-group>

            <b-input-group
              prepend="Pilihan B"
              class="mb-2 mt-4 mr-sm-2 mb-sm-0"
            >
              <b-form-input
                id="visi9"
                v-model="form.options.b"
                placeholder="Pilihan jawaban B"
              ></b-form-input>
            </b-input-group>

            <b-input-group
              prepend="Pilihan C"
              class="mb-2 mt-4 mr-sm-2 mb-sm-0"
            >
              <b-form-input
                id="gaji"
                v-model="form.options.c"
                placeholder="Pilihan jawaban C"
              ></b-form-input>
            </b-input-group>

            <b-input-group
              prepend="Pilihan D"
              class="mb-2 mt-4 mr-sm-2 mb-sm-0"
            >
              <b-form-input
                id="visi5"
                v-model="form.options.d"
                placeholder="Pilihan jawaban D"
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
      visiUrl: "",

      form: {
        pertanyaan: "",
        options: {},
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
    this.visiUrl = mainUrl + "/kuis";
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
      this.form.pertanyaan = "";
      this.form.options = {};
      this.messages = "Pertanyaan ditambahkan";
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
