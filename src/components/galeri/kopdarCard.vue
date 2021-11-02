<template>
  <div class="galeri justify-content-center w-100 row">
    <b-col md="11">
      <div class="card-body border-top text-center">
        <b-row cols-md="3">
          <b-col v-for="(im, i) in paginatedItems" :key="i">
            <b-card no-body>
              <b-row cols-md="2" no-gutters id="row-img">
                <b-col
                  class="col-img"
                  v-for="img in im.slice(0, 4)"
                  :key="img.id"
                  ><b-img-lazy :src="imgUrl + img.img" class="w-100 h-100">
                  </b-img-lazy
                ></b-col>
              </b-row>
              <b-row class="row-detail flex-column card-body">
                <b-card-title class="text-left px-2"
                  >{{ im[0].lokasi }}
                </b-card-title>
                <b-card-text class="text-left px-2 mt-2"
                  >{{ im[0].date_range }}
                </b-card-text>
                <div class="detail text-left px-2">
                  <router-link
                    :to="'/galeri_detail/' + im[0].lokasi"
                    class="card-link"
                    >Lihat detail -></router-link
                  >
                </div>
              </b-row>
            </b-card>
          </b-col>
        </b-row>
        <b-row class="justify-content-center">
          <b-col md="8" class="d-flex justify-content-center mt-4">
            <b-pagination
              @change="onPageChanged"
              :total-rows="totalRows"
              :per-page="perPage"
              v-model="currentPage"
              hide-goto-end-buttons
            >
              <template #prev-text
                ><span class="text-danger"
                  ><i class="fas fa-chevron-left"></i></span
              ></template>
              <template #next-text
                ><span class="text-warning"
                  ><i class="fas fa-chevron-right"></i></span
              ></template>
              <template #page="{ page, active }" class="pagi-box">
                <b v-if="active" class="pagi">{{ page }}</b>
                <i v-else>{{ page }}</i>
              </template>
            </b-pagination>
          </b-col>
        </b-row>
      </div>
    </b-col>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      imgUrl: "",
      kopdarUrl: "",
      data: [],
      index: null,
      currentPage: 1,
      perPage: 3,
      totalRows: "",
      paginatedItems: [],
    };
  },

  computed: {
    rows() {
      return this.lokers.length;
    },
  },

  created() {
    const mainUrl = localStorage.getItem("apiUrl");
    this.kopdarUrl = mainUrl + "/groupKopdarFront";
    this.imgUrl = mainUrl + "/images/galeri/";
    this.getData();
  },

  mounted() {},

  methods: {
    async getData() {
      const resp = await axios.get(this.kopdarUrl);
      const data = resp.data;
      this.data = data;
      const img = this.data;

      const grouping = (array) => {
        return array.reduce((result, currentValue) => {
          (result[currentValue.lokasi] =
            result[currentValue.lokasi] || []).push(currentValue);
          return result;
        }, {});
      };
      let grouped = grouping(img, "i");
      let cat = Object.keys(grouped);
      var db = [];
      for (var i = 0; i < cat.length; i++) {
        var s = cat[i];
        var split = grouped[s];
        db.push(split);
      }
      // console.log(db);
      this.data = db;
      this.paginatedItems = this.data;
      this.totalRows = this.data.length;
      this.paginate(this.perPage, 0);
    },

    paginate(page_size, page_number) {
      let itemsToParse = this.data;
      this.paginatedItems = itemsToParse.slice(
        page_number * page_size,
        (page_number + 1) * page_size
      );
    },
    onPageChanged(page) {
      this.paginate(this.perPage, page - 1);
    },
  },
};
</script>

<style lang="scss" scoped>
.card {
  box-shadow: none;
}
#row-img {
  height: 240px;
  max-height: 240px;
  .col-img img {
    max-height: 120px; /* height of container */
    object-fit: cover;
    object-position: 20% 10%; /* try 20px 10px */
    transition: 0.6s;
    border-radius: 4px;
  }
}

.card-title {
  font-style: normal;
  font-weight: 600;
  font-size: 20px;
  text-transform: capitalize;
  line-height: 140%;
  letter-spacing: 0.01em;
  color: #121527;
}

.card-text {
  text-transform: capitalize;
  font-style: normal;
  font-weight: normal;
  font-size: 16px;
  line-height: 140%;
  letter-spacing: 0.01em;
  color: #757682;
}

.card-link {
  text-transform: capitalize;
  text-align: left;
  font-style: normal;
  font-weight: 600;
  font-size: 16px;
  line-height: 24px;
  color: #fd7d24;
}

.card-link:hover {
  color: #8b4c1e;
}
</style>
