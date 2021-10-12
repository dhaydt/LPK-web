<template>
  <section class="pelatihan">
    <b-jumbotron>
      <b-container>
        <b-row>
          <b-col>
            <div class="reg">
              <h5>Daftar pelatihan</h5>
            </div>
            <div class="title">
              <h1>Pelatihan yang kami selenggarakan</h1>
            </div>
          </b-col>
          <b-col>
            <div class="ket">
              <span>
                Kami membina para anggota agar masing masing anggota memiliki
                kemampuan untuk memberikan treatment penyembuhan bagi para
                pasien
              </span>
            </div>
          </b-col>
        </b-row>
      </b-container>
    </b-jumbotron>
    <section class="galeri">
      <b-row class="justify-content-end">
        <b-col md="10">
          <swiper class="swiper" :options="swiperOption">
            <swiper-slide v-for="(slide, i) in swiperSlides" :key="i">
              <b-card
                :title="slide.title"
                :img-src="slide.img"
                img-alt="Image"
                img-height="250"
                img-top
                style="width: 20rem;"
                class="mb-2"
              >
                <b-card-text>
                  {{ slide.desc }}
                </b-card-text>
                <b-row>
                  <b-col>
                    <div class="calender text-left">
                      <i class="far fa-calendar"></i>
                      <span>{{ slide.date }}</span>
                    </div>
                  </b-col>
                </b-row>
                <b-row>
                  <b-col>
                    <div class="time text-left">
                      <i class="far fa-clock"></i>
                      <span>{{ slide.time }}</span>
                    </div>
                  </b-col>
                </b-row>
              </b-card>
            </swiper-slide>
            <div class="swiper-pagination" slot="pagination"></div>
            <div class="swiper-button-prev" slot="button-prev"></div>
            <div class="swiper-button-next" slot="button-next"></div>
          </swiper>
        </b-col>
      </b-row>
    </section>
  </section>
</template>

<script>
import { swiper, swiperSlide } from "vue-awesome-swiper";
import "swiper/swiper-bundle.css";
export default {
  data() {
    return {
      swiperOption: {
        slidesPerView: 3,
        centeredSlides: true,
        spaceBetween: 10,
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
      },
      swiperSlides: [
        {
          title: "Pelatihan Online PAZ Al Kasaw Basic Mei 2021",
          img: require("../../assets/images/potrait1.png"),
          desc: "Khusus muslim dan muslimah",
          date: "Waktu Akses Lifetime",
          time: "Kapanpun",
        },
        {
          title: "Pelatihan Online PAZ Al Kasaw Basic Mei 2021",
          img: require("../../assets/images/potrait2.png"),
          desc: "Khusus muslim dan muslimah",
          date: "Waktu Akses Lifetime",
          time: "Kapanpun",
        },
        {
          title: "Pelatihan Online PAZ Al Kasaw Basic Mei 2021",
          img: require("../../assets/images/potrait3.png"),
          desc: "Khusus muslim dan muslimah",
          date: "Waktu Akses Lifetime",
          time: "Kapanpun",
        },
        {
          title: "Pelatihan Online PAZ Al Kasaw Basic Mei 2021",
          img: require("../../assets/images/potrait4.png"),
          desc: "Khusus muslim dan muslimah",
          date: "Waktu Akses Lifetime",
          time: "Kapanpun",
        },
        {
          title: "Pelatihan Online PAZ Al Kasaw Basic Mei 2021",
          img: require("../../assets/images/potrait5.png"),
          desc: "Khusus muslim dan muslimah",
          date: "Waktu Akses Lifetime",
          time: "Kapanpun",
        },
        {
          title: "Pelatihan Online PAZ Al Kasaw Basic Mei 2021",
          img: require("../../assets/images/potrait6.png"),
          desc: "Khusus muslim dan muslimah",
          date: "Waktu Akses Lifetime",
          time: "Kapanpun",
        },
      ],
    };
  },
  methods: {},
  components: {
    swiper,
    swiperSlide,
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

.swiper-button-prev,
.swiper-button-next {
  font-weight: 900;
  color: #fff;
  opacity: 1;
}

.swiper-button-prev:hover,
.swiper-button-next:hover {
  color: #07a148;
}

.card {
  box-shadow: 0px 21.6792px 32.5188px rgba(0, 0, 0, 0.06),
    0px 2.7099px 8.12969px rgba(0, 0, 0, 0.04),
    0px 0px 1.35495px rgba(0, 0, 0, 0.04);
  border-radius: 4px;
}

.card-title {
  font-size: 1.1rem;
  font-style: normal;
  font-weight: 600;
  line-height: 28px;
  letter-spacing: 0.01em;
  text-align: left;
  color: #121527;
}

.card-text {
  font-size: 1rem;
  font-style: normal;
  font-weight: 500;
  line-height: 19px;
  letter-spacing: 0em;
  text-align: left;
  color: #757682;
}

.calender,
.time {
  font-size: 14px;
  font-style: normal;
  margin-top: 20px;
  font-weight: 400;
  line-height: 17px;
  letter-spacing: 0.01em;
  text-align: left;
  color: #757682;
}

.calender i,
.time i {
  font-size: 1.2rem;
  margin-right: 10px;
}

section {
  margin-top: 100px;
}

section.galeri {
  margin-top: -280px;
}

.jumbotron {
  background-color: #04162c;
  height: 591px;
  margin-bottom: 0;
}

.reg h5 {
  font-size: 1.2rem;
  font-style: normal;
  font-weight: 700;
  line-height: 32px;
  letter-spacing: 0.5px;
  text-align: left;
  color: #fd7d24;
  text-transform: uppercase;
}

.title h1 {
  font-size: 2.5rem;
  font-style: normal;
  font-weight: 700;
  line-height: 56px;
  letter-spacing: 0em;
  text-align: left;
  color: #fff;
}

.ket {
  margin-top: 40px;
  text-align: left;
  font-size: 1.2rem;
  font-style: normal;
  font-weight: 400;
  line-height: 32px;
  letter-spacing: 0px;
  color: #fff;
}
</style>
