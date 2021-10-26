<template>
  <div class="addLiputan">
    <b-row class="justify-content-center">
      <b-col md="12" sm="12" class="d-flex flex-row justify-content-center">
        <b-card>
          <b-card-title class="text-left">Tambah Liputan media</b-card-title>
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
                id="title"
                v-model="formFields.title"
                required
              ></b-form-input>
            </b-input-group>

            <b-input-group prepend="Tag" class="mb-2 mt-4 mr-sm-2 mb-sm-0">
              <div
                class="tag"
                v-for="(t, index) in formFields.tag"
                :key="index"
              >
                <b-form-input
                  id="tag"
                  v-model="t.text"
                  required
                  placeholder="Masukan Tag"
                />
              </div>
              <b-button @click="pushTag" variant="outline-success" class="ml-2"
                ><i class="fas fa-plus"></i
              ></b-button>
              <b-button @click="resetTag" variant="outline-danger" class="ml-2"
                ><i class="fas fa-redo"></i
              ></b-button>
            </b-input-group>
            <!-- {{ formFields.tag }} -->
            <b-input-group
              prepend="Sub Judul"
              class="mb-2 mt-4 mr-sm-2 mb-sm-0"
            >
              <b-form-input
                id="subtitle"
                v-model="formFields.subtitle"
              ></b-form-input>
            </b-input-group>

            <b-input-group
              prepend="Tanggal"
              id="date"
              class="date mb-2 mt-4 mr-sm-2 mb-sm-0"
            >
              <date-picker
                v-model="formFields.date"
                :config="options"
              ></date-picker>
            </b-input-group>
            <!-- {{ formFields.date }} -->

            <b-input-group class="mb-2 mt-4 mr-sm-2 mb-sm-0">
              <template #prepend>
                <b-input-group-text style="height: 38.63px"
                  >Konten</b-input-group-text
                >
              </template>
              <ckeditor
                v-model="formFields.content"
                :editor="editor"
                required
              ></ckeditor>
            </b-input-group>

            <b-input-group prepend="Foto" class="mb-2 mt-4 mr-sm-2 mb-sm-0">
              <b-form-file
                type="file"
                required
                v-on:change="onSelect()"
                accept="image/jpeg, image/png, image/gif"
                name="image"
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

// DateTime picker
import "bootstrap/dist/css/bootstrap.css";
import datePicker from "vue-bootstrap-datetimepicker";
import "pc-bootstrap4-datetimepicker/build/css/bootstrap-datetimepicker.css";
import $ from "jquery";

$.extend(true, $.fn.datetimepicker.defaults, {
  icons: {
    time: "far fa-clock",
    date: "far fa-calendar",
    up: "fas fa-arrow-up",
    down: "fas fa-arrow-down",
    previous: "fas fa-chevron-left",
    next: "fas fa-chevron-right",
    today: "fas fa-calendar-check",
    clear: "far fa-trash-alt",
    close: "far fa-times-circle",
  },
});
export default {
  data() {
    const now = new Date();
    const today = new Date(now.getFullYear(), now.getMonth(), now.getDate());
    const maxDate = new Date(today);
    maxDate.setMonth(maxDate.getMonth());
    return {
      options: {
        format: "DD-MM-YYYY HH:mm:ss",
        useCurrent: false,
        showClear: true,
        showClose: true,
      },

      formFields: {
        title: null,
        subtitle: null,
        date: "tanggal",
        content: null,
        tag: [{ text: "" }],
        user_id: null,
        img: null,
      },
      max: maxDate,
      editor: ClassicEditor,
      file: null,
      legalUrl: "",
      dateNow: "",
      loading: "",
      variant: "",
      dismissSecs: 5,
      dismissCountDown: 0,
      messages: "",
    };
  },

  components: {
    ckeditor: CKEditor.component,
    datePicker,
  },

  created() {
    const mainUrl = localStorage.getItem("apiUrl");
    const user = JSON.parse(localStorage.getItem("auth"));
    // console.log(user.user.id);
    this.formFields.user_id = user.user.id;
    this.legalUrl = mainUrl + "/liputan";

    var d = new Date();
    var datestring =
      d.getFullYear() +
      "-" +
      ("0" + (d.getMonth() + 1)).slice(-2) +
      "-" +
      ("0" + d.getDate()).slice(-2);
    // console.log(datestring);
    // 16-05-2015 09:50
    this.formFields.date = datestring;
    this.dateNow = datestring;
  },

  methods: {
    pushTag() {
      this.formFields.tag.push({ text: "" });
    },
    resetTag() {
      this.formFields.tag = [{ text: "" }];
    },
    async onSubmit(e) {
      e.preventDefault();
      this.loading = true;
      let formData = new FormData();

      formData.append("title", this.formFields.title);
      formData.append("subtitle", this.formFields.subtitle);
      formData.append("date", this.formFields.date);
      formData.append("content", this.formFields.content);
      formData.append("user_id", this.formFields.user_id);
      formData.append("tag", JSON.stringify(this.formFields.tag));
      formData.append("img", this.formFields.img);
      await axios
        .post(this.legalUrl, formData)
        .then((res) => {
          console.log(res);
          this.loading = false;
          this.messages = "Liputan tersimpan";
          this.variant = "success";
          this.showAlert();
          this.$root.$emit("getImg");
        })
        .catch((err) => {
          console.log(err);
        });
      this.formFields.title = "";
      this.formFields.subtitle = "";
      this.formFields.date = this.dateNow;
      this.formFields.content = "";
      this.formFields.tag = [{ text: "" }];
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
