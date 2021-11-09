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
          striped
          :current-page="currentPage"
          :sort-by.sync="sortBy"
          :sort-desc.sync="sortDesc"
          :filter="filter"
          :filter-included-fields="filterOn"
          @filtered="onFiltered"
        >
          <template v-slot:cell(tag)="data">
            <div
              class="tag"
              v-for="(t, i) in JSON.parse(data.item.tag)"
              :key="i"
            >
              {{ t.text }}
            </div>
          </template>
          <template v-slot:cell(date)="data">
            <p>{{ data.item.date | moment("MMMM Do YYYY") }}</p>
          </template>
          <template v-slot:cell(content)="data">
            <p v-html="data.item.content"></p>
          </template>
          <template v-slot:cell(content2)="data">
            <p v-html="data.item.content2"></p>
          </template>

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
      <b-modal
        ref="users"
        id="users"
        hide-footer
        :title="`Edit ` + editData.title"
      >
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
            id="input-group-11"
            label="Sub judul"
            label-for="input-11"
          >
            <b-form-input
              id="input-11"
              v-model="editData.subtitle"
              type="text"
              required
            ></b-form-input>
          </b-form-group>
          <b-form-group id="input-group-11" label="Quote" label-for="input-11">
            <b-form-input
              id="input-11"
              v-model="editData.quote"
              type="text"
              required
            ></b-form-input>
          </b-form-group>

          <b-form-group id="input-group-2" label="Konten" label-for="input-2">
            <ckeditor
              v-model="editData.content"
              :editor="editor"
              required
            ></ckeditor>
          </b-form-group>

          <b-form-group
            id="input-group-22"
            label="Konten 2"
            label-for="input-22"
          >
            <ckeditor
              v-model="editData.content2"
              :editor="editor"
              required
            ></ckeditor>
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
import CKEditor from "@ckeditor/ckeditor5-vue";
import ClassicEditor from "@ckeditor/ckeditor5-build-classic";

import "vue-moment";

export default {
  data() {
    return {
      editData: {},
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
        // { key: "tag", sortable: true, label: "tag" },
        // { key: "subtitle", sortable: true, label: "Sub judul" },
        { key: "date", sortable: true, label: "Tanggal" },
        // { key: "content", sortable: true, label: "Konten" },
        // { key: "quote", sortable: true, label: "Quote" },
        // { key: "content2", sortable: true, label: "Konten 2" },
        { key: "img", label: "Foto" },
        { key: "action" },
      ],
      visiUrl: "",
      imgUrl: "",
      loading: "",
      dismissSecs: 5,
      dismissCountDown: 0,
      messages: "",
      editor: ClassicEditor,
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
    this.$root.$on("getImg", this.getLegal);
  },

  created() {
    const mainUrl = localStorage.getItem("apiUrl");
    this.visiUrl = mainUrl + "/liputan";
    this.imgUrl = mainUrl + "/images/liputan/";
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
      formData.append("quote", this.editData.quote);
      formData.append("content", this.editData.content);
      formData.append("content2", this.editData.content2);
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
    pushTag() {
      this.editData.tag.push({ text: "" });
    },
    resetTag() {
      this.editData.tag = [{ text: "" }];
    },
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
