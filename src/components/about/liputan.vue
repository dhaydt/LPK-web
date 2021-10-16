<template>
  <section class="aboutBlog">
    <b-container>
      <b-row class="justify-content-center">
        <b-col md="7">
          <div class="head">
            <span>liputan media</span>
          </div>
          <h2 class="mt-4">
            Dapatkan informasi tentang kegiatan yang telah kami selenggarakan
            disini
          </h2>
          <b-button variant="outline-success seemore" href="#" class="mt-4 px-4"
            ><span
              ><img src="../../assets/images/blog.png" alt="info" height="25" />
              Lihat semua</span
            ></b-button
          >
        </b-col>
      </b-row>
      <b-row class="cardNews" style="max-height: 434px !important;">
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
                      ><span>Selengkapnya </span
                      ><i class="fas fa-arrow-right"></i
                    ></router-link>
                  </b-card-body>
                </b-col>
              </b-row>
            </b-card>
          </b-card-group>
        </b-col>
      </b-row>
    </b-container>
  </section>
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

.cardNews {
  margin-top: 70px;
}

.head {
  span {
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
}

h2 {
  font-style: normal;
  font-weight: 600;
  line-height: 140%;
  /* or 48px */
  color: #2e3e5c;
  text-align: center;
  letter-spacing: 0.5px;
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
