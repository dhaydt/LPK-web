<template>
  <div class="home">
    <Navbar></Navbar>
    <Jumbotron></Jumbotron>
    <AboutUs></AboutUs>
    <Gallery></Gallery>
    <Pelatihan></Pelatihan>
    <Blog></Blog>
    <Loker></Loker>
    <Testimoni></Testimoni>
    <Footer></Footer>
  </div>
</template>

<script>
import Testimoni from '../components/home/testimoni'
import Loker from '../components/home/loker'
import Blog from '../components/home/blog'
import Pelatihan from '../components/home/pelatihan'
import Footer from '../components/home/footer'
import Gallery from '../components/home/gallery'
import AboutUs from "../components/home/aboutUs";
import Jumbotron from "../components/home/jumbotron";
import Navbar from "../components/Navbar";
export default {
  components: {
    Testimoni,
    Loker,
    Blog,
    Pelatihan,
    Footer,
    Gallery,
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
