<template>
  <div class="kurikulumUpgrading">
    <b-card no-body>
      <b-container>
        <b-card-title>
          PAZ Upgrading
        </b-card-title>
        <b-row>
          <b-col sm="12" md="8">
            <div class="card-subtitle mt-4">
              Pembahasan tematik terhadap suatu masalah tertentu yang dibagi
              kedalam 9 topik pembahasan diantaranya:
            </div>
          </b-col>
        </b-row>
        <b-row style="overflow: hidden;">
          <div class="card-offline w-100">
            <b-row class="navFlick justify-content-end">
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

            <div class="wrapper flicking-wrap container mt-3 w-100">
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
                  class="cardSlider item mr-5"
                  v-for="(slide, i) in upgrade"
                  :key="i"
                >
                    <a @click="modal(slide)" class="amodal">
                  <b-card class="inner-border text-center sliderCard" no-body>
                      <b-img
                        :src="imgUrl + slide.img"
                        height="74"
                        class="mx-auto"
                        width="74"
                      ></b-img>
                      <b-col sm="12" class="mt-4">
                        <h5>{{ slide.name }}</h5>
                        <span>{{ slide.penyakit }}</span>
                      </b-col>
                  </b-card>
                    </a>
                </div>
              </Flicking>
            </div>
          </div>
        </b-row>
      </b-container>

      <b-modal ref="my-modal" hide-footer hide-header id="modalBasic" size="md" >
        <div class="body">
          <b-row>
            <b-col md="2"
              ><b-img :src="imgUrl + data.img" alt="Image" height="84"></b-img
            ></b-col>
            <b-col md="10">
              <div class="card-side pt-0 pl-2">
                <b-card-title>{{ data.name }} </b-card-title>
                <div class="card-subtitle mt-1">
                  {{ data.subtitle }}
                </div>
              </div>
            </b-col>
          </b-row>
          <b-row>
            <div class="desc mt-3 px-4">
              <!-- <b-card-title>Kisi - kisi kurikulum</b-card-title> -->
              <div class="card-subtitle mt-2" v-html="data.konten"></div>
            </div>
          </b-row>
          <b-row class="mt-3 w-100 justify-content-center" no-gutters>
            <b-col md="12 px-2">
              <b-button
                @click="$bvModal.hide('modalBasic')"
                class="modalButton"
                variant="outline-success w-100"
                >Tutup</b-button
              >
            </b-col>
          </b-row>
        </div>
      </b-modal>
    </b-card>
  </div>
</template>

<script>
import "@egjs/vue-flicking/dist/flicking.css";
import { FlickingError, ERROR_CODE } from "@egjs/flicking";
export default {
  props: ["upgrade"],
  data() {
    return {
      imgUrl: "",
      data: {},
    };
  },
  created() {
    this.imgUrl = localStorage.getItem("apiUrl") + "/images/kurikulum/";
  },

  methods: {
    modal(val) {
      this.data = val;
      this.$refs["my-modal"].show();
    },

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

  mounted() {
    window.scrollTo(0, 0);
  },
};
</script>

<style lang="scss" scoped>
@import "@/assets/main.scss";
@media (max-width: 575.98px) {
  .kurikulumUpgrading {
    .card {
      h4.card-title {
        font-size: 28px;
        font-weight: 700;
      }

      .card-subtitle {
        font-size: 16px;
      }
    }
  }
  .card-offline {
    .naviFlick {
      display: none !important;
    }
  }
}
.card-offline {
  margin-top: -40px;
}
.amodal {
  cursor: pointer;
}

.naviFlick {
  // position: relative;
  position: absolute;
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

.card {
  box-shadow: none;
  margin-top: 50px;
}
.card-title {
  text-align: left;
  font-style: normal;
  font-weight: 600;
  font-size: 32px;
  line-height: 140%;
  letter-spacing: 0.5px;
  color: #121527;
}
.card-subtitle {
  text-align: left;
  font-style: normal;
  font-weight: normal;
  font-size: 20px;
  line-height: 160%;
  color: #757682;
}

.sliderCard {
  min-height: 272px;
  width: 292px;
  box-shadow: 0px 16px 24px rgba(0, 0, 0, 0.06), 0px 2px 6px rgba(0, 0, 0, 0.04),
    0px 0px 1px rgba(0, 0, 0, 0.04);
  border-radius: 4px;

  h5 {
    font-style: normal;
    font-weight: 600;
    font-size: 20px;
    line-height: 140%;
    /* identical to box height, or 28px */

    text-align: center;

    /* Black/3 */

    color: #121527;
  }
  span {
    font-style: normal;
    font-weight: normal;
    font-size: 16px;
    line-height: 160%;
    /* or 26px */

    text-align: center;

    /* Black/2 */

    color: #757682;
  }
}
</style>
