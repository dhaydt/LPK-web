<template>
  <div class="listVisi">
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
          striped
          responsive="md"
          :per-page="perPage"
          :current-page="currentPage"
          :sort-by.sync="sortBy"
          :sort-desc.sync="sortDesc"
          :filter="filter"
          :filter-included-fields="filterOn"
          @filtered="onFiltered"
        >
          <template v-slot:cell(options)="data">
            <span
              class="no-border d-block mb-2"
              style="min-width: 100px"
              v-for="jen in JSON.parse(data.item.options)"
              :key="jen"
            >
              {{ jen }}
            </span>
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
              @click="deleteVisi(data.item.id)"
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
        { key: "time", sortable: true, label: "Waktu (S)" },
        { key: "status", sortable: true, label: "Status" },
        { key: "action" },
      ],
      visiUrl: "",
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
    this.$root.$on("getTime", this.getVisi);
  },

  created() {
    const mainUrl = localStorage.getItem("apiUrl");
    this.visiUrl = mainUrl + "/kuisTime";
    this.getVisi();
  },

  methods: {
    async getVisi() {
      const resp = await axios
        .get(this.visiUrl)
        .catch((error) => console.log(error));
      this.tableData = resp.data.data;
      console.log(resp.data.data);
    },

    async deleteVisi(id) {
      this.loading = true;
      console.log(id);
      try {
        await axios.delete(this.visiUrl + `/${id}`);
        this.messages = "Data terhapus";
        this.getVisi();
        this.showAlert();
        this.loading = false;
      } catch (err) {
        console.log(err);
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
};
</script>

<style lang="scss" scoped></style>
