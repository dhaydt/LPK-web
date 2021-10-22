<template>
  <div class="dash">
    <Header :title="title" :items="items"></Header>
    <b-card>
      <b-tabs content-class="mt-3" fill>
        <b-tab title="List Pertanyaan" active>
          <ListKuis></ListKuis>
        </b-tab>
        <b-tab title="Tambah Pertanyaan">
          <AddKuis></AddKuis>
        </b-tab>
      </b-tabs>
    </b-card>
  </div>
</template>

<script>
import AddKuis from "./kuis/addKuis";
import ListKuis from "./kuis/listKuis";
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
    AddKuis,
    ListKuis,
    Header,
  },
};
</script>

<style lang="scss" scoped></style>
