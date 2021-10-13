<template>
  <section class="Legalitas">
    <b-container>
      <div id="moon"></div>
      <b-row class="justify-content-center">
        <b-col lg="9">
          <b-card sub-title="Card subtitle" no-body>
            <template #header>
              <div class="head">
                <span>Legalitas</span>
              </div>
            </template>
            <b-card-body>
              <b-card-title
                >LKP PAZ Al Kasaw Telah Terdaftar Secara Sah Sebagai Lembaga
                Kursus Pelatihan</b-card-title
              >
            </b-card-body>
          </b-card>
        </b-col>
        <LegalitasCard></LegalitasCard>
      </b-row>
      <!-- <div id="shape">
        <div id="moons"></div>
      </div> -->
    </b-container>
  </section>
</template>

<script>
import LegalitasCard from "./legalitasCard";
export default {
  data() {
    return {};
  },
  components: {
    LegalitasCard,
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
