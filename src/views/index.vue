<template>
  <div class="home">
    <Navbar></Navbar>
    <Jumbotron></Jumbotron>
    <AboutUs></AboutUs>
  </div>
</template>

<script>
import AboutUs from "../components/home/aboutUs";
import Jumbotron from "../components/home/jumbotron";
import Navbar from "../components/Navbar";
export default {
  components: {
    AboutUs,
    Jumbotron,
    Navbar,
  },
};
</script>

<style lang="scss" scoped>
.home {
  background-color: #fff;
}
</style>
