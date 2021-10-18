<template>
  <div class="lokerJumbotron">
    <b-jumbotron>
      <!-- <div id="moon"></div> -->
      <div id="moontoon"></div>
      <b-row class="justify-content-center align-items-center h-100">
        <b-col md="8" sm="12">
          <div id="header">
            <h1>Lowongan Pekerjaan</h1>
          </div>

          <div id="subheader">
            <p>
              Cari lowongan pekerjaan dengan berbagai jenis bidang sesuai dengan
              dirimu dengan mudah di platform Jaringan PAZ Al Kasaw,
            </p>
          </div>
        </b-col>
      </b-row>
      <b-row class="justify-content-center">
        <b-col md="8">
          <b-input-group class="mt-3 search-box">
            <template #append>
              <b-input-group-text
                ><div
                  class="icon-box d-flex align-items-center justify-content-center"
                >
                  <i class="fas fa-search"></i></div
              ></b-input-group-text>
            </template>
            <b-form-input
              class="search"
              placeholder="Cari Lowongan Pekerjaan"
            ></b-form-input>
          </b-input-group>
        </b-col>
      </b-row>
    </b-jumbotron>
  </div>
</template>

<script>
export default {
  data() {
    return {};
  },
};
</script>

<style lang="scss" scoped>
@import "@/assets/main.scss";
#moon {
  font-size: 20em;
  display: inline-block;
  width: 0.4em;
  box-sizing: content-box;
  height: 0.4em;
  border: 0.3em solid #fff;
  position: absolute;
  top: -138px;
  right: -138px;
  opacity: 0.1;
  border-radius: 50%;
}

#moontoon {
  font-size: 20em;
  display: inline-block;
  width: 0.4em;
  box-sizing: content-box;
  height: 0.4em;
  border: 0.3em solid #fff;
  position: absolute;
  top: 142px;
  left: -149px;
  opacity: 0.1;
  border-radius: 50%;
}

.input-group-append .input-group-text {
  background-color: #fff;
  border-left: none;
}

.icon-box {
  width: 48px;
  height: 48px;
  background-color: $paz-secondary;
  border-radius: 4px;
  i {
    font-size: 24px;
    color: #fff;
  }
}

.search-box {
  height: 72px;
  box-shadow: 0px 16px 24px rgba(0, 0, 0, 0.06), 0px 2px 6px rgba(0, 0, 0, 0.04),
    0px 0px 1px rgba(0, 0, 0, 0.04);
  border-radius: 8px;

  .search {
    height: 72px;
    border-right: none;
    font-style: normal;
    font-weight: normal;
    font-size: 20px;
    padding: 20px;
    line-height: 140%;
    letter-spacing: 0.01em;
    color: #757682;
  }
}

.jumbotron {
  // background-color: #07a148;
  border-radius: 0;
  height: 557px;
  min-height: 528px;
  background: linear-gradient(
    181.98deg,
    #07a148 26.57%,
    rgba(7, 161, 72, 0) 283.01%
  );
}

h1 {
  font-weight: 700;
  font-size: 60px;
  font-style: normal;
  line-height: 73px;
  color: #fff;
  text-transform: uppercase;
}

p {
  font-weight: 400;
  font-style: normal;
  font-size: 20px;
  color: #fff;
}

span {
  font-weight: 600;
  font-style: normal;
  font-size: 16px;
  line-height: 19.36px;
  letter-spacing: 1px;
  color: #fff;
}

.btn:hover {
  background-color: #07a148;
}

section {
  margin-top: -50vh;
}
</style>
