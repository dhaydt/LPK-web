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
                v-model="form.text"
                placeholder="Masukkan pertanyaan untuk kuis"
                required
              ></b-form-input>
            </b-input-group>

            <b-input-group
              prepend="Pilihan A"
              class="mb-2 mt-4 mr-sm-2 mb-sm-0"
            >
              <b-form-input
                id="visi1"
                v-model="form.responses[0].text"
                placeholder="Pilihan jawaban A"
                required
              ></b-form-input>
              <b-form-checkbox
                id="checkbox-1"
                class="mt-2 ml-2 check"
                v-model="form.responses[0].correct"
                name="checkbox-1"
                :value="true"
                :unchecked-value="false"
              >
                check jika benar
              </b-form-checkbox>
            </b-input-group>

            <b-input-group
              prepend="Pilihan B"
              class="mb-2 mt-4 mr-sm-2 mb-sm-0"
            >
              <b-form-input
                id="visi9"
                v-model="form.responses[1].text"
                placeholder="Pilihan jawaban B"
                required
              ></b-form-input>

              <b-form-checkbox
                id="checkbox-2"
                class="mt-2 ml-2 check"
                v-model="form.responses[1].correct"
                name="checkbox-1"
                :value="true"
                :unchecked-value="false"
              >
                check jika benar
              </b-form-checkbox>
            </b-input-group>

            <b-input-group
              prepend="Pilihan C"
              class="mb-2 mt-4 mr-sm-2 mb-sm-0"
            >
              <b-form-input
                id="gaji"
                v-model="form.responses[2].text"
                placeholder="Pilihan jawaban C"
                required
              ></b-form-input>
              <b-form-checkbox
                id="checkbox-3"
                class="mt-2 ml-2 check"
                v-model="form.responses[2].correct"
                name="checkbox-1"
                :value="true"
                :unchecked-value="false"
              >
                check jika benar
              </b-form-checkbox>
            </b-input-group>

            <b-input-group
              prepend="Pilihan D"
              class="mb-2 mt-4 mr-sm-2 mb-sm-0"
            >
              <b-form-input
                id="visi5"
                v-model="form.responses[3].text"
                placeholder="Pilihan jawaban D"
                required
              ></b-form-input>
              <b-form-checkbox
                id="checkbox-4"
                class="mt-2 ml-2 check"
                v-model="form.responses[3].correct"
                name="checkbox-1"
                :value="true"
                :unchecked-value="false"
              >
                check jika benar
              </b-form-checkbox>
            </b-input-group>

            <b-input-group prepend="Status" class="mb-2 mt-4 mr-sm-2 mb-sm-0">
              <b-form-select
                v-model="form.status"
                :options="status"
                selected="null"
                required
              ></b-form-select>
            </b-input-group>
            <!-- <pre>{{ form }} </pre> -->
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
      status: [
        { value: null, text: "Pilih status pertanyaan" },
        { value: "on", text: "Aktif" },
        { value: "off", text: "Non Aktif" },
      ],

      form: {
        text: "",
        responses: [{ text: "" }, { text: "" }, { text: "" }, { text: "" }],
        options: {
          a: "",
          b: "",
          c: "",
          d: "",
        },
        jawaban: null,
        status: null,
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
      this.form.text = "";
      this.form.options = {};
      this.form.jawaban = null;
      this.form.status = null;
      this.form.responses[0].text = "";
      this.form.responses[1].text = "";
      this.form.responses[2].text = "";
      this.form.responses[3].text = "";
      this.messages = "Pertanyaan ditambahkan";
      this.variant = "success";
      this.loading = false;
      window.scrollTo(0, 0);
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

.note {
  color: #a8a8a8;
}
</style>
