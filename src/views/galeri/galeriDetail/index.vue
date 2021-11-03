<template>
  <div class="galeriDetail">
    <Breadcumb :items="items"></Breadcumb>
    <DetailGaleriCard></DetailGaleriCard>
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
};
</script>

<style lang="scss" scoped></style>
