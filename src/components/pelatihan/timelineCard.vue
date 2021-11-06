<template>
  <div class="timelineCard">
    <CoolLightBox
      :items="items"
      :index="index"
      loop
      @close="index = null"
      :effect="'fade'"
      id="lightBoxs"
    >
    </CoolLightBox>
    <CoolLightBox
      :items="items1"
      :index="index1"
      loop
      @close="index1 = null"
      :effect="'fade'"
      id="lightBoxs1"
    >
    </CoolLightBox>
    <CoolLightBox
      :items="items2"
      :index="index2"
      loop
      @close="index2 = null"
      :effect="'fade'"
      id="lightBoxs2"
    >
    </CoolLightBox>
    <CoolLightBox
      :items="items3"
      :index="index3"
      loop
      @close="index3 = null"
      :effect="'fade'"
      id="lightBoxs3"
    >
    </CoolLightBox>
    <section class="time-line-box">
      <div class="swiper-container text-center">
        <div class="swiper-wrapper w-100 row">
          <div class="swiper-slide col-md-3 p-0">
            <div class="timestamp"><span class="date">.</span></div>
            <div class="status pt-4">
              <span>{{ group[3] }} </span>
            </div>
            <div
              class="content mt-4 pr-2"
              v-for="(l, imageIndex) in col4"
              :key="imageIndex"
            >
              <b-card no-body>
                <div class="cropped">
                  <b-img
                    @click="setIndex(imageIndex)"
                    :src="imgUrl + l.img"
                    class="card-img"
                    ref="img1"
                    :alt="l.title"
                  ></b-img>
                </div>
                <div class="card-body">
                  <b-card-text>{{ l.date_range }} </b-card-text>
                  <b-card-title>{{ l.title }} </b-card-title>
                </div>
              </b-card>
            </div>
          </div>
          <div class="swiper-slide col-md-3 p-0">
            <div class="timestamp"><span class="date">.</span></div>
            <div class="status pt-4">
              <span>{{ group[2] }}</span>
            </div>
            <div class="content mt-4 pr-2" v-for="(l, i) in col3" :key="i">
              <b-card no-body>
                <div class="cropped">
                  <b-img
                    @click="setIndex1(i)"
                    :src="imgUrl + l.img"
                    class="card-img"
                    :alt="l.title"
                  ></b-img>
                </div>
                <div class="card-body">
                  <b-card-text>{{ l.date_range }} </b-card-text>
                  <b-card-title>{{ l.title }} </b-card-title>
                </div>
              </b-card>
            </div>
          </div>
          <div class="swiper-slide col-md-3 p-0">
            <div class="timestamp"><span class="date">.</span></div>
            <div class="status pt-4">
              <span>{{ group[1] }}</span>
            </div>
            <div class="content mt-4 pr-2" v-for="(l, i2) in col2" :key="i2">
              <b-card no-body>
                <div class="cropped">
                  <b-img
                    @click="setIndex2(i2)"
                    :src="imgUrl + l.img"
                    class="card-img"
                    :alt="l.title"
                  ></b-img>
                </div>
                <div class="card-body">
                  <b-card-text>{{ l.date_range }} </b-card-text>
                  <b-card-title>{{ l.title }} </b-card-title>
                </div>
              </b-card>
            </div>
          </div>
          <div class="swiper-slide col-md-3 p-0">
            <div class="timestamp"><span class="date">.</span></div>
            <div class="status pt-4">
              <span>{{ group[0] }}</span>
            </div>
            <div class="content mt-4 pr-2" v-for="(l, i3) in col1" :key="i3">
              <b-card no-body>
                <div class="cropped">
                  <b-img
                    @click="setIndex3(i3)"
                    :src="imgUrl + l.img"
                    class="card-img"
                    :alt="l.title"
                  ></b-img>
                </div>
                <div class="card-body">
                  <b-card-text>{{ l.date_range }} </b-card-text>
                  <b-card-title>{{ l.title }} </b-card-title>
                </div>
              </b-card>
            </div>
          </div>
        </div>
        <div class="swiper-pagination"></div>
      </div>
    </section>
  </div>
