<template>
  <section class="kurikulum">
    <b-container>
      <div id="moon"></div>
      <b-row class="justify-content-center mb-4">
        <b-col lg="9">
          <b-card sub-title="Card subtitle" no-body>
            <template #header>
              <div class="head">
                <span>Kurikulum pendidikan</span>
              </div>
            </template>
            <b-card-body>
              <b-card-title>Kurikulum pelatihan LKP Al Kasaw</b-card-title>
            </b-card-body>
          </b-card>
        </b-col>
      </b-row>
      <div id="shape">
        <div id="moons"></div>
      </div>
      <b-row>
        <b-col>
          <b-card no-body class="anatomi overflow-hidden">
            <b-row no-gutters>
              <b-col md="3">
                <a @click="modal" class="amodal">
                  <b-img-lazy
                    :src="imgUrl + data.img"
                    alt="Image"
                    height="144"
                    class="rounded-0"
                  ></b-img-lazy>
                </a>
              </b-col>
              <b-col md="9">
                <b-card-body :title="data.name">
                  <b-card-text>
                    {{ data.subtitle }}
                  </b-card-text>
                </b-card-body>
              </b-col>
            </b-row>
          </b-card>
        </b-col>
      </b-row>
      <KurikulumCard :upgrade="upgrade" v-if="isData"></KurikulumCard>
    </b-container>
    <b-modal ref="my-modal" hide-footer hide-header id="modalBasic" size="md">
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
  </section>
</template>

<script>
import axios from "axios";
import KurikulumCard from "./kurikulumCard";
export default {
  components: {
    KurikulumCard,
  },
  data() {
    return {
      getUrl: "",
      isData: false,
      imgUrl: "",
      upgradeUrl: "",
      upgrade: [],
      data: {},
    };
  },

  created() {
    const mainUrl = localStorage.getItem("apiUrl");
    this.getUrl = mainUrl + "/kurikulumBasic";
    this.imgUrl = mainUrl + "/images/kurikulum/";
    this.upgradeUrl = mainUrl + "/kurikulumUpgrade";
    this.getKuri();
    this.getUpgrade();
  },

  methods: {
    async getUpgrade() {
      const resp = await axios.get(this.upgradeUrl);
      const data = resp.data.data;
      this.upgrade = data;
      this.isData = true;
    },
    async getKuri() {
      const resp = await axios.get(this.getUrl);
      const data = resp.data.data[0];
      this.data = data;
    },
    modal() {
      this.$refs["my-modal"].show();
    },
  },
};
</script>
<style lang="scss">
@media (max-width: 575.98px) {
  section.kurikulum {
    .card-body {
      h4.card-title {
        font-size: 30px;
        font-weight: 700;
        line-height: 43px;
        padding-top: 20px;
      }
    }
    .anatomi {
      .card-body {
        h4.card-title {
          font-size: 26px !important;
        }
        p.card-text {
          font-size: 16px !important;
        }
      }
    }
  }
}
#modalBasic {
  display: flex !important;
  align-items: center;

  .desc::-webkit-scrollbar {
    width: 8px;
  }

  /* Track */
  .desc::-webkit-scrollbar-track {
    box-shadow: inset 0 0 5px #f5f5f5;
    border-radius: 10px;
  }

  /* Handle */
  .desc::-webkit-scrollbar-thumb {
    background: #e9e9e9;
    border-radius: 10px;
  }

  /* Handle on hover */
  .desc::-webkit-scrollbar-thumb:hover {
    background: #d1cece;
  }

  .modal-content {
    width: 600px;
    .modal-body {
      .body {
        .desc {
          /* width */
        }
      }
    }
  }

  .card-side {
    .card-title {
      font-style: normal;
      font-weight: 600;
      font-size: 20px;
      text-align: left;
      line-height: 1;
      color: #121527;
    }

    .card-subtitle {
      font-style: normal;
      font-weight: normal;
      font-size: 14px;
      text-align: left;
      color: #757682;
    }
  }

  .desc {
    height: 112px;
    overflow-y: scroll;

    .card-title {
      font-style: normal;
      font-weight: 600;
      font-size: 16px;
      text-align: left;
      color: #121527;
    }

    .card-subtitle {
      font-family: Inter;
      font-style: normal;
      font-weight: normal;
      font-size: 14px;
      color: #757682;
      text-align: left;
    }
  }

  .modalButton {
    background: #ffffff;
    border: 1px solid #07a148;
    box-sizing: border-box;
    border-radius: 4px;
    font-weight: 600;
    font-size: 16px;
    transition: 0.5s;
    letter-spacing: 0.04em;
    color: #07a148;
  }

  .modalButton:hover {
    background: #fd7d24;
    color: #fff;
    border: 1px solid #fd7d24;
  }
}
</style>

<style lang="scss" scoped>
.amodal {
  cursor: pointer;
}
section {
  margin-top: 100px;
}

#moon {
  font-size: 20em;
  display: inline-block;
  width: 0.4em;
  box-sizing: content-box;
  height: 0.4em;
  border: 0.3em solid #fd7d24;
  position: absolute;
  left: -164px;
  opacity: 0.1;
  border-radius: 50%;
}

#shape {
  position: absolute;
  right: 0;
  top: 1080px;
  overflow: hidden;
  width: 60px;
}

#moons {
  font-size: 20em;
  display: inline-block;
  width: 0.2em;
  box-sizing: content-box;
  height: 0.2em;
  border: 0.1em solid #fd7d24;

  opacity: 0.1;
  border-radius: 50%;
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
  font-weight: 600;
  line-height: 45px;
  letter-spacing: 0.5px;
  text-transform: capitalize;
  text-align: center;
  color: #2e3e5c;
}

.card-text {
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

.student {
  font-size: 60px;
  font-style: normal;
  font-weight: 700;
  line-height: 60px;
  letter-spacing: 0px;
  text-align: center;
  color: #fd7d24;
}

.text-muted {
  font-size: 20px;
  font-style: normal;
  font-weight: 400;
  line-height: 20px;
  letter-spacing: 0px;
  text-align: center;
  color: #aaacba;
  text-transform: capitalize;
}

.anatomi {
  padding: 10px;
  background: #ffffff;
  box-shadow: 0px 16px 24px rgba(0, 0, 0, 0.06), 0px 2px 6px rgba(0, 0, 0, 0.04),
    0px 0px 1px rgba(0, 0, 0, 0.04);
  border-radius: 4px;
  .card-body {
    padding: 0;
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
  .card-text {
    text-align: left;
    font-style: normal;
    font-weight: normal;
    font-size: 20px;
    line-height: 160%;
    color: #757682;
  }
}
</style>
