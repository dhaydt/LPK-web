<template>
  <section class="alumni" id="alumni">
    <div id="moon"></div>
    <b-container>
      <b-row class="justify-content-center">
        <b-col md="7">
          <div class="head">
            <span>Alumni Pelatihan PAZ</span>
          </div>
          <h2 class="mt-5 card-sub">
            Mari bergabung dengan kami dan menjadi partner Pengobatan Akhir
            Zaman
          </h2>
        </b-col>
      </b-row>
      <b-row cols-md="4" cols-sm="2" class="row-al d-none d-md-flex">
        <b-col sm="5" class="col-al" v-for="(lok, i) in lokers" :key="i">
          <b-card class="inner-border h-100">
            <b-avatar :src="lok.img" class="card-img-top" size="96"></b-avatar>
            <b-card-title>{{ lok.name }} </b-card-title>
            <b-card-text>{{ lok.address }} </b-card-text>
          </b-card>
        </b-col>
      </b-row>
      <b-row no-gutters class="d-flex d-md-none mt-4" style="overflow: hidden;">
        <div class="wrapper">
          <Flicking
            ref="flicking"
            :options="{
              align: 'prev',
              defaultIndex: 0,
              circular: true,
              duration: 1100,
            }"
          >
            <div class="item" v-for="(lok, i) in lokers" :key="i">
              <b-card class="inner-border h-100">
                <b-avatar
                  :src="lok.img"
                  class="card-img-top"
                  size="96"
                ></b-avatar>
                <b-card-title>{{ lok.name }} </b-card-title>
                <b-card-text>{{ lok.address }} </b-card-text>
              </b-card>
            </div>
          </Flicking>
        </div>
      </b-row>
    </b-container>
    <div id="shape">
      <div id="moons"></div>
    </div>
  </section>
</template>

<script>
export default {
  data() {
    return {
      lokers: [
        {
          name: "Ahmad Kaimmudin",
          img: "/assets/images/alum.png",
          address: "Pontianak",
        },
        {
          name: "Susanto",
          img: "/assets/images/alum1.png",
          address: "Pontianak",
        },
        {
          name: "Fikri Muhammad",
          img: "/assets/images/alum2.png",
          address: "Ngawi",
        },
        {
          name: "Abdul Malik",
          img: "/assets/images/alum3.png",
          address: "Ngawi",
        },
      ],
    };
  },
};
</script>

<style lang="scss" scoped>
@media (max-width: 575.98px) {
  .col-md-7 {
    h2.card-sub {
      font-size: 30px;
      margin-top: 40px !important;
      font-weight: 700;
      line-height: 43px;
    }
  }
}
.item {
  margin-right: 20px;
  .card {
    height: 261px;
    width: 250px;
  }
}
#moon {
  font-size: 20em;
  display: inline-block;
  width: 0.4em;
  box-sizing: content-box;
  height: 0.4em;
  background-color: #fd7d24;
  border: 0.3em solid #fd7d24;
  position: absolute;
  left: -64px;
  opacity: 0.1;
  top: 160px;
}

#shape {
  position: absolute;
  right: 0;
  bottom: -50px;
  width: 300px;
  z-index: 0;
  overflow: hidden;
}

#moons {
  font-size: 30em;
  display: inline-block;
  width: 2em;
  box-sizing: content-box;
  height: 0.2em;
  border: 0.1em solid #fd7d24;
  background-color: #fd7d24;
  opacity: 0.1;
}
section {
  margin-top: 110px;
  position: relative;
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

h2 {
  font-style: normal;
  font-weight: 600;
  line-height: 140%;
  /* or 48px */
  color: #2e3e5c;
  text-transform: capitalize;
  text-align: center;
  letter-spacing: 0.5px;
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

.card {
  background: #ffffff;
  /* Neutral / 05 */
  z-index: 1;

  border: 1px solid #e8eaed;
  box-sizing: border-box;
  box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.04), 0px 2px 6px rgba(0, 0, 0, 0.04),
    0px 0px 1px rgba(0, 0, 0, 0.04);
  border-radius: 8px;
}

.card-title {
  font-style: normal;
  font-weight: bold;
  font-size: 20px;
  margin-top: 20px;
  line-height: 28px;
  text-align: center;
  color: #121527;
}

.card-text {
  font-style: normal;
  font-weight: normal;
  font-size: 16px;
  margin-top: 12px;
  /* identical to box height, or 150% */

  text-align: center;

  /* Black/2 */

  color: #757682;
}

.inner-border {
  border-top: 5px solid #07a148;
}
</style>
