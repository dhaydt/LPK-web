<template>
  <div class="addGaleri">
    <b-tabs class="w-100">
      <b-tab title="Tambah Galeri" active>
        <b-row class="justify-content-center">
          <b-col md="8" sm="12">
            <b-modal id="group-modal" hide-footer ref="group-modal">
              <template #modal-title>
                Tambah Group Timeline
              </template>
              <div class="d-block text-center">
                <b-form-group
                  label="Bulan"
                  label-for="input-1"
                  class="text-left"
                >
                  <b-form-input
                    id="input-1"
                    v-model="group.bulan"
                    required
                    type="text"
                    placeholder="Ex : Januari 2021"
                  ></b-form-input>
                </b-form-group>
                <b-form-group
                  label="Status"
                  label-for="input-1"
                  class="text-left"
                >
                  <b-form-select
                    id="input-1"
                    v-model="group.status"
                    :options="status"
                    required
                    type="text"
                  ></b-form-select>
                </b-form-group>
              </div>
              <b-button variant="success" class="mt-3" block @click="addGroup"
                >Simpan Group</b-button
              >
            </b-modal>
            <b-card>
              <b-row>
                <b-col md="6">
                  <b-card-title class="text-left"
                    >Tambah Pelatihan</b-card-title
                  >
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
                  prepend="Bulan"
                  class="mb-2 mt-4 mr-sm-2 mb-sm-0"
                >
                  <b-form-select
                    id="lokasi"
                    v-model="formFields.bulan"
                    :options="lokasi"
                    required
                  ></b-form-select>
                </b-input-group>

                <b-input-group
                  prepend="Lokasi"
                  class="mb-2 mt-4 mr-sm-2 mb-sm-0"
                >
                  <b-form-input
                    id="lokasi"
                    v-model="formFields.lokasi"
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

                <b-input-group
                  prepend="Jarak Waktu"
                  class="mb-2 mt-4 mr-sm-2 mb-sm-0"
                >
                  <b-form-input
                    id="jarak"
                    v-model="formFields.date_range"
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
        bulan: "",
        status: null,
      },
      formFields: {
        title: null,
        lokasi: "",
        bulan: null,
        url: "",
        date_range: "",
        img: null,
      },
      max: maxDate,
      file: null,
      lokasi: [{ text: "Pilih Bulan Event", value: null }],
      range: [],
      status: [
        { text: "Pilih Aktif untuk ditampilkan di home", value: "null" },
        { text: "Aktif", value: "on" },
        { text: "Non Aktif", value: "off" },
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
    this.legalUrl = mainUrl + "/timeline";
    this.groupUrl = mainUrl + "/timelineGroup";
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
      this.group.bulan = "";
      this.group.status = null;
      this.$refs["group-modal"].hide();
      this.showAlert();
      this.$root.$emit("getGrub");
      this.getGroup();
    },
    async getGroup() {
      const resp = await axios.get(this.groupUrl);
      // console.log("grup", resp);
      const data = resp.data.data;
      const option = data.map((b) => b.bulan);
      // this.lokasi.push(option);
      this.lokasi = option;
      console.log(this.lokasi);
    },
    async onSubmit(e) {
      e.preventDefault();
      this.loading = true;
      let formData = new FormData();

      formData.append("title", this.formFields.title);
      formData.append("bulan", this.formFields.bulan);
      formData.append("lokasi", this.formFields.lokasi);
      formData.append("date_range", this.formFields.date_range);
      formData.append("url", this.formFields.url);
      formData.append("img", this.formFields.img);
      await axios
        .post(this.legalUrl, formData)
        .then((res) => {
          console.log(res);
          this.loading = false;
          this.messages = "Pelatihan tersimpan";
          this.variant = "success";
          this.showAlert();
          this.$root.$emit("getImg");
        })
        .catch((err) => {
          console.log(err);
        });
      this.formFields.title = "";
      this.formFields.bulan = null;
      this.formFields.lokasi = "";
      this.formFields.url = "";
      this.formFields.date_range = "";
      // this.formFields.date = this.dateNow;
      // this.formFields.img = "";
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
