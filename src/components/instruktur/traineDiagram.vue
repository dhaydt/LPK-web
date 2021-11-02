<template>
  <div class="traineDiagram">
    <b-row cols-md="5" cols-sm="2" cols="1" no-gutters>
      <b-col v-for="(ins, i) in instruktur.slice(0, 10)" :key="i">
        <b-card no-body>
          <b-card-img-lazy :src="imgUrl + ins.img"> </b-card-img-lazy>
          <div class="overflow">
            <b-card-title>{{ ins.name }} </b-card-title>
            <b-card-text>{{ ins.address }} </b-card-text>
          </div>
        </b-card>
      </b-col>
    </b-row>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      insUrl: "",
      imgUrl: "",
      instruktur: [],
    };
  },
  created() {
    const mainUrl = localStorage.getItem("apiUrl");
    this.insUrl = mainUrl + "/instruktur";
    this.imgUrl = mainUrl + "/images/instruktur/";
    this.getData();
  },

  methods: {
    async getData() {
      const resp = await axios.get(this.insUrl);
      const data = resp.data.data;
      console.log(data);
      this.instruktur = data;
    },
  },
};
</script>

<style lang="scss" scoped>
.card {
  position: relative;
}

.card-img {
  height: 100%;
}

.card .overflow {
  position: absolute;
  background: #fff;
  width: 80%;
  margin: auto;
  padding: 10px;
  border-radius: 4px;
  left: 0;
  right: 0;
  bottom: 30px;

  .card-title {
    font-style: normal;
    font-weight: 600;
    font-size: 16px;
    letter-spacing: 0.01em;
    color: #121527;
  }

  .card-text {
    font-style: normal;
    font-weight: 500;
    font-size: 14px;
    color: #757682;
  }
}
</style>
