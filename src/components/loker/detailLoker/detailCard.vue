<template>
  <div class="detailCard">
    <b-container fluid>
      <b-row cols="1" cols-md="2">
        <b-col md="7" sm="12">
          <b-card no-body class="text-left main">
            <b-card-title>{{ newLoker.judul }}</b-card-title>
            <div class="location d-flex mt-3">
              <i class="fas fa-map-marker-alt mr-2"></i
              ><b-card-text>{{ newLoker.alamat }}</b-card-text>
            </div>

            <div class="location d-flex mt-4">
              <i class="fas fa-briefcase mr-2"></i
              ><b-card-text>{{ newLoker.pengalaman }}</b-card-text>
            </div>

            <div class="deskripsi mt-5">
              <h3 class="title">
                deskripsi
              </h3>
              <div class="subtitle mb-2">
                deskripsi pekerjaan :
              </div>
              <span v-html="newLoker.deskripsi"></span>
              <div class="subtitle mt-3 mb-2">
                kualifikasi persyaratan :
              </div>
              <span v-html="newLoker.kualifikasi"></span>
              <div class="subtitle mt-3 mb-2">
                Jenis pekerjaan :
              </div>
              <div v-if="newLoker.jenis">
                <span v-for="(jenis, i) in JSON.parse(newLoker.jenis)" :key="i">
                  {{ jenis }},
                </span>
              </div>
              <div class="subtitle mt-3 mb-2">
                Besaran gaji :
              </div>
              <span>{{ newLoker.gaji }} </span>

              <span class="mt-3 d-block">{{ newLoker.note }} </span>
            </div>

            <div class="action mt-5">
              <b-row>
                <b-col>
                  <router-link
                    :to="'/apply/' + newLoker.id + '/' + newLoker.judul"
                  >
                    <b-button class="w-100 lamar">Lamar Pekerjaan</b-button>
                  </router-link>
                </b-col>
                <b-col>
                  <router-link to="#">
                    <b-button class="w-100 share" variant="primary"
                      >Bagikan</b-button
                    >
                  </router-link>
                </b-col>
              </b-row>
            </div>
          </b-card>
        </b-col>
        <b-col md="5">
          <b-card class="side">
            <b-card-title class="header"
              >Lowongan pekerjaan lainnya</b-card-title
            >
            <b-row class="flex-column mt-4">
              <b-col v-for="(lok, i) in random" :key="i" class="">
                <b-card
                  :sub-title="lok.kriteria"
                  class="inner-border h-100"
                  no-body
                >
                  <b-card-title class="px-4 pt-4">{{ lok.judul }}</b-card-title>
                  <div class="card-subtitle px-4 mt-0">
                    {{ lok.kriteria }}
                  </div>
                  <b-row
                    class="flex-column justify-content-between px-4 h-100 pb-4"
                    no-gutters
                  >
                    <div class="location d-flex mt-3">
                      <i class="fas fa-map-marker-alt mr-2"></i
                      ><b-card-text>{{ lok.alamat }}</b-card-text>
                    </div>

                    <div class="location d-flex mt-3">
                      <i class="fas fa-briefcase mr-2"></i
                      ><b-card-text>{{ lok.pengalaman }}</b-card-text>
                    </div>

                    <div class="detail text-left mt-4">
                      <a @click="getId(lok.id)" class="card-link"
                        >Lihat detail ></a
                      >
                    </div>
                  </b-row>
                </b-card>
              </b-col>
            </b-row>
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
      randomUrl: "",
      random: [],
      newLoker: {},
      mainUrl: "",
      idUrl: "",
    };
  },

  created() {
    const mainUrl = localStorage.getItem("apiUrl");
    this.mainUrl = mainUrl;
    this.idUrl = mainUrl + "/loker/";
    this.randomUrl = mainUrl + "/loker-random";
    const id = this.$route.params.id;
    this.getLoker(id);
    this.getRandom();
  },

  mounted() {
    window.scrollTo(0, 0);
  },

  methods: {
    async getLoker(id) {
      // const id = this.$route.params.id;
      const resp = await axios.get(this.idUrl + id);
      this.newLoker = resp.data.data[0];
    },
    async getRandom() {
      const resp = await axios.get(this.randomUrl);
      this.random = resp.data.data;
      // console.log(this.random);
    },

    async getId(val) {
      history.pushState(null, null, "/loker/" + val);
      this.getLoker(val);
      // const resp = await axios.get(this.idUrl + val);
      // this.newLoker = resp.data.data[0];
    },
  },
};
</script>

