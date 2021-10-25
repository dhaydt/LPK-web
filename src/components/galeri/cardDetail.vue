<template>
  <div class="lokerCard">
    <b-container fluid>
      <b-row cols="3" class="px-5 pt-0 mb-4" id="itemList">
        <b-col v-for="lok in paginatedItems" :key="lok.id" class="mt-5">
          <b-card
            :sub-title="lok.title"
            :img-src="imgUrl + lok.img"
            img-top
            class=""
            no-body
          >
            <b-card-title class="p-4">{{ lok.title }}</b-card-title>
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
export default {
  props: {
    images: {
      type: [Array, Object],
      required: true,
    },
  },
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
    const mainUrl = localStorage.getItem("apiUrl");
    this.lokerUrl = mainUrl + "/loker";
    this.imgUrl = mainUrl + "/images/galeri/";
  },
  mounted() {
    this.getLoker();
    console.log("img", this.images);

    console.log("loker", this.lokers);
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
    getLoker() {
      this.lokers = this.images;
      this.paginatedItems = this.lokers;
      this.totalRows = this.lokers.length;
      this.paginate(this.perPage, 0);
    },
  },
};
</script>

<style lang="scss" scoped>
.lokerCard {
}

.card {
  background: #ffffff;
  border: 1px solid #e8eaed;
  box-sizing: border-box;
  box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.04), 0px 2px 6px rgba(0, 0, 0, 0.04),
    0px 0px 1px rgba(0, 0, 0, 0.04);
  border-radius: 8px;
  min-height: 254px;
  .card-img-top {
    height: 240px;
    width: 356px;
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
