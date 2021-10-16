<template>
  <div class="container">
    <div class="row">
      <div>
        <vue-easy-lightbox
          :visible="visible"
          :imgs="imgs"
          @hide="visible = false"
        ></vue-easy-lightbox>
      </div>
      <b-container>
        <carousel
          navigationEnabled
          :scrollPerPage="false"
          :paginationEnabled="false"
          :perPageCustom="[
            [480, 2],
            [768, 3],
          ]"
        >
          <template #navigationEnabled>
            <div class="">v</div>
          </template>
          <slide v-for="card in legal" :key="card.id" h>
            <b-card no-body img-top style="width: 20rem;" class="mb-2">
              <div class="imgBox">
                <b-card-img
                  :src="imgUrl + card.img"
                  @click="showSingle(card.img)"
                ></b-card-img>
              </div>
              <b-card-title>{{ card.name }}</b-card-title>
              <b-card-text>
                {{ card.instansi }}
              </b-card-text>
            </b-card>
          </slide>
        </carousel>
      </b-container>
    </div>
  </div>
</template>

<script>
import VueEasyLightbox from "vue-easy-lightbox";
import axios from "axios";
export default {
  data() {
    return {
      imgs: "", // Img Url , string or Array of string
      visible: false,
      index: 0, // default: 0
      legalUrl: "",
      imgUrl: "",
      legal: [],
    };
  },

  components: {
    VueEasyLightbox,
  },

  methods: {
    async getLegal() {
      const resp = await axios.get(this.legalUrl);
      console.log(resp.data.data);
      this.legal = resp.data.data;
    },

    showSingle(val) {
      console.log(val);
      this.imgs = this.imgUrl + val;
      this.show();
    },

    show() {
      this.visible = true;
    },

    handleHide() {
      this.visible = false;
    },
    showImg(i) {
      // this.index = i;
      console.log(i);
      // this.visible = true;
    },
  },

  created() {
    const mainUrl = localStorage.getItem("apiUrl");
    this.legalUrl = mainUrl + "/legal";
    this.imgUrl = mainUrl + "/images/legal/";
    this.getLegal();
  },
};
</script>

<style lang="scss">
@import "@/assets/main.scss";
.VueCarousel-inner {
  max-height: 350px;
}

.imgBox .card-img {
  /* width of container */
  height: 200px; /* height of container */
  object-fit: cover;
  object-position: 20% 10%; /* try 20px 10px */
  transition: 0.6s;
}

.VueCarousel-navigation
  .VueCarousel-navigation-button.VueCarousel-navigation-prev {
  position: absolute;
  padding: 8px 12px !important;
  left: -20px;
  color: #fff;
  transition: 0.3s;
  background-color: $paz-main;
  border-radius: 50%;
}

.VueCarousel-navigation
  .VueCarousel-navigation-button.VueCarousel-navigation-next {
  position: absolute;
  transition: 0.6s;
  padding: 8px 12px !important;
  right: -20px;
  color: #fff;
  background-color: $paz-main;
  border-radius: 50%;
}

.VueCarousel-navigation-button.VueCarousel-navigation-button:hover {
  background-color: $paz-secondary;
}
</style>
<style lang="scss" scoped>
.card {
  box-shadow: 0px 16px 24px rgba(0, 0, 0, 0.06), 0px 2px 6px rgba(0, 0, 0, 0.04),
    0px 0px 1px rgba(0, 0, 0, 0.04);
  border-radius: 4px;
}

.card-img:hover {
  cursor: pointer;
  height: 205px;
  object-position: 30% 10%;
}
.card-title {
  font-style: normal;
  font-weight: 600;
  font-size: 20px;
  text-align: left;
  padding: 20px 20px 10px 20px;
  line-height: 140%;
  letter-spacing: 0.01em;
  color: #121527;
}

.card-text {
  padding: 0 20px 20px 20px;
  font-style: normal;
  font-weight: 500;
  font-size: 16px;
  line-height: 19px;
  text-align: left;
  color: #757682;
}
</style>
