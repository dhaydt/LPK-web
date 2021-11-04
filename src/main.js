import Vue from "vue";
import VueImg from "v-img";
import App from "./App.vue";
import jQuery from "jquery";
import store from "./store";
import router from "./router";
import VueMeta from "vue-meta";
import vco from "v-click-outside";
import VueAppend from "vue-append";
import ElementUI from "element-ui";
import LazyTube from "vue-lazytube";
import VueCarousel from "vue-carousel";
import BootstrapVue from "bootstrap-vue";
import Flicking from "@egjs/vue-flicking";
import VueFormWizard from "vue-form-wizard";
import vueAwesomeCountdown from "vue-awesome-countdown";

import "vue-form-wizard/dist/vue-form-wizard.min.css";
import "element-ui/lib/theme-chalk/index.css";
import "@egjs/vue-flicking/dist/flicking.css";
import "@/assets/responsive.scss";
import "@/assets/scss/app.scss";
import "@/assets/main.scss";

const vueImgConfig = {
  altAsTitle: true,
  sourceButton: true,
  openOn: "click",
  thumbnails: false,
};

Vue.use(vueAwesomeCountdown, "vac");
Vue.config.productionTip = false;
Vue.use(require("vue-script2"));
Vue.use(require("vue-moment"));
Vue.use(VueImg, vueImgConfig);
Vue.use(VueFormWizard);
Vue.use(BootstrapVue);
Vue.use(BootstrapVue);
Vue.use(VueCarousel);
Vue.use(VueAppend);
Vue.use(ElementUI);
Vue.use(Flicking);
Vue.use(LazyTube);
Vue.use(VueMeta);
Vue.use(vco);

new Vue({
  router,
  store,
  jQuery,
  render: function(h) {
    return h(App);
  },
}).$mount("#app");
