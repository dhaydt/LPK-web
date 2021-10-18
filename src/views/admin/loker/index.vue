<template>
  <div class="dash">
    <Header :title="title" :items="items"></Header>
    <b-card>
      <b-tabs content-class="mt-3" fill>
        <b-tab title="Lowongan kerja" active>
          <ListLoker></ListLoker>
        </b-tab>
        <b-tab title="Tambah Loker">
          <AddLoker></AddLoker>
        </b-tab>
      </b-tabs>
    </b-card>
  </div>
</template>

<script>
import AddLoker from "./loker/addLoker";
import ListLoker from "./loker/listLoker";
import Header from "../../../components/admin/partials/page-header.vue";
export default {
  data() {
    return {
      title: "Lowongan kerja",
      items: [
        {
          text: "Loker",
          href: "/admin/loker",
        },
        {
          text: "List",
          active: true,
        },
      ],
    };
  },
  components: {
    AddLoker,
    ListLoker,
    Header,
  },
};
</script>

<style lang="scss" scoped></style>
