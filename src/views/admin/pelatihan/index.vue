<template>
  <div class="pelatihan">
    <Header :title="title" :items="items"></Header>
    <b-card>
      <b-tabs content-class="mt-3" fill>
        <b-tab title="Galeri" active>
          <ListPelatihan></ListPelatihan>
        </b-tab>
        <b-tab title="Tambah data">
          <AddPelatihan></AddPelatihan>
        </b-tab>
      </b-tabs>
    </b-card>
  </div>
</template>

<script>
import AddPelatihan from "./addPelatihan";
import ListPelatihan from "./listPelatihan";
import Header from "../../../components/admin/partials/page-header.vue";
export default {
  data() {
    return {
      title: "Pelatihan",
      items: [
        {
          text: "Pelatihan",
          active: true,
        },
      ],
    };
  },
  components: {
    AddPelatihan,
    ListPelatihan,
    Header,
  },
};
</script>

<style lang="scss" scoped></style>
