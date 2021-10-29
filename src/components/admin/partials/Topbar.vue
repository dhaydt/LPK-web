<template>
  <header id="page-topbar">
    <div class="navbar-header">
      <div class="d-flex">
        <!-- LOGO -->
        <div class="navbar-brand-box">
          <a href="/" class="logo logo-light">
            <span class="logo-sm">
              <img src="@/assets/images/logo-col-sm.png" alt height="22" />
            </span>
            <span class="logo-lg">
              <img src="@/assets/images/logo.png" alt height="45" />
            </span>
          </a>
        </div>

        <button
          @click="toggleMenu"
          type="button"
          class="btn btn-sm px-3 font-size-24 header-item waves-effect"
          id="vertical-menu-btn"
        >
          <i class="ri-menu-2-line align-middle"></i>
        </button>
      </div>

      <div class="d-flex">
        <div class="dropdown d-none d-lg-inline-block ml-1">
          <button
            type="button"
            class="btn header-item noti-icon waves-effect"
            @click="initFullScreen"
          >
            <i class="ri-fullscreen-line"></i>
          </button>
        </div>
        <b-dropdown
          right
          variant="black"
          toggle-class="header-item"
          class="d-inline-block user-dropdown"
        >
          <template v-slot:button-content>
            <img
              class="rounded-circle header-profile-user"
              src="@/assets/images/user.png"
              alt="Header Avatar"
            />
            <span class="d-none d-xl-inline-block ml-2 mr-2"
              >Welcome, {{ user.nama_depan }}</span
            >
            <!-- <i class="mdi mdi-chevron-down d-none d-xl-inline-block"></i> -->
          </template>
          <!-- item-->
          <router-link class="dropdown-item" to="#">
            <i class="ri-user-line align-middle mr-1"></i>
            Profile
          </router-link>
          <router-link class="dropdown-item d-block" to="#">
            <span class="badge badge-success float-right mt-1">11</span>
            <i class="ri-settings-2-line align-middle mr-1"></i>
            Setting
          </router-link>
          <div class="dropdown-divider"></div>
          <button class="dropdown-item text-danger" @click="logout">
            <i class="ri-shut-down-line align-middle mr-1 text-danger"></i>
            Logout
          </button>
        </b-dropdown>
      </div>
    </div>
  </header>
</template>

<script>
export default {
  data() {
    return {
      user: {},
    };
  },
  created() {
    const auth = JSON.parse(localStorage.getItem("auth"));
    // console.log(user.user)
    this.user = auth.user;
  },
  methods: {
    logout() {
      localStorage.removeItem("auth");
      this.$router.push("/");
    },
    toggleMenu() {
      this.$parent.toggleMenu();
    },
    initFullScreen() {
      document.body.classList.toggle("fullscreen-enable");
      if (
        !document.fullscreenElement &&
        /* alternative standard method */ !document.mozFullScreenElement &&
        !document.webkitFullscreenElement
      ) {
        // current working methods
        if (document.documentElement.requestFullscreen) {
          document.documentElement.requestFullscreen();
        } else if (document.documentElement.mozRequestFullScreen) {
          document.documentElement.mozRequestFullScreen();
        } else if (document.documentElement.webkitRequestFullscreen) {
          document.documentElement.webkitRequestFullscreen(
            Element.ALLOW_KEYBOARD_INPUT
          );
        }
      } else {
        if (document.cancelFullScreen) {
          document.cancelFullScreen();
        } else if (document.mozCancelFullScreen) {
          document.mozCancelFullScreen();
        } else if (document.webkitCancelFullScreen) {
          document.webkitCancelFullScreen();
        }
      }
    },
  },
};
</script>

<style lang="scss" scoped></style>
