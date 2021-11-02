<template>
  <div class="addGaleri">
    <b-tabs class="w-100">
      <b-tab title="Tambah Galeri" active>
        <b-row class="justify-content-center">
          <b-col md="8" sm="12">
            <b-modal id="group-modal" hide-footer ref="group-modal">
              <template #modal-title>
                Tambah Group Galeri
              </template>
              <div class="d-block text-center">
                <b-form-group
                  label="Lokasi"
                  label-for="input-1"
                  class="text-left"
                >
                  <b-form-input
                    id="input-1"
                    v-model="group.lokasi"
                    required
                    type="text"
                    placeholder="Ex : Pelatihan PAZ Basic Surabaya"
                  ></b-form-input>
                </b-form-group>

                <b-form-group
                  class="text-left"
                  id="input-group-2"
                  label="Jarak Waktu"
                  label-for="input-2"
                >
                  <b-form-input
                    id="input-2"
                    v-model="group.date_range"
                    required
                    placeholder="Ex : 20 - 25 Oktober 2021"
                  ></b-form-input>
                </b-form-group>
                <b-form-group
                  class="text-left"
                  id="input-group-2"
                  label="Konten Grup"
                  label-for="input-2"
                >
                  <b-form-input
                    id="input-2"
                    v-model="group.konten"
                    required
                    placeholder="Ex : Pelatihan yang dilakukan dari tanggal X sampai tanggal Y"
                  ></b-form-input>
                </b-form-group>
              </div>
              <b-button variant="success" class="mt-3" block @click="addGroup"
                >Simpan Group</b-button
              >
            </b-modal>
            <b-card>
              <b-row>
                <b-col md="6">
                  <b-card-title class="text-left">Tambah Galeri</b-card-title>
                </b-col>
                <b-col md="6" class="text-right mb-2">
                  <b-button
                    variant="outline-success"
                    @click="$bvModal.show('group-modal')"
                    ><i class="fas fa-plus"></i> Group</b-button
                  >
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
                  prepend="Judul"
                  class="mb-2 mt-4 mr-sm-2 mb-sm-0"
                >
                  <b-form-input
                    id="name"
                    v-model="formFields.title"
                    required
                  ></b-form-input>
                </b-input-group>

                <b-input-group
                  prepend="Lokasi"
                  class="mb-2 mt-4 mr-sm-2 mb-sm-0"
                >
                  <b-form-select
                    id="lokasi"
                    v-model="formFields.lokasi"
                    :options="lokasi"
                    required
                  ></b-form-select>
                </b-input-group>

                <b-input-group
                  prepend="Jarak Waktu"
                  class="mb-2 mt-4 mr-sm-2 mb-sm-0"
                >
                  <b-form-select
                    id="jarak"
                    v-model="formFields.date_range"
                    :options="range"
                    required
                  ></b-form-select>
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
      </b-tab>
      <b-tab title="Grup Manajemen">
        <ListGroup></ListGroup>
      </b-tab>
    </b-tabs>
  </div>
</template>

<script>
import ListGroup from "./listGroup";
import axios from "axios";
export default {
  components: { ListGroup },
  data() {
    const now = new Date();
    const today = new Date(now.getFullYear(), now.getMonth(), now.getDate());
    const maxDate = new Date(today);
    maxDate.setMonth(maxDate.getMonth());

    return {
      groupUrl: "",
      group: {
        lokasi: "",
        date_range: "",
        konten: "",
      },
      formFields: {
        title: null,
        lokasi: "",
        status: "galeri",
        date_range: "",
        img: null,
      },
      max: maxDate,
      file: null,
      lokasi: [],
      range: [],
      posisi: [
        { text: "Landscape", value: "landscape" },
        { text: "Portrait", value: "portrait" },
      ],
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
    this.legalUrl = mainUrl + "/image";
    this.groupUrl = mainUrl + "/group";
    this.getGroup();
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
    async addGroup() {
      console.log(this.group);
      await axios.post(this.groupUrl, this.group);
      this.messages = "Grup ditambahkan!";
      this.variant = "success";
      this.group.lokasi = "";
      this.group.konten = "";
      this.group.date_range = "";
      this.$refs["group-modal"].hide();
      this.showAlert();
      this.$root.$emit("getGrub");
      this.getGroup();
    },
    async getGroup() {
      const resp = await axios.get(this.groupUrl);
      // console.log("grup", resp);
      const data = resp.data.data;
      this.lokasi = data.map((data) => data.lokasi);
      this.range = data.map((data) => data.date_range);
      // console.log(this.lokasi);
    },
    async onSubmit(e) {
      e.preventDefault();
      this.loading = true;
      let formData = new FormData();

      formData.append("title", this.formFields.title);
      formData.append("status", this.formFields.status);
      formData.append("lokasi", this.formFields.lokasi);
      formData.append("date_range", this.formFields.date_range);
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
      // this.formFields.date = this.dateNow;
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
