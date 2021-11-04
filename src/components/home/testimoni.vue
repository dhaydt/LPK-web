<template>
  <section class="blog">
    <div id="moontoon"></div>
    <b-container>
      <b-row class="justify-content-center">
        <b-col md="7">
          <div class="head">
            <span>TESTIMONI</span>
          </div>
          <h2 class="mt-4 card-sub">
            Apa yang para mereka katakan tentang program pelatihan PAZ
          </h2>
          <b-button
            variant="outline-success seemore"
            href="javascript:void(0)"
            class="mt-4 px-4"
            ><span
              ><img
                src="../../assets/images/testi.svg"
                alt="info"
                height="25"
              />
              Lihat semua testimoni</span
            ></b-button
          >
        </b-col>
      </b-row>
      <b-row class="mt-4 justify-content-center">
        <b-col md="12">
          <TestimoniCard></TestimoniCard>
        </b-col>
      </b-row>
    </b-container>
    <div id="shape">
      <div id="moons"></div>
    </div>
  </section>
</template>

<script>
import TestimoniCard from "./testimoniCard";
export default {
  components: {
    TestimoniCard,
  },
};
</script>

<style lang="scss" scoped>
@media (max-width: 575.98px) {
  .col-md-7 {
    h2.card-sub {
      font-size: 30px;
    }
  }
}
.col-md-12 {
  z-index: 1;
}
#shape {
  position: absolute;
  right: 0px;
  top: 200px;
  z-index: 0;
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
  font-size: 35em;
  display: inline-block;
  width: 0.4em;
  box-sizing: content-box;
  height: 0.4em;
  border: 0.2em solid #07a148;
  position: absolute;
  top: 150px;
  left: -90px;
  opacity: 0.08;
  border-radius: 50%;
}

.example {
  height: auto;

  .toolbar {
    display: flex;
    justify-content: space-around;
    width: 100%;
    height: 2rem;
    border-bottom: 1px solid grey;
    margin-bottom: 10px;

    button {
      flex: 1;
      padding: 0;
      margin: 0;
      border: none;
      border-right: 1px solid grey;
      background-color: #fff;
      cursor: pointer;
      &:last-child {
        border: none;
      }

      &:hover {
        background-color: #999;
      }
    }
  }
}

.swiper-container {
  // overflow: visible;
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
  color: #2e3e5c;
  text-transform: capitalize;
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
</style>
