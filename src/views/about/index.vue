<template>
  <div class="aboutUs">
    <AbJumbotron></AbJumbotron>
    <Visi></Visi>
    <Legalitas></Legalitas>
    <Struktur></Struktur>
    <AbBlog></AbBlog>
    <Cabang></Cabang>
  </div>
</template>

<script>
import Legalitas from '../../components/about/legalitas'
import Cabang from '../../components/about/cabang.vue'
import AbBlog from '../../components/about/abBlog'
import Struktur from '../../components/about/struktur'
import Visi from '../../components/about/visi'
import AbJumbotron from "../../components/about/abJumbotron";
export default {
  components: {
    Legalitas,
    Cabang,
    AbBlog,
    Struktur,
    Visi, AbJumbotron },
};
</script>

<style lang="scss" scoped></style>
