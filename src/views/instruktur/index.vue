<template>
  <div class="instruktur">
    <InstrukturJumbotron></InstrukturJumbotron>
    <Struktur></Struktur>
    <Kurikulum></Kurikulum>
    <Pengayaan></Pengayaan>
  </div>
</template>

<script>
import Pengayaan from "../../components/instruktur/pengayaan";
import Kurikulum from "../../components/instruktur/kurikulum";
import Struktur from "../../components/instruktur/struktur";
import InstrukturJumbotron from "../../components/instruktur/instrukturJumbotron";
export default {
  components: {
    Pengayaan,
    Kurikulum,
    Struktur,
    InstrukturJumbotron,
  },
};
</script>

<style lang="scss" scoped></style>
