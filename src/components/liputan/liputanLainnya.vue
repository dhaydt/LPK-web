<template>
  <div class="lainnya">
    <b-container>
      <b-card no-body>
        <b-card-title class="text-left mb-4"
          >Lihat liputan lainnya</b-card-title
        >
        <b-row cols-md="3" cols-sm="1">
          <b-col v-for="n in random" :key="n.id">
            <b-card no-body>
              <b-row no-gutters cols-md="6" cols="1">
                <b-col md="5" sm="5">
                  <b-card-img :src="imgUrl + n.img" height="120"></b-card-img>
                </b-col>
                <b-col
                  md="7"
                  sm="7"
                  class="pl-3 text-left d-flex flex-column justify-content-between"
                >
                  <b-card-title class="inner-card">{{ n.title }}</b-card-title>

                  <b-card-text class="date text-left"
                    >{{ n.date | moment("DD/MM/YYYY HH:mm") }} WIB
                  </b-card-text>

                  <a @click="goTo(n.id)" class="more">lihat selengkapnya -></a>
                </b-col>
              </b-row>
            </b-card>
          </b-col>
        </b-row>
      </b-card>
    </b-container>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      random: [],
      imgUrl: "",
      randUrl: "",
      mainUrl: "",
    };
  },
  created() {
    this.mainUrl = localStorage.getItem("apiUrl");
    this.randUrl = this.mainUrl + "/liputanRand/" + this.$route.params.id;
    this.imgUrl = this.mainUrl + "/images/liputan/";
    this.getRandom();
  },

  methods: {
    goTo(id) {
      this.$router.push("/liputan/" + id).catch(() => {});
      this.randUrl = this.mainUrl + "/liputanRand/" + this.$route.params.id;
      this.getRandom();
      this.$root.$emit("getId");
      window.scrollTo(0, 0);
    },
    async getRandom() {
      const resp = await axios.get(this.randUrl);
      const data = resp.data.data;
      this.random = data;
    },
  },
};
</script>

<style lang="scss" scoped>
.card {
  box-shadow: none;
  border-radius: 0;
  .card-title {
    font-style: normal;
    font-weight: 600;
    font-size: 28px;
    line-height: 140%;
    text-transform: capitalize;
    color: #737686;
  }
}

.card-img {
  border-radius: 0;
}

.date {
  font-weight: normal;
  font-size: 16px;
  color: #757682;
}

.more {
  font-style: normal;
  font-weight: 600;
  cursor: pointer;
  font-size: 16px;
  text-transform: capitalize;
  text-align: left;
  color: #fd7d24;
}

.more:hover {
  color: #cf671c;
}
.card-title.inner-card {
  font-style: normal;
  font-weight: 600;
  font-size: 16px;
  line-height: 160%;
  letter-spacing: 0.5px;
  text-align: left;
  color: #2e3e5c;

  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
  text-overflow: ellipsis;
}
</style>
