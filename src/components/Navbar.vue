<template>
  <div class="navbarHome">
    <b-navbar toggleable="lg" type="dark" variant="success">
    <b-navbar-brand to="/">PAZ</b-navbar-brand>

    <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

    <b-collapse id="nav-collapse" is-nav>
      <b-navbar-nav>
        <b-nav-item to="#">Home</b-nav-item>
        <b-nav-item to="#">About Us</b-nav-item>
        <b-nav-item to="#">Instruktur</b-nav-item>
        <b-nav-item to="#">Event</b-nav-item>
        <b-nav-item to="#">Lowongan Kerja</b-nav-item>
      </b-navbar-nav>

      <!-- Right aligned nav items -->
      <b-navbar-nav class="ml-auto">
          <!-- Using 'button-content' slot -->
          <b-nav-item to="/login"><b-button size="sm" class="my-2 my-sm-0">Login</b-button></b-nav-item>
      </b-navbar-nav>
    </b-collapse>
  </b-navbar>
  </div>
</template>

<script>
  export default {
    
  }
</script>

<style lang="scss" scoped>

</style>