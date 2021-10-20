<template>
  <div class="index">
    <Navbar v-if="navbar"></Navbar>
    <router-view></router-view>
    <Footer></Footer>
  </div>
</template>

<script>
import Footer from "../components/footer";
import Navbar from "../components/Navbar";
export default {
  data() {
    return {
      navbar: true,
    };
  },
  components: {
    Footer,
    Navbar,
  },

  mounted() {
    this.$root.$on("navbar", this.switch);
  },

  methods: {
    switch() {
      this.navbar = false;
    },
  },
};
</script>

<style lang="scss">
@import "@/assets/main.scss";
.index {
  background-color: #fff;
}
</style>
