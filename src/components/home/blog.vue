<template>
  <section class="blog" id="blog">
    <b-container>
      <div id="moontoon"></div>
      <b-row class="justify-content-center">
        <b-col md="7">
          <div class="head">
            <span>berita terkini</span>
          </div>
          <h2 class="mt-5 card-sub">
            Dapatkan informasi tentang kegiatan yang telah kami selenggarakan
            disini
          </h2>
          <b-button
            variant="outline-success seemore"
            to="/liputan"
            class="mt-4 px-4"
            ><span
              ><img src="/assets/images/blogs.png" alt="info" height="25" />
              Lihat semua</span
            ></b-button
          >
        </b-col>
      </b-row>
      <b-row class="mt-4 w-100 justify-content-center liputan-card-row">
        <LiputanCard></LiputanCard>
      </b-row>
    </b-container>
    <div id="shape">
      <div id="moons"></div>
    </div>
  </section>
</template>

<script>
import LiputanCard from "../about/liputanCard";
export default {
  components: { LiputanCard },
  data() {
    return {};
  },
};
</script>

<style lang="scss" scoped>
@import "@/assets/main.scss";
@media (max-width: 575.98px) {
  .row.liputan-card-row {
    max-height: 1500px !important;
    height: 1500px !important;
    overflow: auto;
  }
  .col-md-7 {
    h2.card-sub {
      font-size: 30px;
      font-weight: 700;
      line-height: 43px;
    }
  }
}
#shape {
  position: absolute;
  right: 0px;
  top: 3524px;
  overflow: hidden;
  width: 130px;
}

#moons {
  font-size: 20em;
  display: inline-block;
  width: 0.3em;
  box-sizing: content-box;
  height: 0.3em;
  border: 0.2em solid #07a148;
  opacity: 0.1;
  border-radius: 50%;
}

#moontoon {
  font-size: 20em;
  display: inline-block;
  width: 0.4em;
  box-sizing: content-box;
  height: 0.4em;
  border: 0.2em solid #07a148;
  position: absolute;
  top: 3239px;
  left: -90px;
  opacity: 0.08;
  border-radius: 50%;
}

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

.btn-outline-success.seemore:hover {
  span {
    color: #fff;
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

.card-title {
  font-style: normal;
  font-weight: 500;
  font-size: 15px;
  margin-left: 10px;
  // line-height: 160%;
  /* or 26px */
  text-align: left;
  // letter-spacing: 0.5px;
  color: #2e3e5c;
}

.card-text {
  font-style: normal;
  font-weight: normal;
  font-size: 12px;
  margin-left: 10px;
  text-align: left;
  color: #757682;
}

.liputan-card-row {
  max-height: 434px !important;
}
</style>
