import Vue from "vue";
import VueRouter from "vue-router";

// Home section
import Home from "../views/index.vue";
import HomeAbout from "../views/about/index.vue";
import HomeLiputan from "../views/liputan/index.vue";
import HomeLiputanDetail from "../views/liputan/detail/index.vue";
import HomeInstruktur from "../views/instruktur/index.vue";
import HomeEvent from "../views/event/index.vue";
import HomeLoker from "../views/loker/index.vue";
import DetailLoker from "../views/loker/detailLoker.vue";
import Apply from "../views/loker/applyLoker.vue";
import HomeGaleri from "../views/galeri/index.vue";
import HomeGaleriDetail from "../views/galeri/galeriDetail/index.vue";

// Admin panel
import Login from "../views/auth/login.vue";
import Unauthorized from "../views/auth/unauth.vue";
import Dashboard from "../views/admin/index.vue";
import About from "../views/admin/about";
import Legal from "../views/admin/about/legalitas.vue";
import Struktur from "../views/admin/about/struktur.vue";
import Liputan from "../views/admin/about/liputan.vue";
import Cabang from "../views/admin/about/cabang.vue";
import Instruktur from "../views/admin/instruktur";
import Kurikulum from "../views/admin/instruktur/kurikulum";
import Pelatihan from "../views/admin/pelatihan";
import PelatihanTime from "../views/admin/pelatihan/timeline/index.vue";
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
        path: "/tentang",
        component: HomeAbout,
      },
      {
        path: "/liputan",
        component: HomeLiputan,
      },
      {
        path: "/liputan/:id",
        component: HomeLiputanDetail,
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
        path: "/galeri_detail/:tipe/:id",
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
    path: "/unauthorized",
    name: "Unauthorized",
    component: Unauthorized,
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
        path: "/admin/instruktur/kurikulum",
        component: Kurikulum,
      },
      {
        path: "/admin/pelatihan",
        component: Pelatihan,
      },
      {
        path: "/admin/pelatihan/timeline",
        component: PelatihanTime,
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
  let user = JSON.parse(localStorage.getItem("auth"));

  if (
    (to.fullPath == "/admin") |
    (to.fullPath == "/admin/") |
    (to.fullPath == "/admin/about") |
    (to.fullPath == "/admin/about/") |
    (to.fullPath == "/admin/about/legalitas") |
    (to.fullPath == "/admin/about/legalitas/") |
    (to.fullPath == "/admin/about/struktur") |
    (to.fullPath == "/admin/about/struktur/") |
    (to.fullPath == "/admin/about/cabang") |
    (to.fullPath == "/admin/about/cabang/") |
    (to.fullPath == "/admin/instruktur") |
    (to.fullPath == "/admin/instruktur/") |
    (to.fullPath == "/admin/instruktur/kurikulum") |
    (to.fullPath == "/admin/instruktur/kurikulum/") |
    (to.fullPath == "/admin/pelatihan") |
    (to.fullPath == "/admin/pelatihan/") |
    (to.fullPath == "/admin/pelatihan/timeline") |
    (to.fullPath == "/admin/pelatihan/timeline/") |
    (to.fullPath == "/admin/images") |
    (to.fullPath == "/admin/images/") |
    (to.fullPath == "/admin/testimoni") |
    (to.fullPath == "/admin/testimoni/") |
    (to.fullPath == "/admin/setting") |
    (to.fullPath == "/admin/setting/")
  ) {
    // console.log("path admin");
    if (user == null) {
      next({
        path: "/login",
        params: { nextUrl: to.fullPath },
      });
    } else if (user.user.role == "admin") {
      // console.log("/admin not match");
      next();
    } else {
      // console.log("/admin match");
      next({
        path: "/unauthorized",
        params: { nextUrl: to.fullPath },
      });
    }
  } else if (
    (to.fullPath === "/admin/about/liputan") |
    (to.fullPath === "/admin/about/liputan/")
  ) {
    if (user == null) {
      next({
        path: "/login",
        params: { nextUrl: to.fullPath },
      });
    } else if ((user.user.role === "staff") | (user.user.role === "admin")) {
      // console.log("match");
      next();
    } else {
      // console.log("next");

      next({
        path: "/unauthorized",
        params: { nextUrl: to.fullPath },
      });
    }
  } else if (
    (to.fullPath === "/admin/loker") |
    (to.fullPath === "/admin/loker/") |
    (to.fullPath === "/admin/lokerView") |
    (to.fullPath === "/admin/lokerView/") |
    (to.fullPath === "/admin/loker/status") |
    (to.fullPath === "/admin/loker/status/") |
    (to.fullPath === "/admin/loker/kuis") |
    (to.fullPath === "/admin/loker/kuis/")
  ) {
    if (user == null) {
      next({
        path: "/login",
        params: { nextUrl: to.fullPath },
      });
    } else if ((user.user.role === "hrd") | (user.user.role === "admin")) {
      // console.log("match");
      next();
    } else {
      // console.log("next");

      next({
        path: "/unauthorized",
        params: { nextUrl: to.fullPath },
      });
    }
  } else if (to.matched.some((record) => record.meta.guest)) {
    if (localStorage.getItem("auth") == null) {
      next();
    } else {
      next({ name: "userboard" });
    }
  } else {
    // console.log("last next");
    next();
  }
});

export default router;
