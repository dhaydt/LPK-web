<template>
  <div class="index">
    <Navbar></Navbar>
    <router-view></router-view>
    <Footer></Footer>
  </div>
</template>

<script>
import Footer from '../components/footer'
import Navbar from "../components/Navbar";
export default {
  components: {
    Footer,
    Navbar,
  },
};
</script>

<style lang="scss">
@import "@/assets/main.scss";
.index {
  background-color: #fff;
}
</style>
