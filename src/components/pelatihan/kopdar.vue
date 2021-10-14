<template>
  <section class="mb-4 cabang">
    <b-container>
      <b-row class="justify-content-center">
        <b-col lg="9">
          <b-card sub-title="Card subtitle" no-body>
            <template #header>
              <div class="head">
                <span>KOPDAR ALUMNI</span>
              </div>
            </template>
            <div id="moon"></div>
            <b-card-body>
              <b-card-title>Kopi Darat Alumni Pelatihan PAZ</b-card-title>
            </b-card-body>
          </b-card>
        </b-col>
      </b-row>
    </b-container>
    <div id="shape">
      <div id="moons"></div>
    </div>
    <b-row class="justify-content-center w-100 m-0">
      <b-col md="12">
        <div class="card-body border-top text-center">
          <b-row>
            <b-col v-for="(cab, i) in cabang" :key="i">
              <b-card>
                <b-overlay
                  variant="dark"
                  opacity="0.7"
                  :show="overlay"
                  rounded="bottom"
                >
                  <b-img-lazy class="w-100" :src="cab.img"></b-img-lazy>
                  <template #overlay>
                    <div class="card-title text-left w-100">
                      <h3 class="mb-0">{{ cab.title }}</h3>
                      <b-row
                        ><b-col md="1" class="d-flex align-items-center"
                          ><i
                            class="fas fa-map-marker-alt text-white"
                            style="font-size: 18px;"
                          ></i
                        ></b-col>
                        <b-col md="11">
                          <b-card-text class="mb-0">
                            {{ cab.address }}
                          </b-card-text>
                        </b-col></b-row
                      >
                      <b-row class="mt-2">
                        <b-col md="1" class="d-flex align-items-center"
                          ><i
                            class="fas fa-phone-alt text-white"
                            style="font-size: 18px;"
                          ></i
                        ></b-col>
                        <b-col md="11" class="d-flex align-items-center"
                          ><span>{{ cab.contact }}</span></b-col
                        >
                      </b-row>
                    </div>
                  </template>
                </b-overlay>
              </b-card>
            </b-col>
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
      overlay: true,
      cabang: [
        {
          title: "Ayub camp",
          img: require("../../assets/images/cabang.png"),
          address:
            "Gang H Wignyo Sudarto, Sidorejo RT 1 RW 14, Belang Wetan, Klaten, Jawa Tengah",
          contact: "+62 858-2177-0740",
        },
        {
          title: "Ayub camp",
          img: require("../../assets/images/cabang.png"),
          address:
            "Gang H Wignyo Sudarto, Sidorejo RT 1 RW 14, Belang Wetan, Klaten, Jawa Tengah",
          contact: "+62 858-2177-0740",
        },
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

.head span {
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

.card {
  border: none;
  box-shadow: none;
}

.card-header {
  background-color: transparent;
}

.card-title {
  font-style: normal;
  font-weight: 600;
  font-size: 32px;
  line-height: 140%;
  text-align: center;
  letter-spacing: 0.5px;
  color: #2e3e5c;
}

.card-title h3 {
  font-style: normal;
  font-weight: 800;
  font-size: 20px;
  text-transform: uppercase;
  line-height: 160%;
  /* or 38px */
  letter-spacing: 0.01em;
  color: #ffffff;
  text-align: left;
}

.card-text {
  font-style: normal;
  font-weight: normal;
  font-size: 14px;
  line-height: 19px;
  text-align: left;
  /* White */
  color: #ffffff;
}

span {
  font-style: normal;
  font-weight: normal;
  font-size: 14px;
  line-height: 19px;
  letter-spacing: 0.01em;
  text-align: left;
  /* White */
  color: #ffffff;
}
</style>

<style lang="scss">
.card-body .b-overlay-wrap div.b-overlay {
  height: 40%;
  top: 60% !important;
}

.b-overlay .position-absolute {
  width: 100%;
  padding: 20px;
  z-index: 10 !important;
}
</style>
