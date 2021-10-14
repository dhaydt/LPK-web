<template>
  <div class="register">
    <b-container>
      <b-row class="justify-content-center">
        <b-card-group deck>
          <b-col lg="12" md="6">
            <b-card class="loginCard">
              <div class="card-title">
                <b-img
                  src="../../assets/images/logo-col.png"
                  height="50"
                ></b-img>
              </div>
              <router-link to="/">
                <b-button
                  variant="outline-success"
                  size="lg"
                  class="mb-2 flaticon"
                >
                  <i class="fas fa-home"></i> </b-button
              ></router-link>
              <b-form @submit="onSubmit">
                <b-form-group
                  id="input-group-0"
                  class="text-left"
                  label="Nama:"
                  label-for="username"
                >
                  <b-form-input
                    id="username"
                    name="username"
                    v-model="form.username"
                    type="text"
                    placeholder="Masukan nama anda"
                    required
                  ></b-form-input>
                </b-form-group>

                <b-form-group
                  id="input-group-1"
                  class="text-left"
                  label="Email:"
                  label-for="email"
                  description="We'll never share your email with anyone else."
                >
                  <b-form-input
                    id="email"
                    name="email"
                    v-model="form.email"
                    type="email"
                    placeholder="Masukan email"
                    required
                  ></b-form-input>
                </b-form-group>

                <b-form-group
                  id="company"
                  class="text-left"
                  label="Perusahaan:"
                  label-for="company"
                >
                  <b-form-input
                    id="company"
                    name="company"
                    v-model="form.company"
                    type="text"
                    placeholder="Masukan perusahaan"
                  ></b-form-input>
                </b-form-group>

                <b-form-group
                  id="password"
                  class="text-left"
                  label="Password"
                  label-for="password"
                >
                  <b-form-input
                    id="password"
                    name="password"
                    v-model="form.password"
                    placeholder="Masukan password"
                    required
                  ></b-form-input>
                </b-form-group>

                <b-form-group
                  id="c_password"
                  class="text-left"
                  label="Confirm Password"
                  label-for="password"
                >
                  <b-form-input
                    id="c_password"
                    name="c_password"
                    v-model="form.c_password"
                    placeholder="Konfirmasi password"
                    required
                  ></b-form-input>
                </b-form-group>

                <b-row class="flex-column">
                  <b-col class="mb-2 reg text-left">
                    <span
                      >Sudah memiliki akun?
                      <router-link to="/login"
                        >Login sekarang</router-link
                      ></span
                    >
                  </b-col>
                  <b-col>
                    <b-alert v-model="alert" :variant="variant" dismissible>
                      {{ message }}
                    </b-alert>
                    <b-button class="ml-auto" type="submit" variant="success"
                      ><span v-if="loading"
                        ><b-spinner
                          small
                          variant="warning"
                          class="mr-2"
                        ></b-spinner
                        >Wait...</span
                      ><span v-else
                        ><i class="fas fa-user-plus"></i> Daftar</span
                      ></b-button
                    >
                  </b-col>
                </b-row>
              </b-form>
              <!-- <b-card class="mt-3" header="Form Data Result">
					<pre class="m-0">{{ form }}</pre>
				</b-card> -->
            </b-card>
          </b-col>
        </b-card-group>
      </b-row>
    </b-container>
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
        username: "",
        email: "",
        company: "",
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
    async onSubmit(event) {
      event.preventDefault();
      this.loading = "true";
      try {
        if (this.form.password !== this.form.c_password) {
          this.variant = "danger";
          this.alert = true;
          this.message = "Password tidak sama!!!";
          this.form.password =""
          this.form.c_password =""
          this.loading = false;
        }

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
.loginCard {
  // max-width: 50%;
  margin-top: 20vh;
}
.flaticon {
  position: absolute;
  right: -15px;
  top: -15px;
  border-radius: 50%;
  background-color: white;
}

.reg span {
  font-size: 0.8rem;
  text-align: left;
}
</style>
