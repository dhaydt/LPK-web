<template>
  <section class="mb-4 cabang">
    <b-container>
      <b-row class="justify-content-center">
        <b-col lg="9">
          <b-card sub-title="Card subtitle" no-body>
            <template #header>
              <div class="head">
                <span>Kantor Cabang</span>
              </div>
            </template>
            <div id="moon"></div>
            <b-card-body>
              <b-card-title class="main-title"
                >Daftar kantor cabang LKP PAZ Al Kasaw</b-card-title
              >
            </b-card-body>
          </b-card>
        </b-col>
      </b-row>
    </b-container>
    <div id="shape">
      <div id="moons"></div>
    </div>
    <b-row class="justify-content-center w-100 m-0">
      <b-col md="12">
        <div class="card-body border-top text-center">
          <b-row class="justify-content-center">
            <b-col md="5" sm="10" v-for="cab in cabang" :key="cab.id">
              <b-card class="card-overlay" no-body>
                <b-card-img-lazy
                  top
                  :src="imgUrl + cab.img"
                  fluid
                ></b-card-img-lazy>
                <div class="overlay-bg">
                  <b-card-title>
                    {{ cab.name }}
                  </b-card-title>
                  <b-row class="px-3"
                    ><b-col md="1" sm="1" class="d-flex align-items-center"
                      ><i class="fas fa-map-marker-alt text-white"></i
                    ></b-col>
                    <b-col md="11" sm="7">
                      <b-card-text class="mb-0">
                        {{ cab.address }}
                      </b-card-text>
                    </b-col></b-row
                  >
                  <b-row class="mt-2 px-3 pb-3">
                    <b-col md="1" sm="1" class="d-flex align-items-center"
                      ><i class="fas fa-phone-alt text-white"></i
                    ></b-col>
                    <b-col md="11" sm="7" class="d-flex align-items-center"
                      ><span>{{ cab.telp }}</span></b-col
                    >
                  </b-row>
                </div>
              </b-card>
            </b-col>
          </b-row>
        </div>
      </b-col>
    </b-row>
  </section>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      overlay: true,
      cabangUrl: "",
      imgUrl: "",
      cabang: [],
    };
  },
  created() {
    const mainUrl = localStorage.getItem("apiUrl");
    this.cabangUrl = mainUrl + "/cabang";
    this.imgUrl = mainUrl + "/images/cabang/";
    this.getCabang();
  },
  methods: {
    async getCabang() {
      const resp = await axios.get(this.cabangUrl);
      this.cabang = resp.data.data;
    },
  },
};
</script>
<style lang="scss" scoped>
@media (max-width: 575.98px) {
  section.cabang {
    .card-title.main-title {
      font-size: 30px;
      line-height: 1;
    }
  }
}
.overlay-bg {
  background-color: rgba(26, 30, 39, 0.7);
  position: absolute;
  z-index: 1;
  bottom: 0;
  width: 100%;
  left: 0;
}
.card-overlay {
  .card-title {
    font-style: normal;
    font-weight: 600;
    font-size: 24px;
    margin-bottom: 0;
    text-transform: uppercase;
    text-align: left;
    padding: 10px;
    line-height: 160%;
    letter-spacing: 0.01em;
    color: #ffffff;
  }
}
#moon {
  font-size: 20em;
  display: inline-block;
  width: 0.4em;
  box-sizing: content-box;
  height: 0.4em;
  background-color: #fd7d24;
  border: 0.3em solid #fd7d24;
  position: absolute;
  left: -264px;
  opacity: 0.1;
  top: 300px;
}

#shape {
  position: absolute;
  right: 0;
  top: 1700px;
  width: 60px;
  overflow: hidden;
}

#moons {
  font-size: 20em;
  display: inline-block;
  width: 0.2em;
  box-sizing: content-box;
  height: 0.2em;
  border: 0.1em solid #fd7d24;
  background-color: #fd7d24;
  opacity: 0.1;
}
section {
  margin-top: 100px;
}

.head span {
  font-weight: 600;
  font-size: 16px;
  font-style: normal;
  line-height: 26px;
  letter-spacing: 0.2em;
  text-transform: uppercase;
  color: #07a148;
  padding-bottom: 5px;
  border-bottom: 2px solid #07a148;
}

.card {
  border: none;
  box-shadow: none;
}

.card-header {
  background-color: transparent;
}

.card-title {
  font-style: normal;
  font-weight: 600;
  font-size: 32px;
  text-transform: capitalize;
  text-align: center;
  letter-spacing: 0.5px;
  color: #2e3e5c;
}

.card-title h3 {
  font-style: normal;
  font-weight: 800;
  font-size: 20px;
  text-transform: uppercase;
  line-height: 160%;
  /* or 38px */
  letter-spacing: 0.01em;
  color: #ffffff;
  text-align: left;
}

.card-text {
  font-style: normal;
  font-weight: normal;
  font-size: 14px;
  line-height: 19px;
  text-align: left;
  /* White */
  color: #ffffff;
}

span {
  font-style: normal;
  font-weight: normal;
  font-size: 14px;
  line-height: 19px;
  letter-spacing: 0.01em;
  text-align: left;
  /* White */
  color: #ffffff;
}
</style>
