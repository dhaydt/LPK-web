<template>
  <div class="lokerCard">
    <b-container fluid>
      <h1>Liputan Media</h1>
      <b-row cols="1" cols-md="3" class="px-5 pt-0 mb-4" id="itemList">
        <b-col v-for="lok in paginatedItems" :key="lok.id" class="mt-5">
          <b-card img-top no-body>
            <b-img-lazy :src="imgUrl + lok.img" v-if="lok.img" height="300px"></b-img-lazy>
             <div v-if="lok.video" class="pt-4 video">
                <b-embed
                  type="iframe"
                  aspect="21by9"
                  allowfullscreen
                  :src="imgUrl + lok.video"
                ></b-embed>
              </div>
             <div class="youtube-vid w-100 pt-4" v-if="lok.youtube">

        <LazyYoutube
          ref="vimeoLazyVideo"
          :src="lok.youtube"
          
          aspect-ratio="21:12"
          thumbnail-quality="medium"
        /> </div>
            <b-card-title class="px-4 pt-4"
              ><h5>{{ lok.title }}</h5></b-card-title
            >
            <b-row
              class="flex-column justify-content-between px-4 h-100 pb-4"
              no-gutters
            >
              <div class="location d-flex">
                <b-card-text>{{
                  lok.date | moment("DD MMMM YYYY")
                }}</b-card-text>
              </div>

              <div class="detail text-left">
                <router-link :to="'/liputan/' + lok.id" class="card-link"
                  >Selengkapnya -></router-link
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
      imgUrl: "",
    };
  },

  computed: {
    rows() {
      return this.lokers.length;
    },
  },

  created() {
    window.scrollTo(0, 0);
    const mainUrl = localStorage.getItem("apiUrl");
    this.lokerUrl = mainUrl + "/liputan";
    this.imgUrl = mainUrl + "/images/liputan/";
    this.getLoker();
  },

  methods: {
    paginate(page_size, page_number) {
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
.lokerCard {
  // margin-top: 20px;
}

.container-fluid h1 {
  font-style: normal;
  font-weight: 600;
  font-size: 32px;
  line-height: 140%;
  letter-spacing: 0.5px;
  color: #2e3e5c;
}

.card {
  background: #ffffff;
  border: 1px solid #e8eaed;
  box-sizing: border-box;
  box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.04), 0px 2px 6px rgba(0, 0, 0, 0.04),
    0px 0px 1px rgba(0, 0, 0, 0.04);
  border-radius: 8px;
  height: 436px;
  .card-img-top {
    height: 256px;
  }
}

.card-title {
  max-height: 60px;
  h5 {
    font-weight: 600;
    font-size: 16px;
    text-align: left;
    // line-height: 2;
    letter-spacing: 0.5px;
    color: #2e3e5c;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-overflow: ellipsis;
  }
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
  font-weight: normal;
  font-size: 16px;
  color: #757682;
}

.detail {
  margin-top: 10px;
}

.card-link {
  text-align: left;
  font-style: normal;
  font-weight: 600;
  font-size: 16px;
  line-height: 140%;
  color: #fd7d24;
}

.card-link:hover {
  color: #8b4c1e;
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
