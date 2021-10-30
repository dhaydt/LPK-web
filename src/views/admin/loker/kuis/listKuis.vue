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
          <template v-slot:cell(responses)="data">
            <p v-for="(r, i) in JSON.parse(data.item.responses)" :key="i">
              {{ r.text }}
            </p>
          </template>
          <template v-slot:cell(action)="data" class="d-flex">
            <div class="actions" style="min-width: 100px">
              <a
                v-b-tooltip.hover
                title="Edit Status pertanyaan"
                href="javascript:void(0);"
                class="mr-2"
                @click="edit(data.item)"
              >
                <i class="fas fa-edit"></i>
              </a>
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
            </div>
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

      <b-modal ref="users" id="users" hide-footer title="Edit Data">
        <div class="d-block text-left">
          <b-form-group
            id="input-group-1"
            label="Status pertanyaan"
            label-for="input-1"
          >
            <b-form-select
              v-model="editData.status"
              :options="status"
              required
            ></b-form-select>
          </b-form-group>
        </div>
        <!-- <b-button class="mt-3" variant="outline-danger" block @click="hideModal">Close Me</b-button> -->
        <b-button
          class="mt-4"
          variant="outline-success"
          block
          @click="SaveUsers"
          >Simpan</b-button
        >
      </b-modal>
    </b-card>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      editData: {},
      tableData: [],
      totalRows: 1,
      status: [
        { value: null, text: "Pilih status pertanyaan" },
        { value: "on", text: "Aktif" },
        { value: "off", text: "Non Aktif" },
      ],
      currentPage: 1,
      perPage: 10,
      pageOptions: [10, 25, 50, 100],
      filter: null,
      filterOn: [],
      sortBy: "id",
      sortDesc: false,
      fields: [
        { key: "id", sortable: true, label: "ID" },
        { key: "text", sortable: true, label: "Pertanyaan" },
        { key: "responses", sortable: true, label: "Pilihan" },
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
    this.$root.$on("getVisi", this.getVisi);
  },

  created() {
    const mainUrl = localStorage.getItem("apiUrl");
    this.visiUrl = mainUrl + "/kuis";
    this.getVisi();
  },

  methods: {
    async SaveUsers() {
      await axios
        .put(this.visiUrl + "/" + this.editData.id, this.editData)
        .then((response) => {
          this.messages = "Data berhasil diubah";
          this.getVisi();
          this.showAlert();
          console.log("data", response);
          this.$refs["users"].hide();
          // this.loading = false;
        })
        .catch((error) => {
          console.log(error);
        });

      // .finally(() => this.loading = false)
    },

    edit(val) {
      console.log(val);
      this.editData = val;
      this.$refs["users"].show();
    },
    async getVisi() {
      const resp = await axios
        .get(this.visiUrl)
        .catch((error) => console.log(error));
      const data = resp.data.data;
      console.log(data);
      this.tableData = resp.data.data;
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
