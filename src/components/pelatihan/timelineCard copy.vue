<template>
  <div class="timelineCard">
    <section class="time-line-box">
      <div class="swiper-container text-center">
        <div class="swiper-wrapper w-100 row tabs">
          <li
            data-tab-target="#home"
            class="active tab swiper-slide col-md-3 p-0"
          >
            <div class="timestamp"><span class="date">.</span></div>
            <div class="status pt-4">
              <span>{{ group[0] }} </span>
            </div>
          </li>
          <li data-tab-target="#pricing" class="tab swiper-slide col-md-3 p-0">
            <div class="timestamp"><span class="date">.</span></div>
            <div class="status pt-4">
              <span>{{ group[1] }}</span>
            </div>
          </li>
          <li data-tab-target="#about" class="tab swiper-slide col-md-3 p-0">
            <div class="timestamp"><span class="date">.</span></div>
            <div class="status pt-4">
              <span>{{ group[2] }}</span>
            </div>
          </li>
          <li data-tab-target="#news" class="tab swiper-slide col-md-3 p-0">
            <div class="timestamp"><span class="date">.</span></div>
            <div class="status pt-4">
              <span>{{ group[3] }}</span>
            </div>
          </li>
        </div>
        <div class="swiper-pagination"></div>
      </div>
    </section>
    <!-- <ul class="tabs">
        <li data-tab-target="#home" class="active tab">Home</li>
        <li data-tab-target="#pricing" class="tab">Pricing</li>
        <li data-tab-target="#about" class="tab">About</li>
        <li data-tab-target="#news" class="tab">News</li>
      </ul> -->

    <div class="tab-content pt-4">
      <div id="home" data-tab-content class="active">
        <h1>Home</h1>
        <p>This is the home</p>
      </div>
      <div id="pricing" data-tab-content>
        <h1>Pricing</h1>
        <p>Some information on pricing</p>
      </div>
      <div id="about" data-tab-content>
        <h1>About</h1>
        <p>Let me tell you about me</p>
      </div>
      <div id="news" data-tab-content>
        <h1>News</h1>
        <p>News is great.</p>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      getOnUrl: "",
      group: [],
    };
  },

  created() {
    const mainUrl = localStorage.getItem("apiUrl");
    this.getOnUrl = mainUrl + "/timelineGroupOn";
    this.getTab();
  },

  mounted() {
    const tabs = document.querySelectorAll("[data-tab-target]");
    const tabContents = document.querySelectorAll("[data-tab-content]");

    tabs.forEach((tab) => {
      tab.addEventListener("click", () => {
        const target = document.querySelector(tab.dataset.tabTarget);
        tabContents.forEach((tabContent) => {
          tabContent.classList.remove("active");
        });
        tabs.forEach((tab) => {
          tab.classList.remove("active");
        });
        tab.classList.add("active");
        target.classList.add("active");
      });
    });
  },

  methods: {
    async getTab() {
      const resp = await axios.get(this.getOnUrl);
      const data = resp.data.data;
      const filter = data.map((b) => b.bulan);
      console.log(filter);
      this.group = filter;
    },
  },
};
</script>

<style lang="scss" scoped>
@import "@/assets/main.scss";
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
