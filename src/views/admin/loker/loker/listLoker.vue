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
          <template v-slot:cell(deskripsi)="data">
            <span v-html="data.item.deskripsi"></span>
          </template>

          <template v-slot:cell(kualifikasi)="data">
            <span v-html="data.item.kualifikasi"></span>
          </template>

          <template v-slot:cell(deadline)="data">
            <p>{{ data.item.deadline | moment("MMMM Do YYYY") }}</p>
          </template>

          <template v-slot:cell(jenis)="data">
            <span
              class="no-border d-block mb-2"
              style="min-width: 100px"
              v-for="jen in JSON.parse(data.item.jenis)"
              :key="jen"
            >
              {{ jen }}
            </span>
          </template>
          <template v-slot:cell(action)="data" class="d-flex">
            <div class="actions" style="min-width: 100px">
              <a
                v-b-tooltip.hover
                title="Edit User"
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
          <b-form-group id="input-group-1" label="Judul" label-for="input-1">
            <b-form-input
              id="input-1"
              v-model="editData.judul"
              type="text"
              required
            ></b-form-input>
          </b-form-group>

          <b-form-group
            id="input-groups-1"
            label="Kriteria"
            label-for="input-11"
          >
            <b-form-input
              id="input-11"
              v-model="editData.kriteria"
              type="text"
              required
            ></b-form-input>
          </b-form-group>

          <b-form-group
            id="input-groupss-1"
            label="Deskripsi"
            label-for="iinput-11"
          >
            <ckeditor
              v-model="editData.deskripsi"
              :editor="editor"
              required
            ></ckeditor>
          </b-form-group>

          <b-form-group
            id="input-group-11"
            label="Kualifikasi"
            label-for="input-11"
          >
            <ckeditor
              v-model="editData.kualifikasi"
              :editor="editor"
              required
              des
            ></ckeditor> </b-form-group
          ><b-form-group
            id="input-group-112"
            label="Gaji"
            label-for="input-112"
          >
            <b-form-input
              id="input-112"
              v-model="editData.gaji"
              type="text"
              required
            ></b-form-input> </b-form-group
          ><b-form-group
            id="input-group-113"
            label="Expire"
            label-for="input-113"
          >
            <b-form-datepicker
              id="example-datepicker"
              v-model="editData.deadline"
              placeholder="Batas waktu lamaran"
              class="mb-2"
            ></b-form-datepicker
          ></b-form-group>

          <b-form-group label="Note">
            <b-form-input
              id="input-1121"
              v-model="editData.note"
              type="text"
              required
            ></b-form-input>
          </b-form-group>
          <b-form-group label="Alamat">
            <b-form-input
              v-model="editData.alamat"
              type="text"
              required
            ></b-form-input>
          </b-form-group>
          <b-form-group label="Pengalaman">
            <b-form-input
              v-model="editData.pengalaman"
              type="text"
              required
            ></b-form-input>
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
import CKEditor from "@ckeditor/ckeditor5-vue";
import ClassicEditor from "@ckeditor/ckeditor5-build-classic";
import axios from "axios";

export default {
  data() {
    return {
      editData: {},
      jenis: [
        { text: "Paruh waktu", value: "Paruh waktu" },
        { text: "Penuh waktu", value: "Penuh waktu" },
        { text: "Fresh graduate", value: "Fresh Graduate" },
        { text: "Kontrak", value: "Kontrak" },
      ],
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
        { key: "judul", sortable: true, label: "Judul" },
        { key: "bidang", sortable: true, label: "Bidang" },
        { key: "kriteria", sortable: true, label: "Kriteria" },
        { key: "deskripsi", sortable: true, label: "Deskripsi" },
        { key: "kualifikasi", sortable: true, label: "Kualifikasi" },
        { key: "jenis", sortable: true, label: "Jenis" },
        { key: "gaji", sortable: true, label: "Gaji" },
        { key: "note", sortable: true, label: "Note" },
        { key: "deadline", sortable: true, label: "Deadline" },
        { key: "alamat", sortable: true, label: "Alamat" },
        { key: "pengalaman", sortable: true, label: "Pengalaman" },
        { key: "action" },
      ],
      visiUrl: "",
      editor: ClassicEditor,
      loading: "",
      dismissSecs: 5,
      dismissCountDown: 0,
      messages: "",
    };
  },

  components: {
    ckeditor: CKEditor.component,
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
    this.visiUrl = mainUrl + "/loker";
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
