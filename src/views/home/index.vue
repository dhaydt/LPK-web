<template>
  <div class="home">
    <Jumbotron></Jumbotron>
    <AboutUs></AboutUs>
    <Gallery></Gallery>
    <Pelatihan></Pelatihan>
    <Blog></Blog>
    <Loker></Loker>
    <Testimoni></Testimoni>
  </div>
</template>

<script>
import Testimoni from "../../components/home/testimoni";
import Loker from "../../components/home/loker";
import Blog from "../../components/home/blog";
import Pelatihan from "../../components/home/pelatihan";
import Gallery from "../../components/home/gallery";
import AboutUs from "../../components/home/aboutUs";
import Jumbotron from "../../components/home/jumbotron";
export default {
  components: {
    Testimoni,
    Loker,
    Blog,
    Pelatihan,
    Gallery,
    AboutUs,
    Jumbotron,
  },
};
</script>

<style lang="scss" scoped></style>
