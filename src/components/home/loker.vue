<template>
  <section class="blog">
    <b-container>
      <b-row class="justify-content-center">
        <b-col md="7">
          <div class="head">
            <span>LOWONGAN KERJA</span>
          </div>
          <h2 class="mt-4">
            Mari bergabung dengan kami dan menjadi partner Pengobatan Akhir
            Zaman
          </h2>
          <b-button variant="outline-success seemore" href="#" class="mt-4 px-4"
            ><span
              ><img
                src="../../assets/images/loker.svg"
                alt="info"
                height="25"
              />
              Lihat semua blog</span
            ></b-button
          >
        </b-col>
      </b-row>
      <b-row cols="4" class="mt-4">
        <b-col v-for="(lok, i) in lokers" :key="i">
          <b-card
            :title="lok.title"
            :sub-title="lok.subtitle"
            class="inner-border"
          >
            <div class="location d-flex mt-3">
              <i class="fas fa-map-marker-alt mr-2"></i
              ><b-card-text>{{ lok.location }}</b-card-text>
            </div>

            <div class="detail text-left">
              <router-link to="#" class="card-link">Lihat detail ></router-link>
            </div>
          </b-card>
        </b-col>
      </b-row>
    </b-container>
  </section>
</template>

<script>
export default {
  data() {
    return {
      lokers: [
        {
          title: "Therapist",
          subtitle:
            "Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang therapist",
          location: "Jakarta Pusat, DKI Jakarta",
        },
        {
          title: "Admin Online",
          subtitle:
            "Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang admin online",
          location: "Surabaya, Jawa Timur",
        },
        {
          title: "Mentor Therapist",
          subtitle:
            "Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang therapist",
          location: "Bandung, Jawa Barat",
        },
        {
          title: "Grafis Designer",
          subtitle:
            "Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang grafis",
          location: "Bandung, Jawa Barat",
        },
      ],
    };
  },
};
</script>

<style lang="scss" scoped>
section {
  margin-top: 110px;
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

h2 {
  font-style: normal;
  font-weight: 600;
  line-height: 140%;
  /* or 48px */
  color: #2e3e5c;
  text-align: center;
  letter-spacing: 0.5px;
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

.card {
  background: #ffffff;
  /* Neutral / 05 */

  border: 1px solid #e8eaed;
  box-sizing: border-box;
  box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.04), 0px 2px 6px rgba(0, 0, 0, 0.04),
    0px 0px 1px rgba(0, 0, 0, 0.04);
  border-radius: 8px;
}

.card-title {
  text-align: left;
  font-style: normal;
  font-weight: bold;
  font-size: 20px;
  line-height: 28px;
  color: #1a382a;
}

.card-subtitle {
  font-style: normal;
  font-weight: normal;
  font-size: 14px;
  margin-top: 10px;
  text-align: left;
  line-height: 22px;
  color: #4d645a;
}

.location i {
  color: #fd7d24;
}

.card-text {
  font-style: normal;
  font-weight: 500;
  font-size: 14px;
  line-height: 1;
  text-align: left;
  color: #4d645a;
}

.detail {
  margin-top: 10px;
}

.card-link {
  text-align: left;
  font-style: normal;
  font-weight: 500;
  font-size: 14px;
  line-height: 22px;
  color: #fd7d24;
}

.card-link:hover {
  color: #8b4c1e;
}

.inner-border {
  border-top: 5px solid #07a148;
}
</style>
