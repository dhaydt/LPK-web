import Vue from "vue";
import jQuery from "jquery";
import App from "./App.vue";
import store from "./store";
import router from "./router";
import VueMeta from "vue-meta";
import ElementUI from "element-ui";
import vco from "v-click-outside";
import VueAppend from "vue-append";
import VueCarousel from "vue-carousel";
import BootstrapVue from "bootstrap-vue";
import VueFormWizard from "vue-form-wizard";

import "vue-form-wizard/dist/vue-form-wizard.min.css";
import "element-ui/lib/theme-chalk/index.css";
import "@/assets/scss/app.scss";
import "@/assets/main.scss";

Vue.config.productionTip = false;
Vue.use(require("vue-script2"));
Vue.use(require("vue-moment"));
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
