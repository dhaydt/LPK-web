<template>
  <div class="home">
    <Jumbotron></Jumbotron>
    <AboutUs></AboutUs>
    <Gallery></Gallery>
    <Pelatihan></Pelatihan>
    <Blog></Blog>
    <Alumni></Alumni>
    <Testimoni></Testimoni>
    <BeforeFoot></BeforeFoot>
  </div>
</template>

<script>
import Alumni from "../../components/home/alumni";
import BeforeFoot from "../../components/home/beforeFoot";
import Testimoni from "../../components/home/testimoni";
import Blog from "../../components/home/blog";
import Pelatihan from "../../components/home/pelatihan";
import Gallery from "../../components/home/gallery";
import AboutUs from "../../components/home/aboutUs";
import Jumbotron from "../../components/home/jumbotron";
export default {
  metaInfo: {
    // if no subcomponents specify a metaInfo.title, this title will be used
    title: "LKP PAZ Generasi Unggul",
    // all titles will be injected into this template
    titleTemplate: "%s | HOME",
  },
  components: {
    Alumni,
    BeforeFoot,
    Testimoni,
    Blog,
    Pelatihan,
    Gallery,
    AboutUs,
    Jumbotron,
  },

  created() {
    window.scrollTo(0, 0);
  },
};
</script>

<style lang="scss" scoped>
.home {
}
</style>
