<template>
  <section class="struktur" id="struktur">
    <div id="moon"></div>
    <b-row class="justify-content-center flex-row" no-gutters>
      <b-col lg="9">
        <b-card sub-title="Card subtitle" no-body>
          <template #header>
            <div class="head">
              <span>Struktur kepengurusan</span>
            </div>
          </template>
          <b-card-body>
            <b-card-title>TIM LKP PAZ AL KASAW</b-card-title>
          </b-card-body>

          <div class="card-body text-center">
            <div class="row">
              <div class="col-sm-4">
                <div class="d-inline-flex">
                  <h5 class="mr-2 student">6</h5>
                </div>
                <p class="text-muted text-truncate mb-0">Tahun</p>
              </div>

              <div class="col-sm-4">
                <div class="d-inline-flex">
                  <h5 class="mr-2 student">100 +</h5>
                </div>
                <p class="text-muted text-truncate mb-0">Anggota</p>
              </div>

              <div class="col-sm-4">
                <div class="d-inline-flex">
                  <h5 class="mr-2 student">2</h5>
                </div>
                <p class="text-muted text-truncate mb-0">Cabang</p>
              </div>
            </div>
          </div>
        </b-card>
      </b-col>
      <b-col md="12">
        <StrukturDiagram></StrukturDiagram>
      </b-col>
    </b-row>
    <div id="shape">
      <div id="moons"></div>
    </div>
  </section>
</template>

<script>
import StrukturDiagram from "./strukturDiagram";
export default {
  data() {
    return {};
  },
  components: {
    StrukturDiagram,
  },
};
</script>

<style lang="scss" scoped>
section {
  margin-top: 100px;
  margin-bottom: 80px;
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
</style>
