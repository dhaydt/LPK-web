<template>
  <div class="dash">
    <Header :title="title" :items="items"></Header>
    <b-card>
      <b-tabs content-class="mt-3" fill>
        <b-tab title="Kopdar Alumni" active>
          <ListKopdar></ListKopdar>
        </b-tab>
        <b-tab title="Tambah data">
          <AddKopdar></AddKopdar>
        </b-tab>
      </b-tabs>
    </b-card>
  </div>
</template>

<script>
import AddKopdar from "./kopdar/addKopdar";
import ListKopdar from "./kopdar/listKopdar";
import Header from "../../../components/admin/partials/page-header.vue";
export default {
  data() {
    return {
      title: "Kopdar Alumni",
      items: [
        {
          text: "Gallery",
          href: "/admin/images",
        },
        {
          text: "Kopdar Alumni",
          active: true,
        },
      ],
    };
  },
  components: {
    AddKopdar,
    ListKopdar,
    Header,
  },
};
</script>

<style lang="scss" scoped></style>
