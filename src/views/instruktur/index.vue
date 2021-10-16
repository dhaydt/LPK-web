<template>
  <div class="instruktur">
    <InstrukturJumbotron></InstrukturJumbotron>
    <Struktur></Struktur>
    <Kurikulum></Kurikulum>
  </div>
</template>

<script>
import Kurikulum from "../../components/instruktur/kurikulum";
import Struktur from "../../components/instruktur/struktur";
import InstrukturJumbotron from "../../components/instruktur/instrukturJumbotron";
export default {
  components: {
    Kurikulum,
    Struktur,
    InstrukturJumbotron,
  },
};
</script>

<style lang="scss" scoped></style>
