<template>
  <div class="dash">
    <Header :title="title" :items="items"></Header>
    <b-card>
      <b-tabs content-class="mt-3" fill>
        <b-tab title="Cabang" active>
          <ListCabang></ListCabang>
        </b-tab>
        <b-tab title="Tambah Data">
          <b-container>
            <AddCabang></AddCabang>
          </b-container>
        </b-tab>
      </b-tabs>
    </b-card>
  </div>
</template>

<script>
import AddCabang from "./cabang/addCabang";
import ListCabang from "./cabang/listCabang";
import Header from "../../../components/admin/partials/page-header.vue";
export default {
  data() {
    return {
      title: "Cabang",
      items: [
        {
          text: "About",
          href: "/admin/about",
        },
        {
          text: "Cabang",
          active: true,
        },
      ],
    };
  },
  components: {
    AddCabang,
    ListCabang,
    Header,
  },
};
</script>

<style lang="scss" scoped></style>
