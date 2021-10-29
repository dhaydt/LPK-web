<template>
  <div class="unauth">
    <b-container>
      <b-row class="w-100 p-4">
        <b-col md="12" class="d-flex justify-content-end">
          <b-button variant="danger" @click="logout"
            ><i class="fas fa-door-open mr-2"></i>Sign Out</b-button
          >
        </b-col>
        <b-col>
          <b-img src="/assets/images/unauth.jpg"></b-img>
        </b-col>
      </b-row>
    </b-container>
  </div>
</template>

<script>
export default {
  methods: {
    logout() {
      localStorage.removeItem("auth");
      this.$router.push("/login");
    },
  },
};
</script>

<style lang="scss" scoped>
.unauth {
  background-color: #fff;
  height: 100vh;
}

.btn {
  font-weight: 700;
}
</style>
