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
  components: {
    DetailCard,
    DetailJumbotron,
  },
};
</script>

<style lang="scss" scoped></style>
