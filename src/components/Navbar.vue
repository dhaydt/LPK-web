<template>
  <div class="navbarHome">
    <b-navbar toggleable="lg" type="dark">
      <b-collapse id="nav-collapse" is-nav>
        <b-navbar-nav>
          <b-nav-item to="#">Home</b-nav-item>
          <b-nav-item to="#">About Us</b-nav-item>
          <b-nav-item to="#">Instruktur</b-nav-item>
          <b-nav-item to="#">Event</b-nav-item>
          <b-nav-item to="#">Lowongan Kerja</b-nav-item>
        </b-navbar-nav>

        <!-- Right aligned nav items -->
      </b-collapse>

      <b-navbar-brand to="/" class="logoPaz"
        ><img src="../assets/images/logo.png" alt="PAZ" height="35"
      /></b-navbar-brand>

      <b-navbar-nav class="ml-auto">
        <b-nav-item to="/login" class="login-btn px-2">Login</b-nav-item>
      </b-navbar-nav>
      <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>
    </b-navbar>
  </div>
</template>

<script>
export default {
  created() {
    window.addEventListener("scroll", function() {
      var header = this.document.querySelector("nav");
      header.classList.toggle("sticky", window.scrollY > 0);
    });
  },
};
</script>

<style lang="scss">
.navbar.navbar-dark {
  padding: 10px 104px;
  padding-top: 5vh;
  width: 100%;
  background-color: transparent;
  position: fixed;
  transition: 0.6s;
}

nav.navbar.sticky {
  padding: 10px 110px;
  z-index: 9;
  background-color: #07a147ea;
}

.logoPaz {
  position: absolute;
  left: 46%;
  transition: 0.6s;
}

.nav-item.login-btn {
  border-radius: 4px;
  background-color: #fff;
  transition: 0.3s;
  a.nav-link {
    color: #07a148;
  }
}

.login-btn:hover {
  background-color: #07a148;
  z-index: 99;
}

a.nav-link {
  font-weight: 700;
  opacity: 1;
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
  }
}

// Large devices (desktops, less than 1200px)
@media (max-width: 1199.98px) {
}

// X-Large devices (large desktops, less than 1400px)
@media (max-width: 1399.98px) {
}
</style>