<style lang="scss" scoped>
.detailCard {
  margin-top: 106px;
}

.container-fluid {
  padding: 0 106px;
}

.side {
  box-shadow: none;
  .card-title.header {
    font-style: normal;
    font-weight: 600;
    font-size: 24px;
    line-height: 1;
    text-transform: capitalize;
    text-align: left;
    letter-spacing: 0.5px;
    color: #121527;
  }

  .card {
    background: #ffffff;
    /* Neutral / 05 */

    border: 1px solid #e8eaed;
    box-sizing: border-box;
    box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.04),
      0px 2px 6px rgba(0, 0, 0, 0.04), 0px 0px 1px rgba(0, 0, 0, 0.04);
    border-radius: 8px;
    min-height: 232px;
  }

  .card-title {
    text-align: left;
    font-style: normal;
    font-weight: bold;
    font-size: 20px;
    line-height: 28px;
    color: #1a382a;
  }

  .card-subtitle {
    font-style: normal;
    font-weight: normal;
    font-size: 14px;
    margin-top: 10px;
    text-align: left;
    line-height: 22px;
    color: #4d645a;
  }

  .location i {
    color: #fd7d24;
  }

  .card-text {
    font-style: normal;
    font-weight: 500;
    font-size: 14px;
    line-height: 1;
    text-align: left;
    color: #4d645a;
  }

  .detail {
    margin-top: 10px;
    cursor: pointer;
  }

  .card-link {
    text-align: left;
    font-style: normal;
    font-weight: 500;
    font-size: 14px;
    line-height: 22px;
    color: #fd7d24;
  }

  .card-link:hover {
    color: #8b4c1e;
  }

  .inner-border {
    border-top: 5px solid #07a148;
  }
}

.main {
  box-shadow: none;
  .card-title {
    font-style: normal;
    font-weight: 600;
    font-size: 34px;
    text-transform: capitalize;
    line-height: 1;
    letter-spacing: 0.5px;
    color: #121527;
  }

  .location i {
    color: #fd7d24;
  }

  .card-text {
    font-style: normal;
    font-weight: normal;
    font-size: 16px;
    line-height: 1;
    color: #757682;
  }

  .title {
    text-transform: capitalize;
    font-style: normal;
    font-weight: 600;
    font-size: 20px;
    color: #121527;
  }

  .subtitle {
    text-transform: capitalize;
    font-style: normal;
    font-weight: 600;
    font-size: 16px;
    color: #121527;
  }

  .lamar {
    background-color: #07a148;
    border-radius: 4px;
    font-style: normal;
    font-weight: 600;
    font-size: 16px;
    line-height: 19px;
    letter-spacing: 0.04em;
    transition: 0.4s;
    color: #ffffff;
  }

  .share {
    background-color: #ffffff;
    border: 1px solid #e9e9e9;
    box-sizing: border-box;
    border-radius: 4px;
    font-style: normal;
    font-weight: 600;
    transition: 0.4s;
    font-size: 16px;
    line-height: 19px;
    letter-spacing: 0.04em;
    color: #121527;
  }

  .lamar:hover {
    background-color: #fd7d24;
    border: 1px solid #f06706;
  }

  .share:hover {
    background-color: #e9e9e9;
  }
}
</style>
