import Vue from 'vue'
import App from './App.vue'
import BootstrapVue from 'bootstrap-vue'
import router from './router'
import store from './store'

import "@/assets/scss/app.scss";
Vue.config.productionTip = false
Vue.use(BootstrapVue)
new Vue({
  router,
  store,
  render: function (h) { return h(App) }
}).$mount('#app')
