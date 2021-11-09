<template>
  <div class="listPelatihan">
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
          striped
          :per-page="perPage"
          :current-page="currentPage"
          :sort-by.sync="sortBy"
          :sort-desc.sync="sortDesc"
          :filter="filter"
          :filter-included-fields="filterOn"
          @filtered="onFiltered"
        >
          <template v-slot:cell(img)="data">
            <b-img-lazy :src="imgUrl + data.item.img" height="50"></b-img-lazy>
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
                @click="deleteVisi(data.item.img)"
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
              v-model="editData.title"
              type="text"
              required
            ></b-form-input>
          </b-form-group>

          <b-form-group
            id="input-groups-1"
            label="Sub Judul"
            label-for="input-11"
          >
            <b-form-input
              id="input-11"
              v-model="editData.subtitle"
              type="text"
              required
            ></b-form-input>
          </b-form-group>

          <b-form-group
            id="input-groupss-1"
            label="Tempat"
            label-for="iinput-11"
          >
            <b-form-input
              id="iinput-11"
              v-model="editData.tempat"
              type="text"
              required
            ></b-form-input>
          </b-form-group>

          <b-form-group id="input-group-11" label="Jenis" label-for="input-11">
            <b-form-select
              v-model="editData.jenis"
              :options="options"
              required
            ></b-form-select> </b-form-group
          ><b-form-group
            id="input-group-111"
            label="Waktu"
            label-for="input-111"
          >
            <b-form-datepicker
              id="example-datepicker"
              v-model="editData.waktu"
              class="mb-2"
            ></b-form-datepicker></b-form-group
          ><b-form-group
            id="input-group-112"
            label="Waktu Akses"
            label-for="input-112"
          >
            <b-form-input
              id="input-112"
              v-model="editData.akses"
              type="text"
              required
            ></b-form-input> </b-form-group
          ><b-form-group label="URL">
            <b-form-input
              v-model="editData.url"
              type="text"
              placeholder="https://www.facebook.com"
              required
            ></b-form-input> </b-form-group
          ><b-form-group
            id="input-group-113"
            label="Berlaku"
            label-for="input-113"
          >
            <b-form-input
              id="input-113"
              v-model="editData.expire"
              required
            ></b-form-input>
          </b-form-group>

          <b-form-group label="Foto" class="mb-2 mt-4 mr-sm-2 mb-sm-0">
            <b-img
              :src="imgUrl + editData.img"
              alt="editImage"
              height="100"
              class="d-block"
            />
            <label class="mt-2">Ganti Foto</label>
            <b-form-file
              type="file"
              ref="imgEdit"
              @change="onEdit()"
              accept="image/jpeg, image/png, image/gif"
              name="image"
              :required="true"
              id="imageEdit"
            />
          </b-form-group>
        </div>
        <!-- <b-button class="mt-3" variant="outline-danger" block @click="hideModal">Close Me</b-button> -->
        <b-button
          class="mt-4"
          variant="outline-success"
          block
          @click="SaveUsers"
          ><div v-if="loading">
            <b-spinner small variant="primary"></b-spinner> Mengupdate...
          </div>
          <span v-if="!loading"
            ><i class="fa fa-save"></i> Update</span
          ></b-button
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
      options: [
        { value: null, text: "Pilih jenis pelatihan" },
        { value: "offline", text: "Offline" },
        { value: "online", text: "Online" },
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
        { key: "title", sortable: true, label: "Judul" },
        // { key: "url", sortable: true, label: "URL" },
        { key: "jenis", sortable: true, label: "Jenis Pelatihan" },
        // { key: "subtitle", sortable: true, label: "Sub Judul" },
        { key: "img", label: "Foto" },
        { key: "tempat", sortable: true, label: "Tempat" },
        // { key: "waktu", sortable: true, label: "Waktu pelaksanaan" },
        // { key: "akses", sortable: true, label: "Waktu akses" },
        // { key: "expire", sortable: true, label: "Berlaku" },
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
    this.visiUrl = mainUrl + "/pelatihan";
    this.imgUrl = mainUrl + "/images/pelatihan/";
    this.getLegal();
  },

  methods: {
    onEdit() {
      // const allowedTypes = ["image/jpeg", "image/jpg", "image/png"];
      // this.formFields.img = event.target.files[0];
      var files = event.target.files;
      this.editData.img2 = files[0];
      console.log("edit", this.editData);
    },

    async SaveUsers() {
      this.loading = true;
      let formData = new FormData();

      formData.append("title", this.editData.title);
      formData.append("subtitle", this.editData.subtitle);
      formData.append("tempat", this.editData.tempat);
      formData.append("jenis", this.editData.jenis);
      formData.append("waktu", this.editData.waktu);
      formData.append("akses", this.editData.akses);
      formData.append("url", this.editData.url);
      formData.append("expire", this.editData.expire);
      formData.append("img", this.editData.img2);

      await axios
        .put(this.visiUrl + "/" + this.editData.id, formData)
        .then((response) => {
          this.messages = "Data berhasil diubah";
          this.getLegal();
          this.showAlert();
          console.log("data", response);
          this.$refs["users"].hide();
          this.loading = false;
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

    async getLegal() {
      const resp = await axios
        .get(this.visiUrl)
        .catch((error) => console.log(error));
      this.tableData = resp.data.data;
      // console.log(resp.data.data);
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
};
</script>

<style lang="scss" scoped></style>
