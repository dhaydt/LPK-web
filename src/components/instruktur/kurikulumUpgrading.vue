<template>
  <div class="kurikulumUpgrading">
    <b-card no-body>
      <b-container>
        <b-card-title>
          PAZ Upgrading
        </b-card-title>
        <div class="card-subtitle mt-4">
          Pembahasan tematik terhadap suatu masalah tertentu yang dibagi kedalam
          9 topik pembahasan diantaranya:
        </div>
        <div class="card-body">
          <b-row>
            <b-col md="4" sm="8" v-for="(up, i) in upgrade" :key="i">
              <b-card class="cardHeart" no-body>
                <b-row no-gutters>
                  <b-col md="3">
                    <b-img-lazy :src="up.img" height="64"></b-img-lazy>
                  </b-col>
                  <b-col md="8" class="ml-3">
                    <b-card-title>
                      {{ up.title }}
                    </b-card-title>
                    <div class="card-subtitle">
                      {{ up.text }}
                    </div>
                  </b-col>
                </b-row>
              </b-card>
            </b-col>
          </b-row>
        </div>
      </b-container>
    </b-card>
  </div>
</template>

<script>
export default {
  data() {
    return {
      upgrade: [
        {
          title: "Jantung",
          img: "/assets/svg/heart.svg",
          text:
            "Koroner, jantung bengkak, bypass, aritmea, klep bocor, lemah jantung",
        },
        {
          title: "Babypaz",
          img: "/assets/svg/baby.svg",
          text:
            "Cerebral palsy, down syndrom, jantung bocor, pneumonia, asma, kejang, epilepsi, polio",
        },
        {
          title: "Kanker / Benjolan",
          img: "/assets/svg/breast.svg",
          text: "Tumor dan kanker payudara",
        },
        {
          title: "Skoliosis",
          img: "/assets/svg/bone.png",
          text: "Bentuk tulang belakang yang tidak simetris",
        },
        {
          title: "Autoimun",
          img: "/assets/svg/immun.svg",
          text: "Lupus, psoriasis, arthritis",
        },
        {
          title: "Diabetes",
          img: "/assets/svg/finger.svg",
          text: "Mata kabur, sering tidur, sering buang air kecil",
        },
        {
          title: "PAZ Maryam",
          img: "/assets/svg/pregnant.svg",
          text: "Melahirkan secara alami dan cepat",
        },
        {
          title: "PAZ Stroke",
          img: "/assets/svg/cerebral.svg",
          text: "Penanganan stroke",
        },
        {
          title: "Paz Survival",
          img: "/assets/svg/fire.svg",
          text: "Bertahan hidup",
        },
      ],
    };
  },
};
</script>

<style lang="scss" scoped>
.card {
  box-shadow: none;
  margin-top: 50px;
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
.card-subtitle {
  text-align: left;
  font-style: normal;
  font-weight: normal;
  font-size: 20px;
  line-height: 160%;
  color: #757682;
}

.cardHeart {
  padding: 10px;
  min-height: 120px;
  background: #ffffff;
  box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.04), 0px 0px 2px rgba(0, 0, 0, 0.06),
    0px 0px 1px rgba(0, 0, 0, 0.04);
  border-radius: 4px;
  .card-title {
    font-style: normal;
    font-weight: 600;
    font-size: 20px;
    line-height: 140%;
    color: #121527;
  }
  .card-subtitle {
    font-style: normal;
    font-weight: normal;
    font-size: 14px;
    line-height: 160%;
    color: #757682;
  }
}
</style>
