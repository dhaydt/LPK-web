import Vue from "vue";
import VueRouter from "vue-router";
import Home from "../views/index.vue";
import Login from "../views/auth/login.vue";
import Dashboard from "../views/admin/index.vue";
import About from "../views/admin/about";
import Legal from "../views/admin/about/legalitas.vue";
import Struktur from "../views/admin/about/struktur.vue";
import Liputan from "../views/admin/about/liputan.vue";
import Cabang from "../views/admin/about/cabang.vue";
import Instruktur from "../views/admin/instruktur"
import Images from "../views/admin/images"
import Alumni from "../views/admin/images/alumni.vue"
import Loker from "../views/admin/loker"
import Status from "../views/admin/loker/status.vue"
import Setting from "../views/admin/setting"

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "Home",
    component: Home,
  },

  {
    path: "/login",
    name: "Login",
    component: Login,
  },

  {
    path: "/admin",
    name: "Admin",
    component: Dashboard,
    meta: {
      requiresAuth: true,
    },

    children: [
      // UserHome will be rendered inside User's <router-view>
      // when /user/:id is matched
      {
        path: "/admin",
        component: () => import("../components/admin/index.vue"),
      },
      {
        path: "/admin/about",
        component: About,
      },
      {
        path: "/admin/about/legalitas",
        component: Legal,
      },
      {
        path: "/admin/about/struktur",
        component: Struktur,
      },
      {
        path: "/admin/about/liputan",
        component: Liputan,
      },
      {
        path: "/admin/about/cabang",
        component: Cabang,
      },
      {
        path: "/admin/instruktur",
        component: Instruktur,
      },
      {
        path: "/admin/images",
        component: Images,
      },
      {
        path: "/admin/images/alumni",
        component: Alumni,
      },
      {
        path: "/admin/loker",
        component: Loker,
      },
      {
        path: "/admin/loker/status",
        component: Status,
      },{
        path: "/admin/setting",
        component: Setting,
      },
    ],
  },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});


router.beforeEach((to, from, next) => {
  if (to.matched.some((record) => record.meta.requiresAuth)) {
    if (localStorage.getItem("auth") == null) {
      next({
        path: "/login",
        params: { nextUrl: to.fullPath },
      });
    } else {
      let user = JSON.parse(localStorage.getItem("user"));
      if (to.matched.some((record) => record.meta.isAdmin)) {
        if (user.isAdmin == 1) {
          next();
        } else {
          next({ name: "Admin" });
        }
      } else {
        next();
      }
    }
  } else if (to.matched.some((record) => record.meta.guest)) {
    if (localStorage.getItem("auth") == null) {
      next();
    } else {
      next({ name: "userboard" });
    }
  } else {
    next();
  }
});

export default router;
