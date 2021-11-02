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
  metaInfo: {
    // if no subcomponents specify a metaInfo.title, this title will be used
    title: "LKP PAZ Generasi Unggul",
    // all titles will be injected into this template
    titleTemplate: "%s | Galeri Detail",
  },
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
    this.$root.$on("titles", (val) => {
      // console.log("val", val);
      this.items[2].text = val;
    });
  },

  methods: {
    titleUpdate(val) {
      console.log("home", val);
    },
  },
};
</script>

<style lang="scss" scoped></style>
