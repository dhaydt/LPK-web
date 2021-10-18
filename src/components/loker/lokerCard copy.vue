<template>
  <div class="lokerCard">
    <b-container fluid>
      <b-row cols="4" class="px-4 pt-0 mb-4">
        <b-col v-for="(lok, i) in lokers" :key="i" class="mt-5">
          <b-card :sub-title="lok.kriteria" class="inner-border h-100" no-body>
            <b-card-title class="px-4 pt-4">{{ lok.judul }}</b-card-title>
            <div class="card-subtitle px-4 mt-0" style="min-height: 80px">
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

              <div class="detail text-left">
                <router-link to="#" class="card-link"
                  >Lihat detail ></router-link
                >
              </div>
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
      lokers: [],
      lokerUrl: "",
    };
  },

  created() {
    const mainUrl = localStorage.getItem("apiUrl");
    this.lokerUrl = mainUrl + "/loker";
    this.getLoker();
  },

  methods: {
    async getLoker() {
      const resp = await axios.get(this.lokerUrl);
      this.lokers = resp.data.data;
      console.log(resp.data.data);
    },
  },
};
</script>

<style lang="scss" scoped>
.lokerCard {
  margin-top: 100px;
}

.card {
  background: #ffffff;
  /* Neutral / 05 */

  border: 1px solid #e8eaed;
  box-sizing: border-box;
  box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.04), 0px 2px 6px rgba(0, 0, 0, 0.04),
    0px 0px 1px rgba(0, 0, 0, 0.04);
  border-radius: 8px;
  min-height: 254px;
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
</style>
