<template>
  <div class="lisLiputan">
    <b-card>
      <div class="row my-4">
        <div class="col-sm-12 col-md-6 d-flex justify-content-start">
          <div id="tickets-table_length" class="dataTables_length">
            <label class="d-inline-flex align-items-center">
              Show&nbsp;
              <b-form-select
                v-model="perPage"
                size="sm"
                :options="pageOptions"
              ></b-form-select
              >&nbsp;entries
            </label>
          </div>
        </div>
        <!-- Search -->
        <div class="col-sm-12 col-md-6 d-flex justify-content-end">
          <div
            id="tickets-table_filter"
            class="dataTables_filter text-md-right"
          >
            <label class="d-inline-flex align-items-center">
              Search:
              <b-form-input
                v-model="filter"
                type="search"
                placeholder="Search..."
                class="form-control form-control-sm ml-2"
              ></b-form-input>
            </label>
          </div>
        </div>
        <!-- End search -->
      </div>
      <b-alert
        :show="dismissCountDown"
        dismissible
        variant="success"
        @dismissed="dismissCountDown = 0"
        @dismiss-count-down="countDownChanged"
      >
        <p>{{ messages }}</p>
        <b-progress
          variant="warning"
          :max="dismissSecs"
          :value="dismissCountDown"
          height="4px"
        ></b-progress>
      </b-alert>
      <!-- Table -->
      <div class="table-responsive mb-0">
        <b-table
          :items="tableData"
          :fields="fields"
          responsive="sm"
          :per-page="perPage"
          :current-page="currentPage"
          :sort-by.sync="sortBy"
          :sort-desc.sync="sortDesc"
          :filter="filter"
          :filter-included-fields="filterOn"
          @filtered="onFiltered"
        >
          <template v-slot:cell(date)="data">
            <p>{{ data.item.date | moment("MMMM Do YYYY") }}</p>
          </template>
          <template v-slot:cell(content)="data">
            <p v-html="data.item.content"></p>
          </template>

          <template v-slot:cell(img)="data">
            <b-img-lazy :src="imgUrl + data.item.img" height="50"></b-img-lazy>
          </template>
          <template v-slot:cell(action)="data" class="d-flex">
            <!-- <a
              href="javascript:void(0);"
              class="mr-3 text-primary"
              v-b-tooltip.hover
              data-toggle="tooltip"
              title="Edit"
            >
              <i class="mdi mdi-pencil font-size-18"></i>
            </a> -->
            <a
              href="javascript:void(0);"
              class="text-danger"
              v-b-tooltip.hover
              title="Delete"
              @click="deleteVisi(data.item.img)"
            >
              <b-spinner v-if="loading" small variant="primary"></b-spinner>
              <i v-if="!loading" class="mdi mdi-trash-can font-size-18"></i>
            </a>
          </template>
        </b-table>
      </div>
      <div class="row">
        <div class="col">
          <div class="dataTables_paginate paging_simple_numbers float-right">
            <ul class="pagination pagination-rounded mb-0">
              <!-- pagination -->
              <b-pagination
                v-model="currentPage"
                :total-rows="rows"
                :per-page="perPage"
              ></b-pagination>
            </ul>
          </div>
        </div>
      </div>
    </b-card>
  </div>
</template>

<script>
import axios from "axios";
import "vue-moment";

export default {
  data() {
    return {
      tableData: [],
      totalRows: 1,
      currentPage: 1,
      perPage: 10,
      pageOptions: [10, 25, 50, 100],
      filter: null,
      filterOn: [],
      sortBy: "id",
      sortDesc: false,
      fields: [
        { key: "id", sortable: true, label: "ID" },
        { key: "title", sortable: true, label: "Judul" },
        { key: "subtitle", sortable: true, label: "Sub judul" },
        { key: "date", sortable: true, label: "Tanggal" },
        { key: "content", sortable: true, label: "Konten" },
        { key: "img", label: "Foto" },
        { key: "action" },
      ],
      visiUrl: "",
      imgUrl: "",
      loading: "",
      dismissSecs: 5,
      dismissCountDown: 0,
      messages: "",
    };
  },

  computed: {
    /**
     * Total no. of records
     */
    rows() {
      return this.tableData.length;
    },
  },

  mounted() {
    // Set the initial number of items
    this.totalRows = this.tableData.length;
    this.$root.$on("getImg", this.getLegal);
  },

  created() {
    const mainUrl = localStorage.getItem("apiUrl");
    this.visiUrl = mainUrl + "/liputan";
    this.imgUrl = mainUrl + "/images/liputan/";
    this.getLegal();
  },

  methods: {
    async getLegal() {
      const resp = await axios
        .get(this.visiUrl)
        .catch((error) => console.log(error));
      this.tableData = resp.data.data;
    },

    async deleteVisi(img) {
      this.loading = true;
      console.log(img);
      try {
        await axios.delete(this.visiUrl + `/${img}`);
        this.messages = "Data terhapus";
        this.getLegal();
        this.showAlert();
        this.loading = false;
      } catch (err) {
        console.log(err);
        this.loading = false;
      }
    },

    countDownChanged(dismissCountDown) {
      this.dismissCountDown = dismissCountDown;
    },
    showAlert() {
      this.dismissCountDown = this.dismissSecs;
    },

    onFiltered(filteredItems) {
      // Trigger pagination to update the number of buttons/pages due to filtering
      this.totalRows = filteredItems.length;
      this.currentPage = 1;
    },
  },
  // filters: {
  //   moment: function(date) {
  //     return moment(date).format("MMMM Do YYYY, h:mm:ss a");
  //   },
  // },
};
</script>

<style lang="scss" scoped></style>
