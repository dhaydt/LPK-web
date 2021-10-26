<template>
  <section class="blog">
    <b-container>
      <b-row class="justify-content-center">
        <b-col md="7">
          <div class="head">
            <span>Alumni Pelatihan PAZ</span>
          </div>
          <h2 class="mt-5">
            Mari bergabung dengan kami dan menjadi partner Pengobatan Akhir
            Zaman
          </h2>
        </b-col>
      </b-row>
      <b-row cols="4" class="mt-5">
        <b-col v-for="(lok, i) in lokers" :key="i">
          <b-card class="inner-border">
            <b-avatar :src="lok.img" class="card-img-top" size="96"></b-avatar>
            <b-card-title>{{ lok.name }} </b-card-title>
            <b-card-text>{{ lok.address }} </b-card-text>
          </b-card>
        </b-col>
      </b-row>
    </b-container>
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
section {
  margin-top: 110px;
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
