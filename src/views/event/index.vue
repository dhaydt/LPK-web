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
  components: {
    TimelinePelatihan,
    PelatihanJumbotron,
  },
};
</script>

<style lang="scss" scoped></style>