</template>

<script>
import axios from "axios";
import $ from "jquery";
export default {
  data() {
    return {
      index: null,
      index1: null,
      index2: null,
      index3: null,
      items: [],
      items1: [],
      items2: [],
      items3: [],
      mainUrl: "",
      imgUrl: "",
      getOnUrl: "",
      getCol1: "",
      getCol2: "",
      getCol3: "",
      getCol4: "",
      group: [],
      col1: [],
      col2: [],
      col3: [],
      col4: [],
    };
  },

  created() {
    this.mainUrl = localStorage.getItem("apiUrl");
    this.getOnUrl = this.mainUrl + "/timelineGroupOn";
    this.imgUrl = this.mainUrl + "/images/timeline/";
    this.getTab();
  },

  methods: {
    setIndex(index) {
      this.index = index;
      // console.log(divs);
      // var items = this.items;
      var data = {
        i: index,
        items: this.items,
      };
      function appendWa(data) {
        console.log("ite", data);
        var items = data.items;
        var ind = data.i;
        var anchor = items[ind].url;
        console.log(anchor);
        var txt3 = document.createElement("a"); // Create with DOM
        var span = document.createElement("span");
        span.innerHTML = "Hubungi WA";
        txt3.setAttribute("href", anchor);
        txt3.setAttribute("target", "_blank");
        txt3.setAttribute("class", "waOverlay fab fa-whatsapp");
        span.setAttribute("class", "ml-2");
        txt3.append(span);
        $(".cool-lightbox-caption").append(txt3);
        // Append the new elements
      }
      var checkExist = setInterval(function() {
        if ($("#lightBoxs").length) {
          var divs = document.getElementById("lightBoxs");
          console.log(divs);

          appendWa(data);

          clearInterval(checkExist);
        }
      }, 100);
    },
    setIndex1(index) {
      this.index1 = index;
      // console.log(divs);
      // var items = this.items;
      var data = {
        i: index,
        items: this.items1,
      };
      function appendWa(data) {
        console.log("ite", data);
        var items = data.items;
        var ind = data.i;
        var anchor = items[ind].url;
        console.log(anchor);
        var txt3 = document.createElement("a"); // Create with DOM
        var span = document.createElement("span");
        span.innerHTML = "Hubungi WA";
        txt3.setAttribute("href", anchor);
        txt3.setAttribute("target", "_blank");
        txt3.setAttribute("class", "waOverlay fab fa-whatsapp");
        span.setAttribute("class", "ml-2");
        txt3.append(span);
        $(".cool-lightbox-caption").append(txt3);
        // Append the new elements
      }
      var checkExist = setInterval(function() {
        if ($("#lightBoxs1").length) {
          var divs = document.getElementById("lightBoxs1");
          console.log(divs);

          appendWa(data);

          clearInterval(checkExist);
        }
      }, 100);
    },
    setIndex2(index) {
      this.index2 = index;
      // console.log(divs);
      // var items = this.items;
      var data = {
        i: index,
        items: this.items2,
      };
      function appendWa(data) {
        console.log("ite", data);
        var items = data.items;
        var ind = data.i;
        var anchor = items[ind].url;
        console.log(anchor);
        var txt3 = document.createElement("a"); // Create with DOM
        var span = document.createElement("span");
        span.innerHTML = "Hubungi WA";
        txt3.setAttribute("href", anchor);
        txt3.setAttribute("target", "_blank");
        txt3.setAttribute("class", "waOverlay fab fa-whatsapp");
        span.setAttribute("class", "ml-2");
        txt3.append(span);
        $(".cool-lightbox-caption").append(txt3);
        // Append the new elements
      }
      var checkExist = setInterval(function() {
        if ($("#lightBoxs2").length) {
          var divs = document.getElementById("lightBoxs2");
          console.log(divs);

          appendWa(data);

          clearInterval(checkExist);
        }
      }, 100);
    },
    setIndex3(index) {
      this.index3 = index;
      // console.log(divs);
      // var items = this.items;
      var data = {
        i: index,
        items: this.items3,
      };
      function appendWa(data) {
        console.log("ite", data);
        var items = data.items;
        var ind = data.i;
        var anchor = items[ind].url;
        console.log(anchor);
        var txt3 = document.createElement("a"); // Create with DOM
        var span = document.createElement("span");
        span.innerHTML = "Hubungi WA";
        txt3.setAttribute("href", anchor);
        txt3.setAttribute("target", "_blank");
        txt3.setAttribute("class", "waOverlay fab fa-whatsapp");
        span.setAttribute("class", "ml-2");
        txt3.append(span);
        $(".cool-lightbox-caption").append(txt3);
        // Append the new elements
      }
      var checkExist = setInterval(function() {
        if ($("#lightBoxs3").length) {
          var divs = document.getElementById("lightBoxs3");
          console.log(divs);

          appendWa(data);

          clearInterval(checkExist);
        }
      }, 100);
    },

    async getTab() {
      const resp = await axios.get(this.getOnUrl);
      const dataGroup = resp.data.data;
      const filter = dataGroup.map((b) => b.bulan);
      this.group = filter;
      this.getCol1 = this.mainUrl + "/timeline/" + this.group[0];
      this.getCol2 = this.mainUrl + "/timeline/" + this.group[1];
      this.getCol3 = this.mainUrl + "/timeline/" + this.group[2];
      this.getCol4 = this.mainUrl + "/timeline/" + this.group[3];
      this.getCol();
      // console.log(data);
    },

    async getCol() {
      const resp = await axios.get(this.getCol1);
      const data = resp.data.data;
      this.col1 = data;
      const resp1 = await axios.get(this.getCol2);
      const data1 = resp1.data.data;
      this.col2 = data1;
      const resp2 = await axios.get(this.getCol3);
      const data2 = resp2.data.data;
      this.col3 = data2;
      const resp3 = await axios.get(this.getCol4);
      const data3 = resp3.data.data;
      this.col4 = data3;
      // console.log(this.col1);
      this.getImg(data3);
      this.getImg1(data2);
      this.getImg2(data1);
      this.getImg3(data);
    },

    getImg(val) {
      const img = val;
      console.log("col4", val);
      var itemSet = [];
      var newImg = img.map((map) => [map.img, map.url, map.title]);
      for (var idx = 0; idx < newImg.length; idx++) {
        var data = {
          description: " ",
          src: this.imgUrl + newImg[idx][0],
          url: newImg[idx][1],
          title: newImg[idx][2],
        };
        itemSet.push(data);
      }
      console.log(itemSet);

      this.items = itemSet;
    },
    getImg1(val) {
      const img = val;
      console.log("col4", val);
      var itemSet = [];
      var newImg = img.map((map) => [map.img, map.url, map.title]);
      for (var idx = 0; idx < newImg.length; idx++) {
        var data = {
          description: " ",
          src: this.imgUrl + newImg[idx][0],
          url: newImg[idx][1],
          title: newImg[idx][2],
        };
        itemSet.push(data);
      }
      console.log(itemSet);

      this.items1 = itemSet;
    },
    getImg2(val) {
      const img = val;
      console.log("col4", val);
      var itemSet = [];
      var newImg = img.map((map) => [map.img, map.url, map.title]);
      for (var idx = 0; idx < newImg.length; idx++) {
        var data = {
          description: " ",
          src: this.imgUrl + newImg[idx][0],
          url: newImg[idx][1],
          title: newImg[idx][2],
        };
        itemSet.push(data);
      }
      console.log(itemSet);

      this.items2 = itemSet;
    },
    getImg3(val) {
      const img = val;
      console.log("col4", val);
      var itemSet = [];
      var newImg = img.map((map) => [map.img, map.url, map.title]);
      for (var idx = 0; idx < newImg.length; idx++) {
        var data = {
          description: " ",
          src: this.imgUrl + newImg[idx][0],
          url: newImg[idx][1],
          title: newImg[idx][2],
        };
        itemSet.push(data);
      }
      console.log(itemSet);

      this.items3 = itemSet;
    },
  },
};
</script>
<style lang="scss">
@import "@/assets/main.scss";
#lightBoxs,
#lightBoxs1,
#lightBoxs2,
#lightBoxs3 {
  .cool-lightbox-caption {
    display: flex;
    justify-content: center;
    h6 {
      margin-top: 20px;
    }
    .waOverlay {
      color: #fff;
      height: 40px;
      width: 178px;
      justify-content: center;
      border-radius: 4px;
      background-color: #07a148;
      display: flex;
      align-items: center;
      font-weight: 600;
      transition: 0.5s;
      span {
        font-weight: 600;
        font-size: 16px;
        letter-spacing: 0.04em;
      }
    }

    .waOverlay:hover {
      background-color: $paz-secondary;
    }
  }
}
</style>

