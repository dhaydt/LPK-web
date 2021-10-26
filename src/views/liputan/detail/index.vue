<template>
  <div class="liputanDetail">
    <Breadcumb :items="items"></Breadcumb>
    <LiputanDetail :news="news"></LiputanDetail>
  </div>
</template>

<script>
import axios from "axios";
import Breadcumb from "../../../components/breadcumb";
import LiputanDetail from "../../../components/liputan/liputanDetail";
export default {
  components: {
    Breadcumb,
    LiputanDetail,
  },
  data() {
    return {
      liputanUrl: "",
      title: "",
      mainUrl: "",
      news: {},
      items: [
        {
          text: "Home",
          to: "/",
        },
        {
          text: "Liputan Media",
          to: "/liputan",
        },
        {
          text: "",
          active: true,
        },
      ],
    };
  },

  created() {
    this.mainUrl = localStorage.getItem("apiUrl");
    this.liputanUrl = this.mainUrl + "/liputan/" + this.$route.params.id;
    this.getLip();
  },

  mounted() {
    this.$root.$on("getId", this.updateLip);
  },

  methods: {
    updateLip() {
      this.liputanUrl = this.mainUrl + "/liputan/" + this.$route.params.id;
      this.getLip();
    },
    async getLip() {
      const resp = await axios.get(this.liputanUrl);
      const data = resp.data.data[0];
      console.log("data", this.liputanUrl);
      this.news = data;
      this.items[2].text = data.title;
    },
  },
};
</script>

<style lang="scss" scoped></style>
