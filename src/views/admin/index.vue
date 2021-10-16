<template>
  <div class="dashboard">
    <div id="preloader">
      <div id="status">
        <div class="spinner">
          <i class="ri-loader-line spin-icon"></i>
        </div>
      </div>
    </div>

    <!-- Begin page -->
    <div id="layout-wrapper">
      <Topbar></Topbar>
      <SideBar :is-condensed="isMenuCondensed" width="fluid" />
      <!-- :width="layoutWidth" -->
      <!-- :type="leftSidebarType" -->
      <!-- ============================================================== -->
      <!-- Start right Content here -->
      <!-- ============================================================== -->
      <div class="main-content">
        <div class="page-content">
          <div class="container-fluid" style="min-height: 80vh">
            <router-view></router-view>
          </div>
        </div>
        <Footer />
      </div>
    </div>
  </div>
</template>

<script>
import router from "@/router"
import SideBar from "../../components/admin/partials/Sidebar";
import Footer from "../../components/admin/partials/Footer";
import Topbar from "../../components/admin/partials/Topbar";
export default {
  data() {
    return {
      isMenuCondensed: false,
    };
  },
  created: () => {
    document.body.removeAttribute("data-layout", "horizontal");
    document.body.removeAttribute("data-topbar", "dark");
    document.body.setAttribute("data-sidebar", "dark");
  },

  components: {
    SideBar,
    Footer,
    Topbar,
  },
  computed: {
    // ...layoutComputed,
  },
  methods: {
    toggleMenu() {
      document.body.classList.toggle("sidebar-enable");

      if (window.screen.width >= 992) {
        // eslint-disable-next-line no-unused-vars
        router.afterEach((routeTo, routeFrom) => {
          document.body.classList.remove("sidebar-enable");
          document.body.classList.remove("vertical-collpsed");
        });
        document.body.classList.toggle("vertical-collpsed");
      } else {
        // eslint-disable-next-line no-unused-vars
        router.afterEach((routeTo, routeFrom) => {
          document.body.classList.remove("sidebar-enable");
        });
        document.body.classList.remove("vertical-collpsed");
      }
      this.isMenuCondensed = !this.isMenuCondensed;
    },
    toggleRightSidebar() {
      document.body.classList.toggle("right-bar-enabled");
    },
    hideRightSidebar() {
      document.body.classList.remove("right-bar-enabled");
    },
  },
  mounted() {
    document.body.classList.remove("auth-body-bg");
    if (this.loader === true) {
      document.getElementById("preloader").style.display = "block";
      document.getElementById("status").style.display = "block";

      setTimeout(function() {
        document.getElementById("preloader").style.display = "none";
        document.getElementById("status").style.display = "none";
      }, 2500);
    } else {
      document.getElementById("preloader").style.display = "none";
      document.getElementById("status").style.display = "none";
    }
  },
};
</script>

<style lang="scss" scoped></style>
