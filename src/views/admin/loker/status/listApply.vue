<template>
  <div class="listApply">
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
          striped
          :items="tableData"
          :fields="fields"
          responsive="md"
          :per-page="perPage"
          :current-page="currentPage"
          :sort-by.sync="sortBy"
          :sort-desc.sync="sortDesc"
          :filter="filter"
          :filter-included-fields="filterOn"
          @filtered="onFiltered"
        >
          <template v-slot:cell(portfolio)="data">
            <a
              :href="pdfUrl + data.item.portfolio"
              target="_blank"
              v-b-tooltip.hover
              title="Lihat Portfolio"
              ><i class="fas fa-eye"></i> Portfolio</a
            >
          </template>

          <template v-slot:cell(notifikasi)="data" class="d-flex">
            <div class="actions" style="min-width: 50px">
              <a
                :href="
                  `https://wa.me/62${data.item.wa}?text=${notif.pembuka}%20${data.item.nama}%2C%0A${notif.proses}`
                "
                target="_blank"
                v-if="data.item.status === 'Proses ADM'"
              >
                <b-badge
                  variant="primary"
                  size="md"
                  v-b-tooltip.hover
                  title="Kirim Notifikasi Proses ADM"
                  class="ml-2 btn"
                  style="text-transform: capitalize; padding: 8px; border-radius: 50%;"
                >
                  <i class="fab fa-whatsapp"></i>
                </b-badge>
              </a>
              <a
                :href="
                  `https://wa.me/62${data.item.wa}?text=${notif.pembuka}%20${data.item.nama}%2C%0A${notif.interview}`
                "
                target="_blank"
                v-if="data.item.status === 'Interview'"
              >
                <b-badge
                  variant="warning"
                  size="md"
                  v-b-tooltip.hover
                  title="Kirim Notifikasi Interview"
                  class="ml-2 btn"
                  style="text-transform: capitalize; padding: 8px; border-radius: 50%;"
                >
                  <i class="fab fa-whatsapp"></i>
                </b-badge>
              </a>
              <a
                :href="
                  `https://wa.me/62${data.item.wa}?text=${notif.pembuka}%20${data.item.nama}%2C%0A${notif.pengumuman}`
                "
                target="_blank"
                v-if="data.item.status === 'Pengumuman'"
              >
                <b-badge
                  variant="success"
                  size="md"
                  v-b-tooltip.hover
                  title="Kirim Notifikasi Pengumuman"
                  class="ml-2 btn"
                  style="text-transform: capitalize; padding: 8px; border-radius: 50%;"
                >
                  <i class="fab fa-whatsapp"></i>
                </b-badge>
              </a>
            </div>
          </template>
          <template v-slot:cell(action)="data" class="d-flex">
            <div class="actions" style="min-width: 100px">
              <router-link
                :to="{ name: 'ViewApply', params: data.item }"
                v-b-tooltip.hover
                title="Lihat Biodata"
              >
                <i class="fas fa-eye font-size-18"></i>
              </router-link>
              <a
                href="javascript:void(0);"
                class="text-danger ml-2"
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
    </b-card>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      waText: `selamat \${data.item.name}`,
      tableData: [],
      linkWA: "https://wa.me",
      totalRows: 1,
      currentPage: 1,
      perPage: 10,
      pageOptions: [10, 25, 50, 100],
      filter: null,
      filterOn: [],
      notif: {},
      sortBy: "id",
      sortDesc: false,
      fields: [
        { key: "id", sortable: true, label: "ID" },
        { key: "nama", sortable: true, label: "Nama" },
        { key: "provinsi", sortable: true, label: "Provinsi" },
        { key: "pendidikan", sortable: true, label: "Pendidikan" },
        { key: "agama", sortable: true, label: "Agama" },
        { key: "nilai", sortable: true, label: "Nilai Kuis" },
        { key: "portfolio", sortable: true, label: "Portfolio" },
        { key: "judul", sortable: true, label: "Loker" },
        { key: "status", sortable: true, label: "status" },
        { key: "Notifikasi" },
        { key: "action" },
      ],
      visiUrl: "",
      notifUrl: "",
      loading: "",
      pdfUrl: "",
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
    this.visiUrl = mainUrl + "/apply";
    this.pdfUrl = mainUrl + "/documents/apply/";
    this.notifUrl = mainUrl + "/notif";
    this.getVisi();
  },

  methods: {
    async getVisi() {
      const resp = await axios
        .get(this.visiUrl)
        .catch((error) => console.log(error));
      this.tableData = resp.data.data;
      console.log(resp.data.data);
      this.getNotif();
    },
    async getNotif() {
      const resp = await axios.get(this.notifUrl);
      this.notif = resp.data.data[0];
      console.log(this.notif);
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
