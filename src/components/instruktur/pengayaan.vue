<template>
  <div class="pengayaan">
    <section>
      <b-container>
        <div class="header">
          <h1 class="d-block text-left">PAZ Pengayaan</h1>
          <h4 class="d-block text-left">
            Tambahan materi supplement bagi paztrooper
          </h4>
        </div>
        <b-row cols-md="2" cols-sm="2" cols="1">
          <b-col v-for="(pe, i) in pengayaan" :key="i">
            <b-card>
              <a @click="modal(pe)" class="amodal">
                <b-img-lazy
                  :src="imgUrl + pe.img"
                  height="104"
                  width="104"
                ></b-img-lazy>

                <div class="card-title mt-4">{{ pe.name }}</div>
                <div class="card-text mt-2">{{ pe.subtitle }}</div>
              </a>
            </b-card>
          </b-col>
        </b-row>
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
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      getUrl: "",
      imgUrl: "",
      pengayaan: [],
      data: {},
    };
  },

  created() {
    const mainUrl = localStorage.getItem("apiUrl");
    this.getUrl = mainUrl + "/kurikulumPengaya";
    this.imgUrl = mainUrl + "/images/kurikulum/";
    this.getKuri();
  },

  methods: {
    async getKuri() {
      const resp = await axios.get(this.getUrl);
      const data = resp.data.data;
      this.pengayaan = data;
    },
    modal(val) {
      this.data = val;
      this.$refs["my-modal"].show();
    },
  },
};
</script>

<style lang="scss" scoped>
@media (max-width: 575.98px) {
  .pengayaan {
    .header {
      h1.d-block {
        font-size: 28px;
        font-weight: 700;
        padding-bottom: 20px;
      }
      h4.d-block {
        font-size: 16px;
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

.amodal {
  cursor: pointer;
}
.card {
  background: #ffffff;
  /* 3 */

  box-shadow: 0px 16px 24px rgba(0, 0, 0, 0.06), 0px 2px 6px rgba(0, 0, 0, 0.04),
    0px 0px 1px rgba(0, 0, 0, 0.04);
  border-radius: 4px;
}
.card-title {
  font-style: normal;
  font-weight: 600;
  font-size: 20px;
  line-height: 140%;
  text-transform: capitalize;
  text-align: center;
  color: #121527;
}

.card-text {
  font-style: normal;
  font-weight: normal;
  font-size: 16px;
  line-height: 160%;
  text-transform: capitalize;
  text-align: center;
  color: #757682;
}
.pengayaan {
  margin-top: 80px;
}

.header h1 {
  font-style: normal;
  font-weight: 600;
  font-size: 32px;
  line-height: 140%;
  /* identical to box height, or 45px */

  letter-spacing: 0.5px;

  /* Black/3 */

  color: #121527;
}

.header h4 {
  font-style: normal;
  font-weight: normal;
  font-size: 20px;
  line-height: 160%;
  /* identical to box height, or 32px */

  /* Black/2 */

  color: #757682;
}
</style>
