<template>
  <div class="dash">
    <Header :title="title" :items="items"></Header>
    <b-card>
      <b-tabs content-class="mt-3" fill>
        <b-tab title="Instruktur" active>
          <ListInstruktur></ListInstruktur>
        </b-tab>
        <b-tab title="Tambah data">
          <AddInstruktur></AddInstruktur>
        </b-tab>
      </b-tabs>
    </b-card>
  </div>
</template>

<script>
import AddInstruktur from "./addInstruktur";
import ListInstruktur from "./listInstruktur";
import Header from "../../../components/admin/partials/page-header.vue";
export default {
  data() {
    return {
      title: "Instruktur",
      items: [
        {
          text: "Instruktur",
          active: true,
        },
      ],
    };
  },
  components: {
    AddInstruktur,
    ListInstruktur,
    Header,
  },
};
</script>

<style lang="scss" scoped></style>
