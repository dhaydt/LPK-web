<template>
  <section class="pelatihan">
    <b-jumbotron>
      <b-container>
        <b-row>
          <b-col>
            <div class="reg">
              <h5>Daftar pelatihan</h5>
            </div>
            <div class="title">
              <h1>Pelatihan yang kami selenggarakan</h1>
            </div>
          </b-col>
          <b-col>
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
    <section class="galeri">
      <b-row class="justify-content-end">
        <b-col md="10">
          <PelatihanCard></PelatihanCard>
        </b-col>
      </b-row>
    </section>
  </section>
</template>

<script>
import PelatihanCard from './pelatihanCard'
export default {
  data() {
    return {
      
    };
  },
  methods: {},
  components: {
    PelatihanCard,
  },
};
</script>

<style lang="scss" scoped>
.card {
  box-shadow: 0px 21.6792px 32.5188px rgba(0, 0, 0, 0.06),
    0px 2.7099px 8.12969px rgba(0, 0, 0, 0.04),
    0px 0px 1.35495px rgba(0, 0, 0, 0.04);
  border-radius: 4px;
}

.card-title {
  font-size: 1.1rem;
  font-style: normal;
  font-weight: 600;
  line-height: 28px;
  letter-spacing: 0.01em;
  text-align: left;
  color: #121527;
}

.card-text {
  font-size: 1rem;
  font-style: normal;
  font-weight: 500;
  line-height: 19px;
  letter-spacing: 0em;
  text-align: left;
  color: #757682;
}

.calender,
.time {
  font-size: 14px;
  font-style: normal;
  margin-top: 20px;
  font-weight: 400;
  line-height: 17px;
  letter-spacing: 0.01em;
  text-align: left;
  color: #757682;
}

.calender i,
.time i {
  font-size: 1.2rem;
  margin-right: 10px;
}

section {
  margin-top: 100px;
}

section.galeri {
  margin-top: -380px;
}

.jumbotron {
  background-color: #04162c;
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
  color: #fff;
}

.ket {
  margin-top: 40px;
  text-align: left;
  font-size: 1.2rem;
  font-style: normal;
  font-weight: 400;
  line-height: 32px;
  letter-spacing: 0px;
  color: #fff;
}
</style>
