<template>
  <div class="strukturDiagram">
    <b-card no-body>
      <b-modal ref="my-modal" hide-footer hide-header id="strukturModal">
        <div class="text-center h-100">
          <!-- <h3>{{ modalData }}</h3> -->

          <b-row class="h-100">
            <b-col sm="5">
              <b-img
                :src="imgUrl + modalData.img"
                :alt="modalData.name"
                class="struktur-img-modal"
              ></b-img>
            </b-col>
            <b-col sm="7" class="justify-content-center">
              <h5 class="card-title">{{ modalData.name }}</h5>
              <h6 class="posisi">{{ modalData.title }}</h6>
              <h6 class="nip">{{ modalData.nip }}</h6>
            </b-col>
          </b-row>
        </div>
      </b-modal>
      <div class="tree">
        <ul>
          <li class="direktur">
            <a @click="modal(direktur)" class="d-flex header"
              ><img :src="imgUrl + direktur.img" alt="child" /><span
                class="my-auto"
                >{{ direktur.title }}
                <h5 class="mt-2">{{ direktur.name }}</h5></span
              >
            </a>

            <ul class="lev-1">
              <li>
                <a @click="modal(pelatihan)"
                  ><img :src="imgUrl + pelatihan.img" alt="child" /><span
                    class="my-auto"
                    >{{ pelatihan.title }}
                    <h5 class="mt-2">{{ pelatihan.name }}</h5></span
                  ></a
                >

                <ul class="parPeserta">
                  <li class="text-center">
                    <a class="text-center disable"
                      ><span
                        class="m-auto p-2"
                        style="font-size: 16px; font-weight: 600;"
                        >Trainer
                      </span></a
                    >
                    <ul class="peserta">
                      <li class="text-center disable">
                        <a
                          ><span
                            class="my-auto p-3 ml-0"
                            style="font-size: 16px; font-weight: 600;"
                            >Peserta Didik</span
                          ></a
                        >
                      </li>
                    </ul>
                  </li>
                </ul>
              </li>
              <li class="levli">
                <a @click="modal(operasional)"
                  ><img :src="imgUrl + operasional.img" alt="child" /><span
                    class="my-auto"
                    >{{ operasional.title }}
                    <h5 class="mt-2">{{ operasional.name }}</h5></span
                  ></a
                >
              </li>
              <li class="levli">
                <a @click="modal(finance)"
                  ><img :src="imgUrl + finance.img" alt="child" /><span
                    class="my-auto"
                    >{{ finance.title }}
                    <h5 class="mt-2">{{ finance.name }}</h5></span
                  ></a
                >
              </li>
              <li class="levli">
                <a @click="modal(human)"
                  ><img :src="imgUrl + human.img" alt="child" /><span
                    class="my-auto"
                    >{{ human.title }}
                    <h5 class="mt-2">{{ human.name }}</h5></span
                  ></a
                >
              </li>
              <li class="levli">
                <a @click="modal(marketing)"
                  ><img :src="imgUrl + marketing.img" alt="child" /><span
                    class="my-auto"
                    >{{ marketing.title }}
                    <h5 class="mt-2">{{ marketing.name }}</h5></span
                  ></a
                >
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </b-card>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      dirUrl: "",
      dirUrl1: "",
      dirUrl2: "",
      dirUrl3: "",
      dirUrl4: "",
      dirUrl5: "",
      imgUrl: "",

      modalData: {},
      direktur: {},
      pelatihan: {},
      operasional: {},
      finance: {},
      human: {},
      marketing: {},
    };
  },

  created() {
    const mainUrl = localStorage.getItem("apiUrl");
    this.dirUrl = mainUrl + "/strukturDir";
    this.dirUrl1 = mainUrl + "/strukturPel";
    this.dirUrl2 = mainUrl + "/strukturOp";
    this.dirUrl3 = mainUrl + "/strukturFin";
    this.dirUrl4 = mainUrl + "/strukturHum";
    this.dirUrl5 = mainUrl + "/strukturMar";
    this.imgUrl = mainUrl + "/images/struktur/";
    this.getStruktur();
  },

  methods: {
    modal(val) {
      console.log(this.pelatihan);
      this.modalData = val;
      this.$refs["my-modal"].show();
    },
    async getStruktur() {
      const resp = await axios.get(this.dirUrl);
      const resp1 = await axios.get(this.dirUrl1);
      const resp2 = await axios.get(this.dirUrl2);
      const resp3 = await axios.get(this.dirUrl3);
      const resp4 = await axios.get(this.dirUrl4);
      const resp5 = await axios.get(this.dirUrl5);

      this.direktur = resp.data.data[0];
      this.pelatihan = resp1.data.data[0];
      this.operasional = resp2.data.data[0];
      this.finance = resp3.data.data[0];
      this.human = resp4.data.data[0];
      this.marketing = resp5.data.data[0];
    },
  },
};
</script>
<style lang="scss">
@media (max-width: 575.98px) {
  .tree li:first-child:before {
    border: 3px solid #bdbdbd;
  }
  .tree ul ul::before,
  .tree li:before,
  .tree li:after {
    // display: none;
    border-top: 3px solid #bdbdbd;
  }
}
.tree ul.parPeserta {
  position: relative;

  .peserta {
    position: absolute;
    width: 200px;
    top: -41px;
    left: 134px;
  }

  .peserta::before {
    content: "";
    position: absolute;
    top: 64px;
    left: -49px;
    border-left: 77px solid #bdbdbd;
    width: 0;
    height: 3px;
  }
}
#strukturModal {
  display: flex !important;
  align-items: center;

  .modal-dialog {
    .modal-content {
      height: 177px;
      min-width: 477px;

      .struktur-img-modal {
        height: 145px;
        max-height: 145px;
        max-width: 174px;
      }

      .card-title {
        font-style: normal;
        font-weight: bold;
        font-size: 28px;
        line-height: 40px;
        text-align: left;
        text-transform: capitalize;
        color: #07a148;
      }

      .posisi {
        font-style: normal;
        font-weight: 500;
        font-size: 20px;
        text-align: left;
        line-height: 28px;
        text-transform: capitalize;
        text-transform: capitalize;
        color: #121527;
      }

      .nip {
        font-style: normal;
        font-weight: normal;
        font-size: 16px;
        line-height: 24px;
        text-align: left;
        text-transform: capitalize;
        color: #757682;
      }
    }
  }
}
</style>

