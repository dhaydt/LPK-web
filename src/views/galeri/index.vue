<template>
  <div class="galeriHome">
    <GaleriJumbotron></GaleriJumbotron>
    <Galeri></Galeri>
    <Kopdar></Kopdar>
  </div>
</template>

<script>
import Galeri from "../../components/galeri/galeri";
import Kopdar from "../../components/galeri/kopdar";
import GaleriJumbotron from "../../components/galeri/galeriJumbotron";
import axios from "axios";
export default {
  metaInfo: {
    // if no subcomponents specify a metaInfo.title, this title will be used
    title: "LKP PAZ Generasi Unggul",
    // all titles will be injected into this template
    titleTemplate: "%s | GALERI",
  },
  data() {
    return {
      dataUrl: "",
      // kopdarUrl: "",
      data1: {},
      data2: {},
      // data3: {},
      img1: {},
      img2: {},
      // img3: {},
    };
  },
  components: {
    Galeri,
    Kopdar,
    GaleriJumbotron,
  },

  created() {
    window.scrollTo(0, 0);
    const mainUrl = localStorage.getItem("apiUrl");
    this.dataUrl = mainUrl + "/groupFront";

    this.getData();
  },

  methods: {
    async getData() {
      const resp = await axios.get(this.dataUrl);
      const data = resp.data;
      const group = data.dataGroup;
      this.data1 = group[0];
      this.data2 = group[1];
      // this.data3 = group[2];

      const img = data.dataImg;

      const grouping = (array) => {
        return array.reduce((result, currentValue) => {
          (result[currentValue.lokasi] =
            result[currentValue.lokasi] || []).push(currentValue);
          return result;
        }, {});
      };
      const lokasi1 = grouping(img, "lokasi");
      this.img1 = lokasi1[this.data1.lokasi].slice(0, 4);
      this.img2 = lokasi1[this.data2.lokasi].slice(0, 4);
      // this.img3 = lokasi1[this.data3.lokasi].slice(0, 4);
      // console.log(this.img3);
    },
  },
};
</script>

<style lang="scss" scoped></style>
