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
  components: {
    LokerCard,
    LokerJumbotron,
  },
};
</script>

<style lang="scss" scoped></style>
