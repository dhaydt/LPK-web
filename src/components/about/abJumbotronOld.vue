<template>
  <div class="abJumbotron">
    <b-jumbotron>
      <!-- <div id="moon"></div> -->
      <div id="moontoon"></div>
      <b-row class="h-100 align-items-center">
        <b-col>
          <div id="header">
            <h1>Tentang kami</h1>
          </div>

          <div id="subtitle">
            <h4>
              PAZ Generasi Unggul lembaga yang mengelola dan meneruskan
              pengajaran temuan Hak Cipta Intelektual dari Ustadz Haris
              Moedjahid Rahimahullah berupa Ilmu Pengobatan dan Konsep hidup Ala
              PAZ Al Kasaw.
            </h4>
          </div>
        </b-col>
        <b-col>
          <div class="about-img">
            <div class="rectangle"></div>
            <b-img
              :src="require('../../assets/images/aboutus.png')"
              height="450"
            >
            </b-img>
          </div>
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
  height: 828px;
  min-height: 528px;
  background: linear-gradient(
    181.98deg,
    #07a148 26.57%,
    rgba(7, 161, 72, 0) 283.01%
  );
}

h1 {
  font-style: normal;
  font-weight: bold;
  font-size: 60px;
  line-height: 73px;
  text-transform: uppercase;

  /* identical to box height */
  text-align: left;
  text-transform: uppercase;
  color: #ffffff;
}

h4 {
  font-style: normal;
  font-weight: normal;
  font-size: 20px;
  text-align: left;
  line-height: 160%;
  /* or 32px */
  color: #ffffff;
}

.about-img img{
    z-index: 1;
    position: relative;
}
.rectangle {
  top: -40px;
  right: 0;
  height: 450px;
  width: 307px;
  position: absolute;
  background-color: #fff;
  z-index: 0;
}
</style>
