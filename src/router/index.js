import Vue from "vue";
import VueRouter from "vue-router";

// Home section
import Home from "../views/index.vue";
import HomeAbout from "../views/about/index.vue";
import HomeLiputan from "../views/liputan/index.vue";
import HomeInstruktur from "../views/instruktur/index.vue";
import HomeEvent from "../views/event/index.vue";
import HomeLoker from "../views/loker/index.vue";
import DetailLoker from "../views/loker/detailLoker.vue";
import Apply from "../views/loker/applyLoker.vue";
import HomeGaleri from "../views/galeri/index.vue";
import HomeGaleriDetail from "../views/galeri/galeriDetail/index.vue";

// Admin panel
import Register from "../views/auth/register.vue";
import Login from "../views/auth/login.vue";
import Dashboard from "../views/admin/index.vue";
import About from "../views/admin/about";
import Legal from "../views/admin/about/legalitas.vue";
import Struktur from "../views/admin/about/struktur.vue";
import Liputan from "../views/admin/about/liputan.vue";
import Cabang from "../views/admin/about/cabang.vue";
import Instruktur from "../views/admin/instruktur";
import Pelatihan from "../views/admin/pelatihan";
import Images from "../views/admin/images";
import Alumni from "../views/admin/images/alumni.vue";
import Loker from "../views/admin/loker";
import ViewApply from "../views/admin/loker/status/viewApply.vue";
import Testimoni from "../views/admin/testimoni";
import Status from "../views/admin/loker/status.vue";
import Kuis from "../views/admin/loker/kuis.vue";
import Setting from "../views/admin/setting";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    component: Home,
    children: [
      // UserHome will be rendered inside User's <router-view>
      // when /user/:id is matched
      {
        path: "/",
        component: () => import("../views/home/index.vue"),
      },
      {
        path: "/aboutus",
        component: HomeAbout,
      },
      {
        path: "/liputan",
        component: HomeLiputan,
      },
      {
        path: "/instruktur",
        component: HomeInstruktur,
      },
      {
        path: "/galeri",
        component: HomeGaleri,
      },
      {
        path: "/galeri_detail/:id",
        name: "Galeri_detail",
        component: HomeGaleriDetail,
      },
      {
        path: "/pelatihan",
        component: HomeEvent,
      },
      {
        path: "/loker",
        component: HomeLoker,
      },
      {
        path: "/loker/:id",
        component: DetailLoker,
      },
      {
        path: "/apply/:id/:name",
        component: Apply,
      },
    ],
  },

  {
    path: "/login",
    name: "Login",
    component: Login,
  },

  {
    path: "/register",
    name: "Register",
    component: Register,
  },

  {
    path: "/admin",
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
        path: "/admin/pelatihan",
        component: Pelatihan,
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
        path: "/admin/lokerView",
        name: "ViewApply",
        component: ViewApply,
        props: true,
      },
      {
        path: "/admin/loker/status",
        component: Status,
      },
      {
        path: "/admin/loker/kuis",
        component: Kuis,
      },
      {
        path: "/admin/testimoni",
        component: Testimoni,
      },
      {
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