<style lang="scss" scoped>
@import "@/assets/main.scss";

.card {
  box-shadow: none;
}
.header {
  width: 30%;
  margin-left: 40%;
}
* {
  padding: 0;
  margin: 0;
  box-sizing: border-box;
}

body {
  height: 100vh;
  display: grid;
  align-items: center;
  background: #f5f5f5;
}

.tree {
  width: 100%;
  height: auto;
  text-align: center;
}

.tree ul {
  padding-top: 37px;
  position: relative;
  transition: 0.5s;
}

.tree li {
  display: inline-table;
  text-align: center;
  list-style-type: none;
  position: relative;
  padding: 10px;
  padding-top: 37px;
  transition: 0.5s;
}

.tree li:before,
.tree li:after {
  content: "";
  position: absolute;
  top: 0;
  right: 50%;
  border-top: 3px solid #bdbdbd;
  width: 51%;
  height: 37px;
}

.tree li:after {
  right: auto;
  left: 50%;
  border-left: 3px solid #bdbdbd;
}

.tree li:only-child::after,
.tree li:only-child::before {
  display: none;
}

.tree li:only-child {
  padding-top: 0;
}

.tree li:first-child:before,
.tree li:last-child:after {
  border: 0 none;
}

.tree li:last-child::before {
  border-right: 3px solid #bdbdbd;
  border-radius: 0 5px 0 0;
}

.tree li:first-child:after {
  border-radius: 5px 0 0 0;
}

.tree ul ul::before {
  content: "";
  position: absolute;
  top: 0;
  left: 50%;
  border-left: 3px solid #bdbdbd;
  width: 0;
  height: 37px;
}
.tree a {
  border: 1px solid #fff;
  padding: 1px;
  max-width: 210px;
  display: flex;
  // display: inline-grid;
  border-radius: 5px;
  text-decoration-line: none;
  transition: 0.5s;

  background: #ffffff;
  box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.04), 0px 2px 6px rgba(0, 0, 0, 0.04),
    0px 0px 1px rgba(0, 0, 0, 0.04);
  border-radius: 4px;
}

.tree a img {
  width: 75px;
  height: 75px;
  // border-radius: 100px;
  // margin: auto;
}

.tree a span {
  font-style: normal;
  font-weight: normal;
  font-size: 12px;
  margin-left: 10px;
  text-align: left;
  letter-spacing: 0.01em;
  color: #121527;
  h5 {
    font-weight: 600;
    font-size: 16px;
    letter-spacing: 0.01em;
    color: #121527;

    display: -webkit-box;
    -webkit-line-clamp: 1;
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-overflow: ellipsis;
  }
  // margin: auto;
}

// hover section

.tree li a:hover,
.tree li a:hover img,
.tree li a:hover + ul li a {
  background: #07a14840;
  cursor: pointer;
  color: $paz-secondary;
  border: 1px solid $paz-main;
  box-shadow: 0 0 4px 1px #5f5f5f;
}

.tree li a:hover + ul li:after,
.tree li a:hover + ul li:before,
.tree li a:hover + ul::before,
.tree li a:hover + ul ul::before {
  border-color: $paz-secondary;
}
</style>
