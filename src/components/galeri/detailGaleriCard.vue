<template>
  <section class="mb-4 gallery">
    <b-container>
      <b-row class="justify-content-center">
        <b-col lg="9">
          <b-card sub-title="Card subtitle" no-body>
            <template #header>
              <b-card-title> {{ title.lokasi }} </b-card-title>
            </template>
            <div id="moon"></div>
            <b-card-body>
              <b-card-text class="mt-2">
                {{ title.konten }}
              </b-card-text>
              <div class="head">
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
export default {
  components: {
    CardDetail,
  },
  props: ["data"],
  data() {
    return {
      getUrl: "",
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
  },

  mounted() {
    this.getData();
  },

  methods: {
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
  font-weight: 600;
  line-height: 45px;
  letter-spacing: 0.5px;
  text-align: center;
  color: #2e3e5c;
}

.card-text {
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
