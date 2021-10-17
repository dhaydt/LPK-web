<template>
  <div class="liputanCard cardNews row" style="max-height: 434px !important;">
    <b-col md="6" sm="12" class="px-0">
      <b-card class="card-overlay main mb-0" no-body>
        <b-card-img-lazy
          :src="imgUrl + (liput.img ? liput.img : 'default')"
        ></b-card-img-lazy>
        <div class="overlay-bg">
          <b-card-text class="date">
            {{ liput.date | moment("MMMM Do YYYY") }}
          </b-card-text>
          <b-card-title>
            {{ liput.title }}
          </b-card-title>
          <router-link to="#"
            ><span>Selengkapnya </span><i class="fas fa-arrow-right"></i
          ></router-link>
        </div>
      </b-card>
    </b-col>
    <b-col
      class="d-flex flex-column justify-content-between px-0"
      md="6"
      sm="12"
    >
      <b-card-group v-for="(n, i) in news" :key="i">
        <b-card no-body class="overflow-hidden m-2 childNews" style="">
          <b-row no-gutters>
            <b-col md="5">
              <b-card-img-lazy
                :src="imgUrl + n.img"
                alt="Image"
                height="100"
                class="rounded-0"
              ></b-card-img-lazy>
            </b-col>
            <b-col md="7">
              <b-card-body class="px-4 py-0 childNews">
                <b-card-title>{{ n.title }}</b-card-title>
                <b-card-text class="mb-0">{{
                  n.date | moment("DD/MM/YYYY")
                }}</b-card-text>
                <router-link to="#"
                  ><span>Selengkapnya </span><i class="fas fa-arrow-right"></i
                ></router-link>
              </b-card-body>
            </b-col>
          </b-row>
        </b-card>
      </b-card-group>
    </b-col>
  </div>
</template>

<script>
import "vue-moment";
import axios from "axios";
export default {
  data() {
    return {
      lastUrl: "",
      secondUrl: "",
      imgUrl: "",
      liput: [],
      img1: require("../../assets/images/police.png"),
      news: [],
    };
  },
  created() {
    const mainUrl = localStorage.getItem("apiUrl");
    this.lastUrl = mainUrl + "/liputanLast";
    this.secondUrl = mainUrl + "/liputanSecond/";
    this.imgUrl = mainUrl + "/images/liputan/";
    this.getNew();
    this.getSecond();
  },

  methods: {
    async getNew() {
      const resp = await axios.get(this.lastUrl);
      this.liput = resp.data.data[0];
      console.log(this.liput);
    },
    async getSecond() {
      const resp = await axios.get(this.secondUrl);
      console.log(resp);
      this.news = resp.data.data;
    },
  },
};
</script>

<style lang="scss" scoped>
.cardNews {
  margin-top: 70px;
}

.card-body {
  text-align: left;
  h4.card-title {
    font-style: normal;
    font-weight: 600;
    font-size: 16px;
    line-height: 160%;
    color: #2e3e5c;
  }
  .card-text {
    font-style: normal;
    font-weight: normal;
    font-size: 16px;
    line-height: 140%;
    color: #757682;
  }

  a {
    font-style: normal;
    font-weight: 600;
    font-size: 16px;
    color: #fd7d24;
  }
}

.card.main {
  .overlay-bg {
    background-color: rgba(26, 30, 39, 0.7);
    position: absolute;
    text-align: left;
    width: 100%;
    padding-bottom: 16px;
    z-index: 1;
    bottom: 0;
    left: 0;

    .date {
      font-style: normal;
      font-weight: normal;
      font-size: 16px;
      padding: 16px;
      margin: 0;
      line-height: 140%;
      color: #ffffff;
    }

    .card-title {
      font-style: normal;
      padding: 0 16px;
      font-weight: 600;
      font-size: 24px;
      line-height: 160%;
      letter-spacing: 0.5px;
      color: #ffffff;
    }

    a span {
      font-style: normal;
      font-weight: 600;
      padding: 0 10px 16px 16px;
      margin-bottom: 16px;
      font-size: 16px;
      line-height: 140%;
      color: #fd7d24;
    }
    a i {
      color: #fd7d24;
    }

    a:hover span,
    a:hover i {
      color: #ffa25f;
    }
  }
}
</style>
