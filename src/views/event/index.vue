<template>
  <div class="pelatihanEvent">
    <PelatihanJumbotron></PelatihanJumbotron>
    <TimelinePelatihan></TimelinePelatihan>
  </div>
</template>

<script>
import TimelinePelatihan from "../../components/pelatihan/timelinePelatihan";
import PelatihanJumbotron from "../../components/pelatihan/pelatihanJumbotron";
export default {
  metaInfo: {
    // if no subcomponents specify a metaInfo.title, this title will be used
    title: "LKP PAZ Generasi Unggul",
    // all titles will be injected into this template
    titleTemplate: "%s | PELATIHAN",
  },
  components: {
    TimelinePelatihan,
    PelatihanJumbotron,
  },
};
</script>

<style lang="scss" scoped></style>
