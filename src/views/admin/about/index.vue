<template>
  <div class="visimisi">
    <Header :title="title" :items="items"></Header>
    <b-card>
      <b-tabs content-class="mt-3" fill>
        <b-tab title="Visi / Misi" active>
          <ListVisi></ListVisi>
        </b-tab>
        <b-tab title="Tambah Visi / Misi">
          <AddVisi></AddVisi>
        </b-tab>
      </b-tabs>
    </b-card>
  </div>
</template>

<script>
import AddVisi from "./visi/addVisi";
import ListVisi from "./visi/listVisi";
import Header from "../../../components/admin/partials/page-header.vue";

export default {
  data() {
    return {
      title: "Visi Misi",
      items: [
        {
          text: "About",
        },
        {
          text: "Visi Misi",
          active: true,
        },
      ],
    };
  },

  components: {
    AddVisi,
    ListVisi,
    Header,
  },
};
</script>

<style lang="scss" scoped></style>
