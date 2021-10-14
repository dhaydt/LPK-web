import Vue from "vue";
import App from "./App.vue";
import BootstrapVue from "bootstrap-vue";
import jQuery from "jquery";
import VueMeta from "vue-meta";
import VueAppend from "vue-append";
import router from "./router";
import store from "./store";

import "@/assets/scss/app.scss";
import "@/assets/main.scss";
import vco from "v-click-outside";
Vue.config.productionTip = false;
Vue.use(BootstrapVue);
Vue.use(VueAppend);
Vue.config.productionTip = false;
Vue.use(require("vue-script2"));
Vue.use(BootstrapVue);
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
