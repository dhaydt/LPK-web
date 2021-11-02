<template>
  <section class="mb-2 gallery">
    <b-container>
      <b-row class="justify-content-center">
        <b-col md="9" sm="9">
          <b-card no-body v-if="images[0].lokasi" class="kopdar">
            <template #header>
              <b-card-title>
                {{ images[0].lokasi }}
              </b-card-title>
            </template>
            <div id="moon"></div>
            <b-card-body class="pt-0">
              <b-card-text>
                {{ "Pertemuan antar alumni PAZ tiap daerah" }}
              </b-card-text>
              <div class="head mt-3" v-if="images[0].date_range">
                <span>{{ images[0].date_range }} </span>
              </div>
            </b-card-body>
          </b-card>

          <b-card no-body v-if="title.lokasi" class="galeriess">
            <template #header>
              <b-card-title>
                {{ title.lokasi }}
              </b-card-title>
            </template>
            <div id="moon"></div>
            <b-card-body class="pt-0">
              <b-card-text v-if="title.konten">
                {{ title.konten }}
              </b-card-text>
              <div class="head mt-3" v-if="title.date_range">
                <span>{{ title.date_range }} </span>
              </div>
            </b-card-body>
          </b-card>
        </b-col>
      </b-row>
    </b-container>
    <div id="shape">
      <div id="moons"></div>
    </div>
    <b-row class="justify-content-center w-100">
      <CardDetail :images="images" v-if="images.length !== 0"></CardDetail>
    </b-row>
  </section>
</template>

<script>
import axios from "axios";
import CardDetail from "./cardDetail";
import $ from "jquery";
export default {
  components: {
    CardDetail,
  },
  props: ["data"],
  data() {
    return {
      getUrl: "",
      kopdarUrl: "",
      images: [],
      title: {},
    };
  },

  watch: {
    images: function(val) {
      this.images = val;
      console.log("val", val);
    },
  },

  created() {
    window.scrollTo(0, 0);
    const mainUrl = localStorage.getItem("apiUrl");
    this.getUrl = mainUrl + ("/detail/" + this.$route.params.id);
    this.kopdarUrl = mainUrl + ("/detailKopdar/" + this.$route.params.id);
  },

  mounted() {
    const id = this.$route.params.id;
    console.log(id.length);
    if (this.$route.params.id.length < 5) {
      this.getData();
    } else {
      this.getKopdar();
    }
    // const title = this.title.lokasi ? this.title.lokasi : this.images[0].lokasi;
    // console.log("title", title);
  },

  methods: {
    async getKopdar() {
      const resp = await axios.get(this.kopdarUrl);
      const data = resp.data;
      this.images = data;
      // console.log(data);
    },
    hideNav() {
      //   window.addEventListener("scroll", function() {
      //   var navi = this.document.querySelector(".navfront");
      //   if (navi !== null) {
      //     navi.classList.toggle("sticky", window.scrollY > 0);
      //   }
      // });
      $(".navbar").css({ "margin-top": "-40px" });
    },
    async getData() {
      const resp = await axios.get(this.getUrl);
      const data = resp.data;
      this.images = data.dataImg;
      console.log("detail", this.images);
      this.title = data.dataGroup[0];
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
section {
  // margin-top: 100px;
}

.card {
  border: none;
  box-shadow: none;
}

.card-header {
  background-color: transparent;
}

.card-title {
  font-size: 32px;
  font-style: normal;
  text-transform: capitalize;
  font-weight: 600;
  line-height: 45px;
  letter-spacing: 0.5px;
  text-align: center;
  color: #2e3e5c;
}

.card-text {
  text-transform: capitalize;
  font-size: 24px;
  font-style: normal;
  font-weight: 400;
  line-height: 38px;
  letter-spacing: 0px;
  text-align: center;
  color: #686870;
}

em {
  font-size: 20px;
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
</style>
