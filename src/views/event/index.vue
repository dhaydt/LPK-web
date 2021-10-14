<template>
  <div class="pelatihanEvent">
    <PelatihanJumbotron></PelatihanJumbotron>
    <Kopdar></Kopdar>
    <EventGaleri></EventGaleri>
  </div>
</template>

<script>
import EventGaleri from "../../components/pelatihan/eventGaleri";
import Kopdar from "../../components/pelatihan/kopdar";
import PelatihanJumbotron from "../../components/pelatihan/pelatihanJumbotron";
export default {
  components: {
    EventGaleri,
    Kopdar,
    PelatihanJumbotron,
  },
};
</script>

<style lang="scss" scoped></style>
