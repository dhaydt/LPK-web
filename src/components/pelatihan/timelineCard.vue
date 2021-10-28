<template>
  <div class="timelineCard">
    <section class="time-line-box">
      <div class="swiper-container text-center">
        <div class="swiper-wrapper w-100 row">
          <div class="swiper-slide col-md-3 p-0">
            <div class="timestamp"><span class="date">.</span></div>
            <div class="status pt-4">
              <span>{{ group[3] }} </span>
            </div>
            <div class="content mt-4 pr-2" v-for="l in col4" :key="l.i">
              <b-card no-body>
                <div class="cropped">
                  <b-img
                    :src="imgUrl + l.img"
                    class="card-img"
                    v-img:group
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
            <div class="content mt-4 pr-2" v-for="l in col3" :key="l.i">
              <b-card no-body>
                <div class="cropped">
                  <b-img
                    :src="imgUrl + l.img"
                    class="card-img"
                    v-img:group1
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
            <div class="content mt-4 pr-2" v-for="l in col2" :key="l.i">
              <b-card no-body>
                <div class="cropped">
                  <b-img
                    :src="imgUrl + l.img"
                    class="card-img"
                    v-img:group2
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
            <div class="content mt-4 pr-2" v-for="l in col1" :key="l.i">
              <b-card no-body>
                <div class="cropped">
                  <b-img
                    :src="imgUrl + l.img"
                    class="card-img"
                    v-img:group3
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
export default {
  data() {
    return {
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
      console.log(this.col1);
    },
  },
};
</script>

<style lang="scss" scoped>
@import "@/assets/main.scss";
.cropped {
  height: 128px;
  overflow: hidden;
}
.cropped .card-img {
  margin-top: -100px;
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
