<template>
  <div class="galeri justify-content-center w-100 row">
    <b-col md="11">
      <div class="card-body border-top text-center">
        <b-row cols-md="3">
          <b-col>
            <b-card no-body>
              <b-row cols-md="2" no-gutters id="row-img">
                <b-col v-for="im in img1" :key="im.id" class="col-img"
                  ><b-img-lazy :src="imgUrl + im.img" class="w-100 h-100">
                  </b-img-lazy
                ></b-col>
              </b-row>
              <b-row class="row-detail flex-column card-body">
                <b-card-title class="text-left px-2"
                  >{{ group1.lokasi }}
                </b-card-title>
                <b-card-text class="text-left px-2 mt-2"
                  >{{ group1.date_range }}
                </b-card-text>
                <div class="detail text-left px-2">
                  <router-link
                    :to="'/galeriKopdar/' + group1.id"
                    class="card-link"
                    >Lihat detail -></router-link
                  >
                </div>
              </b-row>
            </b-card>
          </b-col>
          <b-col>
            <b-card no-body>
              <b-row cols-md="2" no-gutters id="row-img">
                <b-col v-for="im in img2" :key="im.id" class="col-img"
                  ><b-img-lazy :src="imgUrl + im.img" class="w-100 h-100">
                  </b-img-lazy
                ></b-col>
              </b-row>
              <b-row class="row-detail flex-column card-body">
                <b-card-title class="text-left px-2"
                  >{{ group2.lokasi }}
                </b-card-title>
                <b-card-text class="text-left px-2 mt-2"
                  >{{ group2.date_range }}
                </b-card-text>
                <div class="detail text-left px-2">
                  <router-link
                    :to="'/galeriKopdar/' + group2.id"
                    class="card-link"
                    >Lihat detail -></router-link
                  >
                </div>
              </b-row>
            </b-card>
          </b-col>
          <b-col>
            <b-card no-body>
              <b-row cols-md="2" no-gutters id="row-img">
                <b-col v-for="im in img3" :key="im.id" class="col-img"
                  ><b-img-lazy :src="imgUrl + im.img" class="w-100 h-100">
                  </b-img-lazy
                ></b-col>
              </b-row>
              <b-row class="row-detail flex-column card-body">
                <b-card-title class="text-left px-2"
                  >{{ group3.lokasi }}
                </b-card-title>
                <b-card-text class="text-left px-2 mt-2"
                  >{{ group3.date_range }}
                </b-card-text>
                <div class="detail text-left px-2">
                  <router-link
                    :to="'/galeriKopdar/' + group3.id"
                    class="card-link"
                    >Lihat detail -></router-link
                  >
                </div>
              </b-row>
            </b-card>
          </b-col>
        </b-row>
      </div>
    </b-col>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      imgUrl: "",
      kopdarUrl: "",
      data: [],
      group1: {},
      group2: {},
      group3: {},
      img1: [],
      img2: [],
      img3: [],
    };
  },

  created() {
    const mainUrl = localStorage.getItem("apiUrl");
    this.kopdarUrl = mainUrl + "/groupKopdarFront";
    this.imgUrl = mainUrl + "/images/galeri/";
    this.getData();
  },

  mounted() {},

  methods: {
    async getData() {
      const resp = await axios.get(this.kopdarUrl);
      const data = resp.data;
      this.data = data;
      console.log(data);
      this.splitData();
    },
    splitData() {
      this.group1 = this.data.dataGroup[0];
      this.group2 = this.data.dataGroup[1];
      this.group3 = this.data.dataGroup[2];
      const img = this.data.dataImg;

      const grouping = (array) => {
        return array.reduce((result, currentValue) => {
          (result[currentValue.lokasi] =
            result[currentValue.lokasi] || []).push(currentValue);
          return result;
        }, {});
      };
      let lokasi1 = grouping(img, "lokasi");
      this.img1 = lokasi1[this.group1.lokasi].slice(0, 4);
      this.img2 = lokasi1[this.group2.lokasi].slice(0, 4);
      this.img3 = lokasi1[this.group3.lokasi].slice(0, 4);
      console.log(this.img3);
    },
  },
};
</script>

<style lang="scss" scoped>
.card {
  box-shadow: none;
}
#row-img {
  height: 240px;
  max-height: 240px;
  .col-img img {
    max-height: 120px; /* height of container */
    object-fit: cover;
    object-position: 20% 10%; /* try 20px 10px */
    transition: 0.6s;
    border-radius: 4px;
  }
}

.card-title {
  font-style: normal;
  font-weight: 600;
  font-size: 20px;
  text-transform: capitalize;
  line-height: 140%;
  letter-spacing: 0.01em;
  color: #121527;
}

.card-text {
  text-transform: capitalize;
  font-style: normal;
  font-weight: normal;
  font-size: 16px;
  line-height: 140%;
  letter-spacing: 0.01em;
  color: #757682;
}

.card-link {
  text-transform: capitalize;
  text-align: left;
  font-style: normal;
  font-weight: 600;
  font-size: 16px;
  line-height: 24px;
  color: #fd7d24;
}

.card-link:hover {
  color: #8b4c1e;
}
</style>
