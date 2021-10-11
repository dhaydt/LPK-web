<template>
  <div>
    <b-container>
      <b-row class="justify-content-center">
        <b-card-group deck>
          <b-col lg="12" md="6">
            <b-card class="loginCard" title="Login">
              <router-link to="/">
                <b-button
                  variant="outline-success"
                  size="lg"
                  class="mb-2 flaticon"
                >
                  <i class="fas fa-home"></i> </b-button
              ></router-link>
              <b-alert v-model="alert" :variant="variant" dismissible>
                {{ message }}
              </b-alert>
              <b-form @submit="onSubmit">
                <b-form-group
                  id="input-group-1"
                  class="text-left"
                  label="Email:"
                  label-for="email"
                  description="We'll never share your email with anyone else."
                >
                  <b-form-input
                    id="email"
                    v-model="form.email"
                    type="email"
                    placeholder="Enter email"
                    required
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
                    v-model="form.password"
                    placeholder="Enter password"
                    required
                  ></b-form-input>
                </b-form-group>

                <b-button class="ml-auto" type="submit" variant="primary"
                  ><span v-if="loading"><b-spinner small variant="success" class="mr-2"></b-spinner
                  >Wait...</span><span v-else><i class="fas fa-lock mr-2"></i>Login</span></b-button
                >
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
        email: "",
        password: "",
      },
      // url
      loginUrl: "",
    };
  },

  created() {
    const api = localStorage.apiUrl;
    this.loginUrl = api + "/login";
  },

  methods: {
    async onSubmit(event) {
      event.preventDefault();
			this.loading= "true";
      try {
        let res = await axios.post(this.loginUrl, this.form);
        console.log(res.token);
        if (res.token !== null) {
          this.variant = "success";
          this.message = "You are Logged in";
          this.alert = true;
          console.log(res);
          localStorage.setItem("auth", JSON.stringify(res.data));
					this.loading= "";
          this.$router.push("/admin");
        }
      } catch ({ response }) {
				this.loading= ""
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
</style>
