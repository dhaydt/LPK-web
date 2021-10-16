<template>
  <div class="aboutUs">
    <AbJumbotron></AbJumbotron>
    <Visi></Visi>
    <Legalitas></Legalitas>
    <Struktur></Struktur>
    <Liputan></Liputan>
    <Cabang></Cabang>
  </div>
</template>

<script>
import Liputan from "../../components/about/liputan";
import Legalitas from "../../components/about/legalitas";
import Cabang from "../../components/about/cabang.vue";
import Struktur from "../../components/about/struktur";
import Visi from "../../components/about/visi";
import AbJumbotron from "../../components/about/abJumbotron";
export default {
  components: {
    Liputan,
    Legalitas,
    Cabang,
    Struktur,
    Visi,
    AbJumbotron,
  },
};
</script>

<style lang="scss" scoped></style>
