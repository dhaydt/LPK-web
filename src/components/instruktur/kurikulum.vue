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
                <b-img-lazy
                  src="/assets/svg/anatomy 1.png"
                  alt="Image"
                  height="144"
                  class="rounded-0"
                ></b-img-lazy>
              </b-col>
              <b-col md="9">
                <b-card-body title="PAZ Basic">
                  <b-card-text>
                    Wajib diikuti oleh siapapun yang ingin belajar terapi PAZ
                    secara mendalam dengan bahasan utama Syaraf Kejepit dan Asma
                  </b-card-text>
                </b-card-body>
              </b-col>
            </b-row>
          </b-card>
        </b-col>
      </b-row>
      <KurikulumUpgrading></KurikulumUpgrading>
    </b-container>
  </section>
</template>

<script>
import KurikulumUpgrading from "./kurikulumUpgrading";
export default {
  components: { KurikulumUpgrading },
  data() {
    return {};
  },
};
</script>

<style lang="scss" scoped>
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
