<template>
  <div class="detailLoker">
    <DetailJumbotron></DetailJumbotron>
    <DetailCard :loker="loker"></DetailCard>
  </div>
</template>

<script>
import DetailCard from "../../components/loker/detailLoker/detailCard";
import DetailJumbotron from "../../components/loker/detailLoker/detailJumbotron";
import axios from "axios";
export default {
  components: {
    DetailCard,
    DetailJumbotron,
  },
  data() {
    return {
      idUrl: "",
      loker: {},
    };
  },

  mounted() {
    const mainUrl = localStorage.getItem("apiUrl");
    this.idUrl = mainUrl + "/loker/";
    this.getLoker();
  },

  methods: {
    async getLoker() {
      console.log(this.$route.params.id);
      const resp = await axios.get(this.idUrl + this.$route.params.id);
      this.loker = resp.data.data[0];
      console.log(this.loker);
    },
  },
};
</script>

<style lang="scss" scoped></style>