<style lang="scss" scoped>
@import "@/assets/main.scss";

.cropped {
  height: 128px;
  overflow: hidden;
}

.cropped .card-img {
  margin-top: -100px;
}

.cropped .card-img:hover {
  cursor: pointer;
}
.card-title {
  font-style: normal;
  font-weight: 600;
  font-size: 20px;
  text-transform: capitalize;
  letter-spacing: 0.01em;
  color: #121527;
  text-align: left;
}
.card-text {
  font-style: normal;
  font-weight: 600;
  text-transform: capitalize;
  font-size: 14px;
  text-align: left;
  line-height: 20px;
  color: #07a148;
}

.time-line-box {
  // height: 100px;
  // padding: 100px 0;
  // width: 100%;
  // background-color: #dadefe;
}

.time-line-box .timeline {
  list-style-type: none;
  display: flex;
  padding: 0;
  text-align: center;
}

.time-line-box .timestamp {
  margin: auto;
  margin-bottom: 5px;
  padding: 0px 4px;
  display: flex;
  flex-direction: column;
  align-items: center;
}

.time-line-box .status {
  padding: 0px 10px;
  display: flex;
  justify-content: center;
  border-top: 3px solid #07a148;
  position: relative;
  transition: all 200ms ease-in;
}
.time-line-box .status span {
  padding-top: 8px;
  font-style: normal;
  font-weight: 600;
  font-size: 14px;
  text-align: center;
  color: #000000;
  text-transform: capitalize;
}
.time-line-box .status span:before {
  content: "";
  width: 20px;
  height: 20px;
  background-color: #07a148;
  border-radius: 12px;
  border: 3px solid rgba(7, 161, 72, 0.2);
  position: absolute;
  left: 50%;
  top: 0%;
  -webkit-transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
  transition: all 200ms ease-in;
}

.swiper-container {
  width: 95%;
  margin: auto;
  overflow-y: auto;
}
.swiper-wrapper {
  display: inline-flex;
  flex-direction: row;
  overflow-y: auto;
  justify-content: center;
}
.swiper-container::-webkit-scrollbar-track {
  background: #a8a8a8b6;
}
.swiper-container::-webkit-scrollbar {
  height: 2px;
}
.swiper-container::-webkit-scrollbar-thumb {
  background: #4f4f4f !important;
}
.swiper-slide {
  text-align: center;
  font-size: 12px;
  padding: 0;
  // width: 200px;
  height: 100%;
  position: relative;
}
// tabs
[data-tab-content] {
  display: none;
}

.active[data-tab-content] {
  display: block;
}

body {
  padding: 0;
  margin: 0;
}

.tabs {
  display: flex;
  justify-content: space-around;
  list-style-type: none;
  margin: 0;
  padding: 0;
}

.tab {
  cursor: pointer;
  padding: 10px;
}

.tab.active .status span:before {
  background-color: $paz-secondary;
  border: 2px solid $paz-secondary;
}

.tab:hover .status span:before {
  background-color: $paz-secondary;
}

.tab-content {
  margin-left: 20px;
  margin-right: 20px;
}
</style>
