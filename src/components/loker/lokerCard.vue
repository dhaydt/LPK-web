<template>
  <div class="lokerCard">
    <b-container fluid>
      <b-row
        cols-md="4"
        cols-sm="1"
        class="px-5 pt-0 mb-4"
        id="itemList"
        v-if="search"
      >
        <div v-if="!filteredList.length" class="w-100 mx-auto not-found">
          Tidak ada data ditemukan
        </div>
        <div v-for="lok in filteredList" :key="lok.id" class="mt-5 col">
          <b-card :sub-title="lok.kriteria" class="inner-border h-100" no-body>
            <b-card-title class="px-4 pt-4">{{ lok.judul }}</b-card-title>
            <div class="card-subtitle px-4 mt-0" style="min-height: 80px">
              {{ lok.kriteria }}
            </div>
            <b-row
              class="flex-column justify-content-between px-4 h-100 pb-4"
              no-gutters
            >
              <div class="location d-flex mt-3">
                <i class="fas fa-map-marker-alt mr-2"></i
                ><b-card-text>{{ lok.alamat }}</b-card-text>
              </div>

              <div class="location d-flex mt-3">
                <i class="fas fa-briefcase mr-2"></i
                ><b-card-text>{{ lok.pengalaman }}</b-card-text>
              </div>

              <div class="detail text-left">
                <router-link :to="'/loker/' + lok.id" class="card-link"
                  >Lihat detail ></router-link
                >
              </div>
            </b-row>
          </b-card>
        </div>
      </b-row>
      <b-row
        cols-md="4"
        cols-sm="1"
        class="px-5 pt-0 mb-4"
        id="itemList"
        v-if="!search"
      >
        <div v-for="lok in paginatedItems" :key="lok.id" class="mt-5 col">
          <b-card :sub-title="lok.kriteria" class="inner-border h-100" no-body>
            <b-card-title class="px-4 pt-4">{{ lok.judul }}</b-card-title>
            <div class="card-subtitle px-4 mt-0" style="min-height: 80px">
              {{ lok.kriteria }}
            </div>
            <b-row
              class="flex-column justify-content-between px-4 h-100 pb-4"
              no-gutters
            >
              <div class="location d-flex mt-3">
                <i class="fas fa-map-marker-alt mr-2"></i
                ><b-card-text>{{ lok.alamat }}</b-card-text>
              </div>

              <div class="location d-flex mt-3">
                <i class="fas fa-briefcase mr-2"></i
                ><b-card-text>{{ lok.pengalaman }}</b-card-text>
              </div>

              <div class="detail text-left">
                <router-link :to="'/loker/' + lok.id" class="card-link"
                  >Lihat detail ></router-link
                >
              </div>
            </b-row>
          </b-card>
        </div>
      </b-row>
      <b-row class="justify-content-center" v-if="!search">
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
    </b-container>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      lokers: [],
      currentPage: 1,
      perPage: 12,
      totalRows: "",
      paginatedItems: [],
      lokerUrl: "",
      search: "",
    };
  },

  computed: {
    rows() {
      return this.lokers.length;
    },

    filteredList() {
      return this.lokers.filter((post) => {
        return post.judul.toLowerCase().includes(this.search.toLowerCase());
      });
    },
  },

  mounted() {
    this.$root.$on("find", this.find);
  },

  created() {
    const mainUrl = localStorage.getItem("apiUrl");
    this.lokerUrl = mainUrl + "/loker";
    this.getLoker();
  },

  methods: {
    find(val) {
      this.search = val;
    },
    paginate(page_size, page_number) {
      console.log("called");
      let itemsToParse = this.lokers;
      this.paginatedItems = itemsToParse.slice(
        page_number * page_size,
        (page_number + 1) * page_size
      );
    },
    onPageChanged(page) {
      this.paginate(this.perPage, page - 1);
    },
    async getLoker() {
      const resp = await axios.get(this.lokerUrl);
      this.lokers = resp.data.data;
      this.paginatedItems = this.lokers;
      this.totalRows = this.lokers.length;
      // console.log(resp.data.data);
      this.paginate(this.perPage, 0);
    },
  },
};
</script>

<style lang="scss" scoped>
.not-found {
  font-style: normal;
  font-weight: bold;
  font-size: 20px;
  line-height: 28px;
  text-transform: capitalize;
  color: #999e9b;
}

.lokerCard {
  margin-top: 60px;
}

.card {
  background: #ffffff;
  border: 1px solid #e8eaed;
  box-sizing: border-box;
  box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.04), 0px 2px 6px rgba(0, 0, 0, 0.04),
    0px 0px 1px rgba(0, 0, 0, 0.04);
  border-radius: 8px;
  min-height: 254px;
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

<style lang="scss">
li.page-item:first-child {
  .page-link {
    margin-right: 25px;
    border: none;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 50%;
  }
}

li.page-item.disabled:first-child span span i,
li.page-item.disabled:last-child span span i {
  color: #fff;
}

li.page-item:last-child {
  .page-link {
    border: none;
    margin-left: 25px;
    border-radius: 50%;
  }
}
.page-item.active .page-link {
  width: 32px;
  height: 32px;
  background: linear-gradient(0deg, #07a148, #07a148);
  border-radius: 4px;
}

.page-item .page-link {
  width: 32px;
  height: 32px;
  margin: 0 10px;
  background-color: #fff;
  border: 1px solid #e9e9e9;
  box-sizing: border-box;
  border-radius: 4px;
  text-align: center;
  padding: 0;

  i {
    font-style: normal;
    font-weight: 600;
    font-size: 16px;
    line-height: 1;
    color: #757682;
  }
}

.pagi {
  font-style: normal;
  font-weight: 600;
  font-size: 16px;
  line-height: 1;
  color: #ffffff;
}
</style>
