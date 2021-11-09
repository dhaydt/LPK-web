<template>
  <div class="container">
    <div class="row">
      <b-col>
        <div class="card-offline w-100">
          <b-row class="naviFlick">
            <b-button variant="success" @click="prevBtn" class="btnNav"
              ><i class="fas fa-chevron-left"></i
            ></b-button>
            <b-button variant="success" @click="nextBtn" class="btnNav"
              ><i class="fas fa-chevron-right"></i
            ></b-button>
          </b-row>

          <div
            class="wrapper flicking-wrap container mt-4 pt-3 w-100"
            style="overflow: hidden;"
          >
            <Flicking
              ref="flicking"
              :options="{
                align: 'prev',
                defaultIndex: 0,
                circular: true,
                duration: 1100,
              }"
            >
              <div class="cont item" v-for="(slide, i) in testi" :key="i">
                <b-card class="px-2 pt-0" no-body>
                  <b-card-img-lazy
                    v-if="slide.img"
                    :src="imgUrl + slide.img"
                    height="240"
                    class="img-top"
                  ></b-card-img-lazy>
                  <LazyYoutube
                    ref="vimeoLazyVideo"
                    :src="slide.video"
                    v-if="slide.video"
                    max-width="376px"
                    aspect-ratio="16:11"
                    thumbnail-quality="medium"
                  />
                  <div class="card-body">
                    <b-col sm="9" class="text-left px-0">
                      <h5 class="pb-2">{{ slide.name }}</h5>
                      <span>{{ slide.address }}</span>
                    </b-col>
                    <b-card-text class="pt-4">{{ slide.content }}</b-card-text>
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
      testi: [],
      imgUrl: "",
    };
  },

  created() {
    this.testi = JSON.parse(localStorage.getItem("testi"));
    console.log(this.testi);
    const mainUrl = localStorage.getItem("apiUrl");
    this.imgUrl = mainUrl + "/images/testi/";
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
  .card-offline {
    .naviFlick {
      display: none;
    }
  }

  .card {
    height: auto !important;
    width: 270px !important;

    .card-img {
      height: 150px;
    }

    .card-body {
      padding: 10px;
      h5 {
        font-size: 18px;
      }
      .card-text {
        font-size: 14px;
        margin-top: 15px;
        padding-top: 0 !important;
      }
    }
  }
}

.card-offline {
  position: relative;
  .naviFlick {
    position: absolute;
    width: 95vw;
    left: -4vw;
    top: 40%;
    justify-content: space-between;
    .btnNav {
      border-radius: 50%;
      background-color: $paz-main;
      color: #fff;
    }

    .btnNav:hover {
      border: 1px solid $paz-secondary;
      background-color: $paz-secondary;
    }
  }
}

.card {
  background: #ffffff;
  height: 582px;
  width: 376px;
  margin-right: 20px;

  border: 1px solid #e8eaed;
  box-sizing: border-box;
  box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.04), 0px 2px 6px rgba(0, 0, 0, 0.04),
    0px 0px 1px rgba(0, 0, 0, 0.04);
  border-radius: 8px;
}
h5 {
  font-style: normal;
  font-weight: 600;
  font-size: 20px;
  letter-spacing: 0.01em;
  margin-bottom: 0;
  /* Black/3 */
  color: #121527;
}

span {
  font-style: normal;
  font-weight: normal;
  font-size: 14px;
  line-height: 130%;
  letter-spacing: 0.01em;
  /* Black/2 */
  color: #757682;
}

.card-text {
  font-style: normal;
  font-weight: normal;
  font-size: 16px;
  overflow-y: hidden;
  line-height: 130%;
  letter-spacing: 0.01em;
  text-align: left;
  /* Black/2 */
  color: #757682;
}

.inner-border {
  border-top: 5px solid #07a148;
}
</style>
