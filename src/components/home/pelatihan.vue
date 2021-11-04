<template>
  <section class="pelatihan">
    <b-jumbotron>
      <b-container>
        <b-row>
          <b-col md="6">
            <div class="reg">
              <h5>Daftar pelatihan</h5>
            </div>
            <div class="title">
              <h1>Pelatihan yang kami selenggarakan</h1>
            </div>
          </b-col>
          <b-col md="6">
            <div class="ket">
              <span>
                Kami membina para anggota agar masing masing anggota memiliki
                kemampuan untuk memberikan treatment penyembuhan bagi para
                pasien
              </span>
            </div>
          </b-col>
        </b-row>
      </b-container>
    </b-jumbotron>
    <section id="pelatihan" class="galeri w-100" style="overflow: hidden">
      <b-row class="justify-content-end">
        <b-col md="12">
          <PelatihanCard></PelatihanCard>
        </b-col>
      </b-row>
    </section>
  </section>
</template>

<script>
import PelatihanCard from "./pelatihanCard";
export default {
  data() {
    return {};
  },
  methods: {},
  components: {
    PelatihanCard,
  },
};
</script>

<style lang="scss" scoped>
@media (max-width: 575.98px) {
  .col-md-6 {
    .reg h5 {
      font-size: 18px;
    }

    .title {
      h1 {
        font-size: 30px;
        line-height: 1.3;
      }
    }
  }
  .col-md-6 {
    .ket {
      margin-top: 10px;
      span {
        font-size: 18px;
      }
    }
  }
  section#pelatihan {
    margin-top: -232px;
  }
}
section {
  margin-top: 100px;
}

section.galeri {
  margin-top: -380px;
}

.jumbotron {
  background: linear-gradient(0deg, #ecfef4, #ecfef4);
  height: 591px;
  margin-bottom: 0;
}

.reg h5 {
  font-size: 1.2rem;
  font-style: normal;
  font-weight: 700;
  line-height: 32px;
  letter-spacing: 0.5px;
  text-align: left;
  color: #fd7d24;
  text-transform: uppercase;
}

.title h1 {
  font-size: 2.5rem;
  font-style: normal;
  font-weight: 700;
  line-height: 56px;
  letter-spacing: 0em;
  text-align: left;
  color: #121527;
}

.ket {
  margin-top: 40px;
  text-align: left;
  font-size: 1.2rem;
  font-style: normal;
  font-weight: 400;
  line-height: 32px;
  letter-spacing: 0px;
  color: #121527;
}
</style>
