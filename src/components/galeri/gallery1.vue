<template>
  <section class="mb-4 gallery">
    <b-container>
      <b-row class="justify-content-center">
        <b-col lg="9">
          <b-card sub-title="Card subtitle" no-body>
            <template #header>
              <div class="head">
                <span>{{ data ? data.date_range : Date.now() }} </span>
              </div>
            </template>
            <div id="moon"></div>
            <b-card-body>
              <b-card-title>
                {{ data ? data.lokasi : "Galeri PAZ Klaten, Indonesia" }}
              </b-card-title>
              <b-card-text class="mt-4">
                {{ data ? data.konten : "Galeri data belum tersedia" }}
              </b-card-text>
              <b-button
                variant="outline-success seemore"
                :to="'/galeri_detail/' + data.id"
                class="mt-4 px-4"
                ><span
                  ><img
                    src="/assets/images/picts.png"
                    alt="info"
                    height="25"
                    class="mr-2"
                  />
                  Lihat semua foto</span
                ></b-button
              >
            </b-card-body>
          </b-card>
        </b-col>
      </b-row>
    </b-container>
    <div id="shape">
      <div id="moons"></div>
    </div>
    <b-row class="justify-content-center w-100">
      <Card :img="img"></Card>
    </b-row>
  </section>
</template>

<script>
import Card from "./card";
export default {
  components: {
    Card,
  },
  props: ["data", "img"],
  data() {
    return {};
  },
  mounted() {
    console.log(this.img);
  },
};
</script>

<style lang="scss" scoped>
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
  margin-top: 80px;
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

.btn-outline-success.seemore:hover {
  span {
    color: #fff;
  }
}

.seemore span {
  font-size: 16px;
  font-style: normal;
  font-weight: 600;
  line-height: 2;
  letter-spacing: 0.04em;
  text-align: left;
  color: #07a148;
  text-transform: capitalize;
}
</style>
