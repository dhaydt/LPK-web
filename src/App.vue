<template>
  <div id="app">
    <router-view />
  </div>
</template>
<script>
export default {
  data() {
    return {
      // apiUrl: "http://localhost:3001",
      apiUrl: "https://api.generasiunggul.com",
    };
  },

  mounted() {
    localStorage.setItem("apiUrl", this.apiUrl);
  },
};
</script>
<style lang="scss">
@import url("https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;900&display=swap");
#app {
  font-family: "Inter", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav {
  padding: 30px;

  a {
    font-weight: bold;
    color: #2c3e50;

    &.router-link-exact-active {
      color: #42b983;
    }
  }
}

body {
  width: 100vw;
  margin: 0;
  overflow-x: hidden;
  padding: 0;
}
</style>
