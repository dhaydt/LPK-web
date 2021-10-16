<template>
  <section class="blog">
    <b-container>
      <b-row class="justify-content-center">
        <b-col md="7">
          <div class="head">
            <span>TESTIMONI</span>
          </div>
          <h2 class="mt-4">
            Apa yang para mereka katakan tentang program pelatihan PAZ
          </h2>
          <b-button variant="outline-success seemore" href="#" class="mt-4 px-4"
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
  </section>
</template>

<script>
import TestimoniCard from './testimoniCard'
export default {
  components: {
    TestimoniCard,
  },
};
</script>

<style lang="scss" scoped>
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
</style>
