<template>
  <div class="lokerCard">
    <CoolLightBox
      :items="items"
      :index="index"
      loop
      @close="index = null"
      :effect="'fade'"
    >
    </CoolLightBox>

    <b-container fluid>
      <b-row
        cols-sm="1"
        cols-md="3"
        class="px-5 pt-0 mb-4 images-wrapper"
        id="itemList"
      >
        <b-col
          v-for="(image, imageIndex) in paginatedItems"
          :key="imageIndex"
          class="mt-5"
        >
          <b-card :sub-title="image.title" no-body>
            <b-img
              class="card-img-top w-100 gal-img"
              :src="imgUrl + image.img"
              :alt="image.title"
              @click="setIndex(imageIndex)"
            ></b-img>
            <b-card-title class="p-4">{{ image.imgTitle }}</b-card-title>
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
      index: null,
      images: [],
      items: [],
      currentPage: 1,
      perPage: 9,
      totalRows: "",
      paginatedItems: [],
      titles: {},
      lokerUrl: "",
      imgUrl: "",
      mainUrl: "",
    };
  },

  components: {},

  computed: {
    rows() {
      return this.lokers.length;
    },
  },

  created() {
    this.mainUrl = localStorage.getItem("apiUrl");
    this.getUrl = this.mainUrl + ("/image/" + this.$route.params.id);
    this.kopdarUrl = this.mainUrl + ("/kopdar/" + this.$route.params.id);
  },
  mounted() {
    var tipe = this.$route.params.tipe;
    if (tipe === "galeri") {
      console.log("galeri");
      this.imgUrl = this.mainUrl + "/images/newGaleri/";
      this.getData();
    } else {
      console.log("kopdar");
      this.imgUrl = this.mainUrl + "/images/kopdar/";
      this.getKopdar();
    }
  },

  methods: {
    setIndex(index) {
      this.index = index;
    },
    async getData() {
      const resp = await axios.get(this.getUrl);
      const data = resp.data.data;
      this.images = data;
      console.log(data);
      this.titles = {
        title: data[0].title,
        desc: data[0].desc,
        date: data[0].date,
      };
      this.$emit("titles", this.titles);
      this.getPaginate();
      this.$root.$emit("titles", data[0].title);
      this.getImg(data);
    },
    async getKopdar() {
      const resp = await axios.get(this.kopdarUrl);
      const data = resp.data.data;
      this.images = data;
      this.titles = {
        title: data[0].title,
        desc: data[0].desc,
        date: data[0].date,
      };
      this.$emit("titles", this.titles);
      this.getPaginate();
      this.$root.$emit("titles", data[0].title);

      this.getImg(data);
    },
    getImg(val) {
      const img = val;
      console.log(val);
      var itemSet = [];
      var newImg = img.map((map) => [map.img, map.imgTitle, map.imgDesc]);
      for (var idx = 0; idx < newImg.length; idx++) {
        var data = {
          src: this.imgUrl + newImg[idx][0],
          title: newImg[idx][1],
          description: newImg[idx][2],
        };
        itemSet.push(data);
      }
      console.log(itemSet);

      this.items = itemSet;
    },
    paginate(page_size, page_number) {
      let itemsToParse = this.images;
      this.paginatedItems = itemsToParse.slice(
        page_number * page_size,
        (page_number + 1) * page_size
      );
    },
    onPageChanged(page) {
      this.paginate(this.perPage, page - 1);
    },
    getPaginate() {
      this.paginatedItems = this.images;
      this.totalRows = this.images.length;
      this.paginate(this.perPage, 0);
    },
  },
};
</script>
<style lang="scss">
.cool-lightbox-caption h6 {
  color: white;
  position: absolute;
  top: -87vh;
  margin-left: 20px;
  text-transform: uppercase;
}
</style>
<style lang="scss" scoped>
.card {
  background: #ffffff;
  border: 1px solid #e8eaed;
  box-sizing: border-box;
  box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.04), 0px 2px 6px rgba(0, 0, 0, 0.04),
    0px 0px 1px rgba(0, 0, 0, 0.04);
  border-radius: 8px;
  min-width: 330px;
  min-height: 254px;
  .card-img-top {
    height: 240px;
    width: 356px;
  }
  .card-img-top:hover {
    cursor: pointer;
  }
}

.card-title {
  font-style: normal;
  font-weight: 600;
  text-align: left;
  font-size: 20px;
  letter-spacing: 0.01em;
  color: #121527;
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
