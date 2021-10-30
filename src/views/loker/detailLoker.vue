<template>
  <div class="detailLoker">
    <DetailJumbotron></DetailJumbotron>
    <DetailCard></DetailCard>
  </div>
</template>

<script>
import DetailCard from "../../components/loker/detailLoker/detailCard";
import DetailJumbotron from "../../components/loker/detailLoker/detailJumbotron";
export default {
  metaInfo: {
    // if no subcomponents specify a metaInfo.title, this title will be used
    title: "PGU",
    // all titles will be injected into this template
    titleTemplate: "%s | Loker Detail",
  },
  components: {
    DetailCard,
    DetailJumbotron,
  },
};
</script>

<style lang="scss" scoped></style>
