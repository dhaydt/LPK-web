<template>
  <div class="galeriHome">
    <GaleriJumbotron></GaleriJumbotron>
    <Gallery1 :data="data1"></Gallery1>
    <Gallery1 :data="data2"></Gallery1>
    <Gallery1 :data="data3"></Gallery1>
  </div>
</template>

<script>
import Gallery1 from "../../components/galeri/gallery1";
import GaleriJumbotron from "../../components/galeri/galeriJumbotron";
export default {
  data() {
    return {
      data1: {
        subtitle: "17 - 18 OKTOBER 2021",
        title: "Pelatihan PAZ Basic Yogyakarta",
        content:
          "Pelatihan yang dilakukan dari tanggal X sampai tanggal Y pada bulan Oktober 2021 secara offline di kota Yogyakarta. Peserta pada pelatihan ini mencapai 100 orang.",
      },
      data2: {
        subtitle: "20 - 21 OKTOBER 2021",
        title: "Pelatihan PAZ Basic Surabaya",
        content:
          "Pelatihan yang dilakukan dari tanggal X sampai tanggal Y pada bulan Oktober 2021 secara offline di kota Surabaya. Peserta pada pelatihan ini mencapai 128 orang.",
      },
      data3: {
        subtitle: "30 OKTOBER 2021",
        title: "Kopdar PAZTI Kalimantan Barat",
        content:
          "Pertemuan antar alumni Pelatihan PAZ daerah Kalimantan Barat yang dilakukan dari tanggal X bulan Oktober 2021 secara offline di kota X. Peserta pada pertemuan ini mencapai 64 orang.",
      },
    };
  },
  components: {
    Gallery1,
    GaleriJumbotron,
  },
};
</script>

<style lang="scss" scoped></style>
