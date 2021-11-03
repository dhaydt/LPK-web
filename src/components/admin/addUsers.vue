<template>
  <div class="addVisi">
    <b-row class="justify-content-center">
      <b-col md="8" sm="12">
        <b-card>
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
          <b-form @submit="onSubmit" class="text-left mt-4">
            <b-form-group label="Nama Depan" class="mb-4">
              <b-form-input
                id="fname"
                v-model="form.nama_depan"
                type="text"
                placeholder="Nama depan"
                required
              ></b-form-input>
            </b-form-group>

            <b-form-group class="mb-4" label="Nama Belakang">
              <b-form-input
                id="lname"
                v-model="form.nama_bel"
                type="text"
                placeholder="Nama belakang"
              ></b-form-input>
            </b-form-group>

            <b-form-group class="mb-4" label="E-Mail">
              <b-form-input
                id="email"
                v-model="form.email"
                type="email"
                placeholder="Email"
                required
              ></b-form-input>
            </b-form-group>

            <b-form-group class="mb-4" label="Role">
              <b-form-select
                id="role"
                :options="role"
                v-model="form.role"
                required
              ></b-form-select>
            </b-form-group>

            <b-form-group class="mb-4" label="Telepon">
              <b-form-input
                id="telp"
                v-model="form.telp"
                type="number"
                placeholder="Telepon / HP"
                required
              ></b-form-input>
            </b-form-group>

            <b-form-group class="mb-4" label="Alamat">
              <b-form-input
                id="alamat"
                v-model="form.alamat"
                type="text"
                placeholder="Alamat"
                required
              ></b-form-input>
            </b-form-group>

            <b-form-group label="Password">
              <b-form-input
                id="password"
                v-model="form.password"
                name="password"
                type="password"
                placeholder="Password"
                required
              ></b-form-input>
            </b-form-group>

            <b-form-group label="Konfirmasi Password">
              <b-form-input
                id="c_password"
                v-model="form.c_password"
                name="c_password"
                type="password"
                placeholder="Konfirmasi Password"
                required
              ></b-form-input>
            </b-form-group>

            <b-button type="submit" variant="success" class="mt-4"
              ><div v-if="loading">
                <b-spinner small variant="primary"></b-spinner> Menyimpan...
              </div>
              <span v-if="!loading"
                ><i class="fa fa-save"></i> Tambah User</span
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
      alert: false,
      visiUrl: "",
      form: {
        nama_depan: "",
        nama_bel: "",
        email: "",
        telp: "",
        alamat: "",
        role: null,
        password: "",
        c_password: "",
      },
      role: [
        { text: "Pilih Role User", value: null },
        { text: "Admin", value: "admin" },
        { text: "HRD", value: "hrd" },
        { text: "Staff", value: "staff" },
      ],
      loading: "",
      variant: "",
      dismissSecs: 5,
      dismissCountDown: 0,
      messages: "",
    };
  },

  created() {
    const mainUrl = localStorage.getItem("apiUrl");
    this.visiUrl = mainUrl + "/sign-up";
  },

  methods: {
    onSubmit(e) {
      e.preventDefault();
      this.loading = "true";
      if (this.form.password !== this.form.c_password) {
        this.variant = "danger";
        this.alert = true;
        this.messages = "Password tidak sama!!!";
        this.form.password = "";
        this.form.c_password = "";
        this.showAlert();
        this.loading = false;
      } else {
        this.register();
      }
    },
    async register() {
      // event.preventDefault();

      try {
        let res = await axios.post(this.visiUrl, this.form);
        console.log(res.token);
        if (res.token !== null) {
          this.variant = "success";
          this.messages = "Berhasil Menambah User";
          this.showAlert();
          console.log(res);
          // localStorage.setItem("auth", JSON.stringify(res.data));
          this.loading = "";
          this.$root.$emit("getVisi");
        }
      } catch ({ response }) {
        this.loading = "";
        this.variant = "danger";
        this.messages = response.data.msg;
        (this.form.password = ""), (this.alert = true);
        console.log(response.data.msg);
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
