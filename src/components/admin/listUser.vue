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
          responsive="sm"
          :per-page="perPage"
          :current-page="currentPage"
          :sort-by.sync="sortBy"
          :sort-desc.sync="sortDesc"
          :filter="filter"
          :filter-included-fields="filterOn"
          @filtered="onFiltered"
        >
          <template v-slot:cell(action)="data">
            <div class="actions" style="min-width: 100px">
              <a
                v-b-tooltip.hover
                title="Edit User"
                href="javascript:void(0);"
                class="mr-2"
                @click="edit(data.item)"
              >
                <i class="fas fa-user-edit"></i>
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

      <b-modal
        ref="users"
        id="users"
        hide-footer
        :title="`Edit ` + editData.nama_depan"
      >
        <div class="d-block text-left">
          <b-form-group
            id="input-group-1"
            label="Nama depan"
            label-for="input-1"
          >
            <b-form-input
              id="input-1"
              v-model="editData.nama_depan"
              type="text"
              required
            ></b-form-input>
          </b-form-group>

          <b-form-group
            id="input-group-11"
            label="Nama belakang"
            label-for="input-11"
          >
            <b-form-input
              id="input-11"
              v-model="editData.nama_bel"
              type="text"
              required
            ></b-form-input>
          </b-form-group>

          <b-form-group id="input-group-2" label="Email" label-for="input-2">
            <b-form-input
              id="input-2"
              v-model="editData.email"
              type="email"
              required
            ></b-form-input>
          </b-form-group>

          <b-form-group
            id="input-group-25"
            label="Password"
            label-for="input-25"
          >
            <b-form-input
              id="input-25"
              v-model="editData.new_password"
              type="email"
              placeholder="Tidak diganti"
              required
            ></b-form-input>
          </b-form-group>

          <b-form-group
            id="input-group-22"
            label="Telepon"
            label-for="input-22"
          >
            <b-form-input
              id="input-22"
              v-model="editData.telp"
              type="text"
              required
            ></b-form-input>
          </b-form-group>

          <b-form-group id="input-group-23" label="Alamat" label-for="input-23">
            <b-form-input
              id="input-23"
              v-model="editData.alamat"
              type="text"
              required
            ></b-form-input>
          </b-form-group>

          <b-form-group id="input-group-3" label="Role" label-for="input-3">
            <b-form-select
              id="input-3"
              v-model="editData.role"
              :options="role"
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
      role: [
        { text: "Pilih Role User", value: "null" },
        { text: "Admin", value: "admin" },
        { text: "HRD", value: "hrd" },
        { text: "Staff", value: "staff" },
      ],
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
        { key: "nama_depan", sortable: true, label: "Nama" },
        { key: "email", sortable: true, label: "Email" },
        { key: "telp", sortable: true, label: "Telepon" },
        { key: "alamat", sortable: true, label: "Alamat" },
        // { key: "password", sortable: true, label: "Password" },
        { key: "role", sortable: true, label: "Role" },
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
    this.visiUrl = mainUrl + "/users";
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
          this.getVisi();
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
