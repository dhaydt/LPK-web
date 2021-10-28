<template>
  <div class="dash">
    <Header :title="title" :items="items"></Header>
    <b-card>
      <b-tabs content-class="mt-3" fill>
        <b-tab title="List Struktur" active>
          <ListStruktur></ListStruktur>
        </b-tab>
        <b-tab title="Tambah Data">
          <b-container>
            <AddStruktur></AddStruktur>
          </b-container>
        </b-tab>
      </b-tabs>
    </b-card>
  </div>
</template>

<script>
import AddStruktur from "./struktur/addStruktur";
import ListStruktur from "./struktur/listStruktur";
import Header from "../../../components/admin/partials/page-header.vue";
export default {
  data() {
    return {
      title: "Struktur LPK",
      items: [
        {
          text: "About",
          href: "/admin/about",
        },
        {
          text: "Struktur LPK",
          active: true,
        },
      ],
    };
  },
  components: {
    AddStruktur,
    ListStruktur,
    Header,
  },
};
</script>

<style lang="scss" scoped></style>
