<template>
  <div class="pelatihanJumbotron">
    <b-jumbotron>
      <!-- <div id="moon"></div> -->
      <div id="moontoon"></div>
      <b-row class="justify-content-center h-100">
        <b-col md="8" sm="12">
          <div id="header">
            <h1>Pelatihan</h1>
          </div>

          <div id="subheader">
            <p>
              Ikuti pelatihan dan pembelajaran baik secara online maupun offline
              untuk mendapatkan ilmu terbaru dari trainer yang berpengalaman
            </p>
          </div>
        </b-col>
      </b-row>
    </b-jumbotron>
    <section class="eventCard">
      <PelatihanOffline></PelatihanOffline>
    </section>
    <section class="eventOnline">
      <PelatihanOnline></PelatihanOnline>
    </section>
  </div>
</template>

<script>
import PelatihanOnline from "./pelatihanOnline ";
import PelatihanOffline from "./pelatihanOffline";
export default {
  components: {
    PelatihanOnline,
    PelatihanOffline,
  },
  data() {
    return {};
  },
};
</script>

<style lang="scss" scoped>
@media (max-width: 575.98px) {
  .jumbotron {
    height: 430px !important;
    min-height: 430px !important;
    #header {
      h1 {
        margin-top: 40px !important;
      }
    }
  }

  .eventOnline {
    margin-top: 50px !important;
  }
}
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

.jumbotron {
  // background-color: #07a148;
  border-radius: 0;
  height: 957px;
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
  margin-top: 190px;
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

section.eventCard {
  margin-top: -481px;
}

.eventOnline {
  margin-top: 100px;
}
</style>
