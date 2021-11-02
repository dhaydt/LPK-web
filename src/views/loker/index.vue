<template>
  <div class="loker">
    <LokerJumbotron></LokerJumbotron>
    <LokerCard></LokerCard>
  </div>
</template>

<script>
import LokerCard from "../../components/loker/lokerCard";
import LokerJumbotron from "../../components/loker/lokerJumbotron";
export default {
  metaInfo: {
    // if no subcomponents specify a metaInfo.title, this title will be used
    title: "LKP PAZ Generasi Unggul",
    // all titles will be injected into this template
    titleTemplate: "%s | LOKER",
  },
  components: {
    LokerCard,
    LokerJumbotron,
  },
};
</script>

<style lang="scss" scoped></style>
