<template>
  <div class="container pelatihanOnline">
    <div class="row">
      <b-col class="w-100" style="overflow: hidden;">
        <div class="card-offline w-100">
          <b-row class="navFlick">
            <b-col md="10" sm="8">
              <div class="card-title-event titleFlick">
                Pelatihan online
              </div>
            </b-col>
            <b-col
              sm="3"
              md="2"
              class="d-flex naviFlick justify-content-around align-items-center"
            >
              <b-button variant="success" @click="prevBtn" class="btnNav"
                ><i class="fas fa-chevron-left"></i
              ></b-button>
              <b-button variant="success" @click="nextBtn" class="btnNav"
                ><i class="fas fa-chevron-right"></i
              ></b-button>
            </b-col>
          </b-row>

          <div class="wrapper flicking-wrap container mt-4 pt-3 w-100">
            <Flicking
              ref="flicking"
              :options="{
                align: 'next',
                defaultIndex: 0,
                circular: true,
                duration: 1100,
              }"
            >
              <div
                class="cont item mr-5"
                v-for="(slide, i) in training"
                :key="i"
              >
                <b-card no-body style="width: 20rem;" class="mb-2">
                  <a :href="slide.url" target="_blank">
                    <b-card-img
                      class="img-top"
                      :alt="slide.title"
                      :src="imgUrl + slide.img"
                      height="250"
                    ></b-card-img>
                  </a>
                  <div class="card-body">
                    <a :href="slide.url" target="_blank">
                      <b-card-title>{{ slide.title }} </b-card-title>
                    </a>
                    <b-card-text>
                      {{ slide.subtitle }}
                    </b-card-text>
                    <b-row>
                      <b-col>
                        <div class="calender text-left">
                          <i class="far fa-calendar"></i>
                          <span>{{ slide.akses }}</span>
                        </div>
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col>
                        <div class="time text-left">
                          <i class="far fa-clock"></i>
                          <span>{{ slide.expire }}</span>
                        </div>
                      </b-col>
                    </b-row>
                  </div>
                </b-card>
              </div>
            </Flicking>
          </div>
        </div>
      </b-col>
    </div>
  </div>
</template>

<script>
import "@egjs/vue-flicking/dist/flicking.css";
import { FlickingError, ERROR_CODE } from "@egjs/flicking";

export default {
  data() {
    return {
      training: [],
      onUrl: "",
      imgUrl: "",
    };
  },

  created() {
    const pelOnData = localStorage.getItem("pelOnline");
    this.training = JSON.parse(pelOnData);
    const mainUrl = localStorage.getItem("apiUrl");
    this.imgUrl = mainUrl + "/images/pelatihan/";
  },
  methods: {
    async nextBtn() {
      try {
        await this.$refs.flicking.next();
      } catch (err) {
        if (err instanceof FlickingError) {
          if (err.code === ERROR_CODE.ANIMATION_ALREADY_PLAYING) {
            console.log("Animation is already playing!");
          } else if (err.code === ERROR_CODE.ANIMATION_INTERRUPTED) {
            console.log("Animation is interrupted by user.");
          }
        }
      }
      // console.log("flick", this.$refs.flicking);
    },
    async prevBtn() {
      try {
        await this.$refs.flicking.prev();
      } catch (err) {
        if (err instanceof FlickingError) {
          if (err.code === ERROR_CODE.ANIMATION_ALREADY_PLAYING) {
            console.log("Animation is already playing!");
          } else if (err.code === ERROR_CODE.ANIMATION_INTERRUPTED) {
            console.log("Animation is interrupted by user.");
          }
        }
      }
    },
  },
};
</script>
<style lang="scss" scoped>
@import "@/assets/main.scss";

@media (max-width: 575.98px) {
  .card-title-event.titleFlick {
    font-size: 30px;
  }

  .naviFlick {
    display: none !important;
  }
  .flicking-wrap {
    p.card-text {
      margin-bottom: 0;
    }
  }
}

.container-fluid {
  margin-right: 0px;
  padding-left: 8vw;
  // width: 80%;
}

.naviFlick {
  .btnNav {
    border-radius: 50%;
    background-color: $paz-main;
    color: #fff;
  }

  .btnNav:hover {
    background-color: $paz-secondary;
    border: 1px solid $paz-secondary;
  }
}

.card {
  box-shadow: 0px 21.6792px 32.5188px rgba(0, 0, 0, 0.06),
    0px 2.7099px 8.12969px rgba(0, 0, 0, 0.04),
    0px 0px 1.35495px rgba(0, 0, 0, 0.04);
  border-radius: 4px;
  width: 396px;
  max-width: 20rem;
}

.card-title-event {
  font-style: normal;
  font-weight: bold;
  font-size: 40px;
  text-transform: capitalize;
  line-height: 140%;
  text-align: left;
  color: $paz-main;
}

.card-title {
  font-size: 1.1rem;
  font-style: normal;
  font-weight: 600;
  line-height: 28px;
  text-transform: capitalize;
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
  text-transform: capitalize;
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
</style>
