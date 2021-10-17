<template>
  <div class="navbarHome w-100">
    <b-navbar toggleable="lg" type="dark" class="navfront">
      <b-collapse id="nav-collapse" is-nav>
        <b-navbar-nav>
          <b-nav-item to="/">Home</b-nav-item>
          <b-nav-item to="/aboutus">About Us</b-nav-item>
          <b-nav-item to="/instruktur">Instruktur</b-nav-item>
          <b-nav-item to="/pelatihan">Pelatihan</b-nav-item>
          <b-nav-item to="/loker">Lowongan Kerja</b-nav-item>
        </b-navbar-nav>

        <!-- Right aligned nav items -->
      </b-collapse>

      <b-navbar-brand to="/" class="logoPaz"
        ><img src="../assets/images/logo.png" alt="PAZ" height="50"
      /></b-navbar-brand>

      <b-navbar-nav class="ml-auto">
        <b-nav-item href="/login" class="login-btn px-2 mr-2">Login</b-nav-item>
      </b-navbar-nav>
      <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>
    </b-navbar>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      onUrl: "",
      offUrl: "",
      testiUrl: "",
    };
  },

  created() {
    window.addEventListener("scroll", function() {
      var navi = this.document.querySelector(".navfront");
      navi.classList.toggle("sticky", window.scrollY > 0);
    });

    const mainUrl = localStorage.getItem("apiUrl");
    this.testiUrl = mainUrl + "/testi";
    this.getTesti();
    this.onUrl = mainUrl + "/pelatihanOnline";
    this.getOn();
    this.offUrl = mainUrl + "/pelatihanOffline";
    this.getOff();
  },

  methods: {
    async getTesti() {
      const resp = await axios.get(this.testiUrl);
      const data = JSON.stringify(resp.data.data);
      localStorage.setItem("testi", data);
    },
    async getOn() {
      const resp = await axios.get(this.onUrl);
      const data = JSON.stringify(resp.data.data);
      localStorage.setItem("pelOnline", data);
    },

    async getOff() {
      const resp = await axios.get(this.offUrl);
      const data = JSON.stringify(resp.data.data);
      localStorage.setItem("pelOffline", data);
    },
  },
};
</script>

<style lang="scss">
@import "@/assets/main.scss";
.navbar.navbar-dark {
  padding: 10px 80px;
  padding-top: 60px;
  width: 100%;
  background-color: transparent;
  position: fixed;
  transition: 1.4s;
  z-index: 999;
}

nav.navbar.sticky {
  padding: 15px 110px;
  z-index: 9;
  width: 100%;
  background-color: $paz-main;
}

.logoPaz {
  position: absolute;
  left: 46%;
  transition: 0.6s;
}

.nav-link.router-link-exact-active.router-link-active {
  color: #fff !important;
}

.navbar-nav .nav-item.login-btn {
  border-radius: 4px;
  background-color: #fff;
  transition: 0.3s;
  a.nav-link {
    color: #07a148;
    font-size: 16px;
  }
}

.login-btn:hover {
  background-color: #07a148;
  z-index: 99;
}

.navbar-nav .nav-item a.nav-link {
  font-style: normal;
  font-weight: bold;
  font-size: 16px;
  line-height: 19px;
  letter-spacing: 0.04em;
  color: rgba(255, 255, 255, 0.75);
}

.navbar-nav .nav-item a.nav-link:hover {
  color: #fd7d24;
}

// X-Small devices (portrait phones, less than 576px)
@media (max-width: 575.98px) {
  nav.navbar.navbar-dark {
    padding: 8px 10px;
  }
}

// Small devices (landscape phones, less than 768px)
@media (max-width: 767.98px) {
  .navbar.navbar-dark {
    padding: 8px 30px;
  }
}

// Medium devices (tablets, less than 992px)
@media (max-width: 991.98px) {
  .logoPaz {
    left: 10%;
  }

  .navbar.navbar-dark {
    padding: 8px 60px;
    background-color: #07a148;
  }
}

// Large devices (desktops, less than 1200px)
@media (max-width: 1199.98px) {
}

// X-Large devices (large desktops, less than 1400px)
@media (max-width: 1399.98px) {
}
</style>
