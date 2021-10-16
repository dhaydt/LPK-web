<template>
  <section class="mb-4 gallery">
    <b-container>
      <b-row class="justify-content-center">
        <b-col lg="9">
          <b-card sub-title="Card subtitle" no-body>
            <template #header>
              <div class="head">
                <span>Galeri Foto</span>
              </div>
            </template>
            <div id="moon"></div>
            <b-card-body>
              <b-card-title>GALERI FOTO PAZ</b-card-title>
              <b-card-text class="mt-4">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit ut
                aliquam, purus sit amet luctus venenatis, lectus magna fringilla
                urna
              </b-card-text>
              <b-button
                variant="outline-success seemore"
                href="#"
                class="mt-4 px-4"
                ><span
                  ><img
                    src="../../assets/images/pict.svg"
                    alt="info"
                    height="25"
                  />
                  Lihat semua foto</span
                ></b-button
              >
            </b-card-body>
          </b-card>
        </b-col>
      </b-row>
    </b-container>
    <div id="shape">
      <div id="moons"></div>
    </div>
    <b-row class="justify-content-center w-100">
      <b-col md="10">
        <div class="card-body border-top text-center">
          <b-row>
            <b-col md="3" v-for="img in images" :key="img"
              ><b-img-lazy :src="img" alt="gallery"></b-img-lazy
            ></b-col>
          </b-row>
        </div>
      </b-col>
    </b-row>
  </section>
</template>

<script>
export default {
  data() {
    return {
      images: [
        require("../../assets/images/potrait3.png"),
        require("../../assets/images/potrait4.png"),
        require("../../assets/images/potrait5.png"),
        require("../../assets/images/potrait6.png"),
      ],
    };
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
  background-color: #fd7d24;
  border: 0.3em solid #fd7d24;
  position: absolute;
  left: -264px;
  opacity: 0.1;
  top: 300px;
}

#shape {
  position: absolute;
  right: 0;
  top: 1700px;
  width: 60px;
  overflow: hidden;
}

#moons {
  font-size: 20em;
  display: inline-block;
  width: 0.2em;
  box-sizing: content-box;
  height: 0.2em;
  border: 0.1em solid #fd7d24;
  background-color: #fd7d24;
  opacity: 0.1;
}
section {
  margin-top: 100px;
}

.card {
  border: none;
  box-shadow: none;
}

.card-header {
  background-color: transparent;
}

.card-title {
  font-size: 32px;
  font-style: normal;
  font-weight: 600;
  line-height: 45px;
  letter-spacing: 0.5px;
  text-align: center;
  color: #2e3e5c;
}

.card-text {
  font-size: 24px;
  font-style: normal;
  font-weight: 400;
  line-height: 38px;
  letter-spacing: 0px;
  text-align: center;
  color: #686870;
}

em {
  font-size: 20px;
}

.head {
  span {
    font-weight: 600;
    font-size: 16px;
    font-style: normal;
    line-height: 26px;
    letter-spacing: 0.2em;
    text-transform: uppercase;
    color: #07a148;
    padding-bottom: 5px;
    border-bottom: 2px solid #07a148;
  }
}

.seemore span {
  font-size: 16px;
  font-style: normal;
  font-weight: 600;
  line-height: 19px;
  letter-spacing: 0.04em;
  text-align: left;
  color: #07a148;
  text-transform: capitalize;
}
</style>
