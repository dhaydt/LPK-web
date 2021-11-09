<template>
  <div class="dash">
    <Header :title="title" :items="items"></Header>
    <b-card>
      <b-card-title>Setting Notifikasi</b-card-title>
      <b-card>
        <b-alert
          :show="dismissCountDown"
          dismissible
          variant="success"
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
        <b-row class="justify-content-end w-100">
          <b-button
            v-b-tooltip.hover
            title="Edit Notifikasi"
            class="rounded-circle text-center"
            @click="edit(data)"
            variant="success"
          >
            <i class="fas fa-edit"></i>
          </b-button>
        </b-row>
        <b-form class="text-left">
          <b-form-group label="Kata pembuka">
            <b-form-input readonly :value="data.pembuka"> </b-form-input>
          </b-form-group>
          <b-form-group label="Notifikasi Proses ADM">
            <b-form-input readonly :value="data.proses">
            </b-form-input> </b-form-group
          ><b-form-group label="Notifikasi Interview">
            <b-form-input readonly :value="data.interview">
            </b-form-input> </b-form-group
          ><b-form-group label="Notifikasi Pengumuman">
            <b-form-input readonly :value="data.pengumuman"> </b-form-input>
          </b-form-group>
        </b-form>
      </b-card>
      <b-modal ref="users" id="users" hide-footer title="Edit Notifikasi">
        <div class="d-block text-left">
          <b-form-group
            id="input-group-1"
            label="Kata Pembukaan"
            label-for="input-1"
          >
            <b-form-input
              id="input-1"
              v-model="editData.pembuka"
              type="text"
              required
            ></b-form-input>
          </b-form-group>

          <b-form-group
            id="input-group-11"
            label="Proses ADM"
            label-for="input-11"
          >
            <b-form-input
              id="input-11"
              v-model="editData.proses"
              type="text"
              required
            ></b-form-input>
          </b-form-group>
          <b-form-group label="Interview">
            <b-form-input
              v-model="editData.interview"
              type="text"
              required
            ></b-form-input>
          </b-form-group>
          <b-form-group label="Pengumuman">
            <b-form-input
              v-model="editData.pengumuman"
              type="text"
              required
            ></b-form-input>
          </b-form-group>
        </div>
        <!-- <b-button class="mt-3" variant="outline-danger" block @click="hideModal">Close Me</b-button> -->
        <b-button
          class="mt-4"
          variant="outline-success"
          block
          @click="SaveUsers"
          >Simpan</b-button
        >
      </b-modal>
    </b-card>
  </div>
</template>

<script>
import axios from "axios";
import Header from "../../../components/admin/partials/page-header.vue";
export default {
  data() {
    return {
      editData: {},
      notifUrl: "",
      title: "Setting",
      data: {},
      items: [
        {
          text: "Setting",
          active: true,
        },
      ],
      loading: "",
      dismissSecs: 5,
      dismissCountDown: 0,
      messages: "",
    };
  },
  components: {
    Header,
  },

  mounted() {
    const mainUrl = localStorage.getItem("apiUrl");
    this.notifUrl = mainUrl + "/notif";
    this.getNotif();
  },
  methods: {
    async SaveUsers() {
      await axios
        .put(this.notifUrl, this.editData)
        .then((response) => {
          this.messages = "Data berhasil diubah";
          this.getNotif();
          this.showAlert();
          console.log("data", response);
          this.$refs["users"].hide();
          // this.loading = false;
        })
        .catch((error) => {
          console.log(error);
        });

      // .finally(() => this.loading = false)
    },
    edit(val) {
      console.log(val);
      this.editData = val;
      this.$refs["users"].show();
    },
    async getNotif() {
      const resp = await axios.get(this.notifUrl);
      this.data = resp.data.data[0];
      console.log(this.data);
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

<style lang="scss" scoped></style>
