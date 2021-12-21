<template>
  <div class="traineDiagram" style="overflow: hidden;">
    <b-row cols-md="5" cols-sm="2" cols="1" no-gutters class="d-none d-md-flex">
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
    <b-row no-gutters class="wrapper d-flex d-md-none mt-4">
      <Flicking
        ref="flicking"
        :options="{
          align: 'prev',
          defaultIndex: 0,
          circular: true,
          duration: 1100,
        }"
      >
        <div
          v-for="(ins, i) in instruktur.slice(0, 10)"
          :key="i"
          class="ins-sm"
        >
          <b-card no-body>
            <b-card-img-lazy :src="imgUrl + ins.img"> </b-card-img-lazy>
            <div class="overflow">
              <b-card-title>{{ ins.name }} </b-card-title>
              <b-card-text>{{ ins.address }} </b-card-text>
            </div>
          </b-card>
        </div>
      </Flicking>
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
.ins-sm {
  padding: 0 10px;
  .card {
    padding: 0 !important;
    position: relative;
    .card-img {
      height: 200px;
      width: 150px;
    }
    .overflow {
      position: absolute;
      bottom: 0;
      margin-bottom: 20px !important;

      .card-title {
        font-size: 14px;
      }

      .card-text {
        font-size: 12px;
      }
    }
  }
}
.card {
  position: relative;
  padding: 10px;
}

.card-img {
  min-height: 350px;
  max-height: 350px;
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
  bottom: 8px;

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
