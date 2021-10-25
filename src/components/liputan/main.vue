<template>
  <div class="mainLiputan">
    <b-container>
      <h1 class="title">liputan media</h1>
      <b-row cols="3">
        <b-col v-for="lip in liputan" :key="lip.id">
          <b-card :title="lip.title" :img-src="imgUrl + lip.img">
            <b-card-text>{{ lip.date | moment("DD/MM/YYYY") }} </b-card-text>
          </b-card>
        </b-col>
      </b-row>
    </b-container>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      liputanUrl: "",
      imgUrl: "",
      liputan: {},
    };
  },

  created() {
    const mainUrl = localStorage.getItem("apiUrl");
    this.liputanUrl = mainUrl + "/liputan";
    this.imgUrl = mainUrl + "/images/liputan/";
    this.getLiputan();
  },

  methods: {
    async getLiputan() {
      const resp = await axios.get(this.liputanUrl);
      console.log(resp.data.data);
      this.liputan = resp.data.data;
    },
  },
};
</script>

<style lang="scss" scoped>
h1.title {
  text-transform: capitalize;
}
</style>
