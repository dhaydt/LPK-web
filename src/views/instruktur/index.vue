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
  metaInfo: {
    // if no subcomponents specify a metaInfo.title, this title will be used
    title: "PGU",
    // all titles will be injected into this template
    titleTemplate: "%s | INSTRUKTUR",
  },
  components: {
    Pengayaan,
    Kurikulum,
    Struktur,
    InstrukturJumbotron,
  },
};
</script>

<style lang="scss" scoped></style>
