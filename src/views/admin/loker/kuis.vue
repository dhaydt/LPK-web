<template>
  <div class="dash">
    <Header :title="title" :items="items"></Header>
    <b-card>
      <b-tabs content-class="mt-3" fill>
        <b-tab title="List Data" active>
          <ListData></ListData>
        </b-tab>
        <b-tab title="Tambah Data">
          <AddData></AddData>
        </b-tab>
      </b-tabs>
    </b-card>
  </div>
</template>

<script>
import AddData from "./kuis/addData";
import ListData from "./kuis/listData";
import Header from "../../../components/admin/partials/page-header.vue";
export default {
  data() {
    return {
      title: "Manajemen Kuis",
      items: [
        {
          text: "Loker",
          to: "/admin/loker",
        },
        {
          text: "Kuis",
          active: true,
        },
      ],
    };
  },
  components: {
    AddData,
    ListData,
    Header,
  },
};
</script>

<style lang="scss" scoped></style>
