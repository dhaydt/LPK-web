<template>
  <section class="visi">
    <b-container>
      <b-row>
        <b-col>
          <div class="title">
            <h5>Visi kami</h5>
          </div>
          <div class="subtitle">
            <h1>PAZtrooper Profesional, Beradab, dan Berdaya Juang</h1>
          </div>
        </b-col>
        <b-col>
          <div class="title">
            <h5>Misi kami</h5>
          </div>
          <b-row v-for="mis in mission" :key="mis.id" class="mt-3">
            <b-col sm="2" class="d-flex align-items-center"
              ><b-avatar :text="mis.id" size="lg"></b-avatar
            ></b-col>
            <b-col sm="10" class="misi text-left"
              ><span
                >{{ mis.desc }}</span
              >
            </b-col>
          </b-row>
        </b-col>
      </b-row>
    </b-container>
  </section>
</template>

<script>
export default {
  data() {
    return {
      mission: [
        {
          id: '1',
          desc:
            "Riset dan pengembangan Keilmuan PAZ Al Kasaw dalam konteks pondasi yang sudah diletakkan oleh Ustadz Haris Moedjahid Rahimahullah",
        },
        {
          id: '2',
          desc:
            "Pendidikan dan pelatihan ilmu paz al kasaw berketerlanjutan dengan karakter paztrooper yang unggul",
        },
        {
          id: '3',
          desc:
            "Pengelolaan manajerial alumni berbasis IT untuk kemudahan masyarakat mendapat layanan terapi PAZ Al Kasaw",
        },
        {
          id: '4',
          desc:
            "Menjadi perusahaan yang profitable, high margin, dan memberikan intangiable values bagi stakeholder yang terlibat",
        },
        {
          id: '5',
          desc:
            "Memberikan inspirasi cara sehat alamiah, islami, dan praktis ke seluas luas umat muslim di dunia",
        },
      ],
    };
  },
};
</script>

<style lang="scss" scoped>
@import "@/assets/main.scss";

.visi {
  background-color: $paz-dark;
  height: 803px;
  margin-top: -32px;
}

h5 {
  text-transform: uppercase;
  color: $paz-secondary;
  font-style: normal;
  font-weight: bold;
  margin-top: 100px;
  font-size: 20px;
  text-align: left;
  line-height: 160%;
  letter-spacing: 0.5px;
}

h1 {
  color: #fff;
  font-style: normal;
  font-weight: bold;
  text-align: left;
  font-size: 40px;
  line-height: 140%;
}

span.b-avatar {
  background-color: $paz-secondary;
}

span.b-avatar-text {
  font-style: normal;
  font-weight: 600;
  font-size: 28px;
  line-height: 100%;
  text-align: center;
  color: #ffffff;
}

.misi span {
  font-style: normal;
  font-weight: normal;
  font-size: 20px;
  text-align: left;
  line-height: 160%;
  letter-spacing: 0.01em;
  color: #ffffff;
}
</style>
