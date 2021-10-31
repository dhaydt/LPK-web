import Vue from "vue";
import VueImg from "v-img";
import App from "./App.vue";
import jQuery from "jquery";
import store from "./store";
import router from "./router";
import VueMeta from "vue-meta";
import ElementUI from "element-ui";
import vco from "v-click-outside";
import VueAppend from "vue-append";
import VueCarousel from "vue-carousel";
import BootstrapVue from "bootstrap-vue";
import VueFormWizard from "vue-form-wizard";
import VueLazyLoadVideo from "vue-lazyload-video";
import vueAwesomeCountdown from "vue-awesome-countdown";

import "vue-form-wizard/dist/vue-form-wizard.min.css";
import "element-ui/lib/theme-chalk/index.css";
import "@/assets/responsive.scss";
import "@/assets/scss/app.scss";
import "@/assets/main.scss";

const vueImgConfig = {
  altAsTitle: true,
  sourceButton: true,
  openOn: "click",
  thumbnails: false,
};

Vue.use(VueImg, vueImgConfig);
Vue.use(vueAwesomeCountdown, "vac");
Vue.config.productionTip = false;
Vue.use(require("vue-script2"));
Vue.use(require("vue-moment"));
Vue.use(VueLazyLoadVideo);
Vue.use(VueFormWizard);
Vue.use(BootstrapVue);
Vue.use(BootstrapVue);
Vue.use(VueCarousel);
Vue.use(VueAppend);
Vue.use(ElementUI);
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
