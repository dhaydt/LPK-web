<template>
  <section class="visi">
    <b-container>
      <b-row>
        <b-col md="6" sm="8">
          <div class="title">
            <h5>Visi kami</h5>
          </div>
          <div class="subtitle">
            <h1>
              {{ visi }}
            </h1>
          </div>
        </b-col>
        <b-col md="6" sm="12" class="misiCol">
          <div class="title">
            <h5>Misi kami</h5>
          </div>
          <b-row
            v-for="(mis, index) in mission.slice(0, 5)"
            :key="index"
            class="mt-3 misiRow"
          >
            <b-col sm="2" class="d-flex align-items-center">
              <div class="numVisi">
                <span>{{ index + 1 }}</span>
              </div>
            </b-col>
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
      visi: "",
      visiUrl: "",
      visiOnlyUrl: "",
    };
  },

  created() {
    const mainUrl = localStorage.getItem("apiUrl");
    this.visiUrl = mainUrl + "/visi";
    this.visiOnlyUrl = mainUrl + "/visiOnly";
    this.getVisi();
    this.getVO();
  },

  mounted() {
    window.scrollTo(0, 0);
  },

  methods: {
    async getVisi() {
      const resp = await axios.get(this.visiUrl);
      console.log(resp.data.data);
      let data = resp.data.data;

      console.log("visi", data);
      this.mission = resp.data.data;
    },

    async getVO() {
      const resp = await axios.get(this.visiOnlyUrl);
      const data = resp.data.data[0].visi;
      this.visi = data;
    },
  },
};
</script>

<style lang="scss" scoped>
@import "@/assets/main.scss";

@media (max-width: 575.98px) {
  .visi {
    h5 {
      font-size: 16px !important;
    }

    h1 {
      font-weight: 700;
      line-height: 43px;
    }
  }

  .misi span {
    font-size: 16px !important;
    font-weight: 500 !important;
  }
}

.visi {
  background: #ecfef4;
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
  font-style: normal;
  font-weight: 600;
  font-size: 36px;
  line-height: 140%;
  color: #121527;
  text-transform: capitalize;
  text-align: left;
}

.numVisi {
  width: 64px;
  height: 64px;
  left: 0px;
  text-align: center;
  padding: 0;
  top: 16px;
  margin: 0;
  background-color: #fd7d24;
  border-radius: 32px;
  border: none;

  span {
    font-family: Inter;
    font-style: normal;
    font-weight: 600;
    font-size: 28px;
    line-height: 2.3;
    text-align: center;
    color: #ffffff;
  }
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
  font-size: 20px;
  letter-spacing: 0.01em;
  color: #121527;
  font-style: normal;
  font-weight: normal;
  text-align: left;
}
</style>
