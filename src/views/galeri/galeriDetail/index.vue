<template>
  <div class="galeriDetail">
    <Breadcumb :items="items"></Breadcumb>
    <DetailGaleriCard :data="data"></DetailGaleriCard>
  </div>
</template>

<script>
import DetailGaleriCard from "../../../components/galeri/detailGaleriCard";
import Breadcumb from "../../../components/breadcumb";
export default {
  data() {
    return {
      data: {
        title: "Pelatihan PAZ Basic Yogyakarta",
        content:
          "Pelatihan yang dilakukan dari tanggal X sampai tanggal Y pada bulan Oktober 2021 secara offline di kota Yogyakarta. Peserta pada pelatihan ini mencapai 100 orang pada sesi ini.",
        subtitle: "17 - 18 Oktober 2021",
      },
      items: [
        {
          text: "Home",
          to: "/",
        },
        {
          text: "Galeri",
          to: "/galeri",
        },
        {
          text: "Pelatihan PAZ Basic Yogyakarta",
          active: true,
        },
      ],
    };
  },
  components: {
    DetailGaleriCard,
    Breadcumb,
  },

  mounted() {
    window.scrollTo(0, 0);
  },
};
</script>

<style lang="scss" scoped></style>
