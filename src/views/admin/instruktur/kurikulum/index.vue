<template>
  <div class="dash">
    <Header :title="title" :items="items"></Header>
    <b-card>
      <b-tabs content-class="mt-3" fill>
        <b-tab title="Kurikulum" active>
          <Listkuri></Listkuri>
        </b-tab>
        <b-tab title="Tambah data">
          <Addkuri></Addkuri>
        </b-tab>
      </b-tabs>
    </b-card>
  </div>
</template>

<script>
import Addkuri from "./addkuri";
import Listkuri from "./listkuri";
import Header from "../../../../components/admin/partials/page-header";
export default {
  data() {
    return {
      title: "Kurikulum",
      items: [
        {
          text: "Instruktur",
          to: "/admin/instruktur",
        },
        {
          text: "Kurikulum",
          active: true,
        },
      ],
    };
  },
  components: {
    Addkuri,
    Listkuri,
    Header,
  },
};
</script>

<style lang="scss" scoped></style>
