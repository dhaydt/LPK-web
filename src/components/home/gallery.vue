<template>
  <section class="mb-4 gallery" id="gallery">
    <b-container>
      <b-row class="justify-content-center">
        <b-col lg="9">
          <b-card sub-title="Card subtitle" no-body>
            <template #header>
              <div class="head">
                <span>Galeri pelatihan</span>
              </div>
            </template>
            <div id="moon"></div>
            <b-card-body>
              <b-card-title class="mt-3"
                >Sekilas dokumentasi gambar pelatihan yang kami selenggarakan</b-card-title
              >
              <b-card-text class="mt-5">
                Setiap kota yang terpilih PAZ Generasi Unggul, membuka pelatihan BASIC dan pelatihan tingkat lanjut yang disebut Upgrading.
              </b-card-text>
            </b-card-body>
          </b-card>
        </b-col>
      </b-row>
    </b-container>
    <div id="shape">
      <div id="moons"></div>
    </div>
    <b-row class="justify-content-center w-100">
      <GaleriCard></GaleriCard>
    </b-row>
  </section>
</template>

<script>
import GaleriCard from "./galeriCard";
export default {
  components: { GaleriCard },
  data() {
    return {};
  },
};
</script>

<style lang="scss" scoped>
@media (max-width: 575.98px) {
  .card-body {
    h4.card-title {
      font-size: 30px;
      font-weight: 700;
      line-height: 43px;
    }
    p.card-text {
      font-size: 16px;
      line-height: 38px;
      margin-top: 20px !important;
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
  margin-top: 100px;
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
  text-transform: capitalize;
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
  line-height: 19px;
  letter-spacing: 0.04em;
  text-align: left;
  color: #07a148;
  text-transform: capitalize;
}
</style>
