<template>
  <section class="mb-2 gallery detailGaleri">
    <b-container>
      <b-row class="justify-content-center">
        <b-col md="9" sm="9">
          <b-card no-body class="galeriess">
            <template #header>
              <b-card-title>
                {{ title.title }}
              </b-card-title>
            </template>
            <div id="moon"></div>
            <b-card-body class="pt-0">
              <b-card-text>
                {{
                  title.desc ? title.desc : "Kegiatan yang kami selenggarakan"
                }}
              </b-card-text>
              <div class="head mt-3">
                <span>{{ title.date }} </span>
              </div>
            </b-card-body>
          </b-card>
        </b-col>
      </b-row>
    </b-container>
    <div id="shape">
      <div id="moons"></div>
    </div>
    <b-row class="justify-content-center w-100" no-gutters>
      <CardDetail @titles="getTitles"></CardDetail>
    </b-row>
  </section>
</template>

<script>
import CardDetail from "./cardDetail";
import $ from "jquery";
export default {
  components: {
    CardDetail,
  },
  data() {
    return {
      getUrl: "",
      kopdarUrl: "",
      imgUrl: "",
      images: [],
      title: {},
    };
  },

  watch: {
    images: function(val) {
      this.images = val;
      // console.log("val", val);
    },
  },

  created() {
    window.scrollTo(0, 0);
  },

  mounted() {},

  methods: {
    getTitles(val) {
      this.title = val;
    },
    hideNav() {
      $(".navbar").css({ "margin-top": "-40px" });
    },
  },
};
</script>

<style lang="scss" scoped>
@media (max-width: 575.98px) {
  .detailGaleri {
    .galeriess {
      .card-title {
        font-size: 28px;
        line-height: 1.5;
      }

      .card-body {
        .card-text {
          font-size: 20px;
        }
        .head span {
          text-transform: capitalize;
        }
      }
    }
  }
}

@media (max-width: 575.98px) {
  footer {
    .floating {
      right: 20px;
      bottom: 66px;
      .btn {
        padding-right: 20px;
        font-size: 16px;

        .fab {
          margin-left: 20px;
        }
      }
    }
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
  // margin-top: 100px;
}

.card {
  border: none;
  box-shadow: none;
}

.card-header {
  background-color: transparent;
}

.card-title {
  font-size: 32px;
  font-style: normal;
  text-transform: capitalize;
  font-weight: 600;
  line-height: 45px;
  letter-spacing: 0.5px;
  text-align: center;
  color: #2e3e5c;
}

.card-text {
  text-transform: capitalize;
  font-size: 24px;
  font-style: normal;
  font-weight: 400;
  line-height: 38px;
  letter-spacing: 0px;
  text-align: center;
  color: #686870;
}

em {
  font-size: 20px;
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
</style>
