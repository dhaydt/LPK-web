<template>
  <section class="visi">
    <b-container>
      <b-row>
        <b-col>
          <div class="title">
            <h5>Visi kami</h5>
          </div>
          <div class="subtitle">
            <h1>PAZtrooper Profesional, Beradab, dan Berdaya Juang</h1>
          </div>
        </b-col>
        <b-col>
          <div class="title">
            <h5>Misi kami</h5>
          </div>
          <b-row v-for="(mis, index) in mission" :key="index" class="mt-3">
            <b-col sm="2" class="d-flex align-items-center"
              ><b-avatar :text="JSON.stringify(mis.id)" size="lg"></b-avatar
            ></b-col>
            <b-col sm="10" class="misi text-left"
              ><span>{{ mis.misi }}</span>
            </b-col>
          </b-row>
        </b-col>
      </b-row>
    </b-container>
  </section>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      mission: [],
      visiUrl: "",
    };
  },

  created() {
    const mainUrl = localStorage.getItem("apiUrl");
    this.visiUrl = mainUrl + "/visi";
    this.getVisi();
  },

  methods: {
    async getVisi() {
      const resp = await axios.get(this.visiUrl);
      console.log(resp.data.data);
      this.mission = resp.data.data;
    },
  },
};
</script>

<style lang="scss" scoped>
@import "@/assets/main.scss";

.visi {
  background-color: $paz-dark;
  height: 803px;
  margin-top: -32px;
}

h5 {
  text-transform: uppercase;
  color: $paz-secondary;
  font-style: normal;
  font-weight: bold;
  margin-top: 100px;
  font-size: 20px;
  text-align: left;
  line-height: 160%;
  letter-spacing: 0.5px;
}

h1 {
  color: #fff;
  font-style: normal;
  font-weight: bold;
  text-align: left;
  font-size: 40px;
  line-height: 140%;
}

span.b-avatar {
  background-color: $paz-secondary;
}

span.b-avatar-text {
  font-style: normal;
  font-weight: 600;
  font-size: 28px;
  line-height: 100%;
  text-align: center;
  color: #ffffff;
}

.misi span {
  font-style: normal;
  font-weight: normal;
  font-size: 20px;
  text-align: left;
  line-height: 160%;
  letter-spacing: 0.01em;
  color: #ffffff;
}
</style>
