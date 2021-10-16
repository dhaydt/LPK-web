<template>
  <div class="register">
    <b-row id="loginRow">
      <b-col class="left text-left">
        <router-link to="/"
          ><b-img class="p-4 m-4" src="/assets/images/logo.png"></b-img
        ></router-link>
      </b-col>
      <b-col class="right d-flex align-items-center justify-content-center">
        <b-container>
          <b-card
            class="w-100"
            title="Buat akun PAZ"
            sub-title="Buat akun baru dengan mengisi data berikut :"
          >
            <b-form @submit="onSubmit" class="mt-4">
              <b-form-group class="mb-4">
                <b-form-input
                  id="fname"
                  v-model="form.nama_depan"
                  type="text"
                  placeholder="Nama depan"
                  required
                ></b-form-input>
              </b-form-group>

              <b-form-group class="mb-4">
                <b-form-input
                  id="lname"
                  v-model="form.nama_bel"
                  type="text"
                  placeholder="Nama belakang"
                ></b-form-input>
              </b-form-group>

              <b-form-group class="mb-4">
                <b-form-input
                  id="email"
                  v-model="form.email"
                  type="email"
                  placeholder="Email"
                  required
                ></b-form-input>
              </b-form-group>

              <b-form-group class="mb-4">
                <b-form-input
                  id="telp"
                  v-model="form.telp"
                  type="number"
                  placeholder="Telepon / HP"
                  required
                ></b-form-input>
              </b-form-group>

              <b-form-group class="mb-4">
                <b-form-input
                  id="alamat"
                  v-model="form.alamat"
                  type="text"
                  placeholder="Alamat"
                  required
                ></b-form-input>
              </b-form-group>

              <b-form-group>
                <b-form-input
                  id="password"
                  v-model="form.password"
                  name="password"
                  type="password"
                  placeholder="Password"
                  required
                ></b-form-input>
              </b-form-group>

              <b-form-group>
                <b-form-input
                  id="c_password"
                  v-model="form.c_password"
                  name="c_password"
                  type="password"
                  placeholder="Konfirmasi Password"
                  required
                ></b-form-input>
              </b-form-group>

              <b-alert v-model="alert" :variant="variant" dismissible>
                {{ message }}
              </b-alert>

              <b-button type="submit" class="login-btn w-100 mt-4 py-3"
                ><span v-if="loading"
                  ><b-spinner small variant="warning" class="mr-2"></b-spinner
                  >Wait...</span
                ><span v-else
                  ><i class="fas fa-lock mr-2"></i>Buat Akun</span
                ></b-button
              >
              <div class="text-center reg">
                Sudah punya akun?
                <router-link to="/login">Masuk disini</router-link>
              </div>
            </b-form>
          </b-card>
        </b-container>
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
      variant: "",
      loading: "",
      message: "",
      form: {
        nama_depan: "",
        nama_bel: "",
        email: "",
        telp: "",
        alamat: "",
        password: "",
        c_password: "",
      },
      // url
      regUrl: "",
    };
  },

  created() {
    const api = localStorage.apiUrl;
    this.regUrl = api + "/sign-up";
  },

  methods: {
    onSubmit(e) {
      e.preventDefault();
      this.loading = "true";
      if (this.form.password !== this.form.c_password) {
        this.variant = "danger";
        this.alert = true;
        this.message = "Password tidak sama!!!";
        this.form.password = "";
        this.form.c_password = "";
        this.loading = false;
      } else {
        this.register();
      }
    },
    async register() {
      // event.preventDefault();

      try {
        let res = await axios.post(this.regUrl, this.form);
        console.log(res.token);
        if (res.token !== null) {
          this.variant = "success";
          this.message = "Berhasil mendaftar";
          this.alert = true;
          console.log(res);
          // localStorage.setItem("auth", JSON.stringify(res.data));
          this.loading = "";
          this.$router.push("/admin");
        }
      } catch ({ response }) {
        this.loading = "";
        this.variant = "danger";
        this.message = response.data.msg;
        (this.form.password = ""), (this.alert = true);
        console.log(response.data.msg);
      }
    },
  },
};
</script>

<style lang="scss" scoped>
@import "@/assets/main.scss";

#loginRow {
  height: 90vh;
}
.left {
  background: linear-gradient(
    181.98deg,
    #07a148 26.57%,
    rgba(7, 161, 72, 0) 283.01%
  );
}

.right {
  background-color: #fff;
}

.card {
  box-shadow: none;
  padding: 0 50px;
}

.card-title {
  font-style: normal;
  font-weight: 600;
  font-size: 32px;
  line-height: 39px;
  /* identical to box height */
  text-align: left;
  letter-spacing: 0.01em;

  /* Black/3 */

  color: #121527;
}

.card-subtitle {
  font-style: normal;
  font-weight: normal;
  margin: 16px 0;
  font-size: 16px;
  line-height: 24px;
  text-align: left;
  color: #757682;
}

#email {
  font-family: Inter;
  font-style: normal;
  font-weight: normal;
  font-size: 16px;
  line-height: 24px;
  letter-spacing: 0.01em;
}

#password {
  font-family: Inter;
  font-style: normal;
  font-weight: normal;
  font-size: 16px;
  line-height: 24px;
  letter-spacing: 0.01em;
}

.forget a {
  font-style: normal;
  font-weight: 500;
  font-size: 14px;
  line-height: 20px;
  letter-spacing: 0.01em;
  color: #07a148;
}

.forget a:hover {
  color: $paz-secondary;
}

.login-btn {
  background-color: $paz-main;
  span {
    font-family: Inter;
    font-style: normal;
    font-weight: 600;
    font-size: 16px;
    line-height: 19px;
    letter-spacing: 0.04em;
  }
  // color: #ffffff;
}

.login-btn:hover {
  background-color: $paz-secondary;
  border: none;
}

.reg {
  font-family: Inter;
  font-style: normal;
  font-weight: normal;
  font-size: 14px;
  line-height: 20px;
  margin-top: 10px;
  /* identical to box height, or 143% */

  letter-spacing: 0.01em;

  /* Black/2 */

  color: #757682;
  a {
    color: $paz-main;
  }
}
</style>
