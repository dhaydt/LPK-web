<template>
  <div class="image">
    <Header :title="title" :items="items"></Header>
    <b-card>
      <b-tabs content-class="mt-3" fill>
        <b-tab title="Galeri" active>
          <ListGaleri></ListGaleri>
        </b-tab>
        <b-tab title="Tambah data">
          <AddGaleri></AddGaleri>
        </b-tab>
      </b-tabs>
    </b-card>
  </div>
</template>

<script>
import AddGaleri from "./galeri/addGaleri";
import ListGaleri from "./galeri/listGaleri";
import Header from "../../../components/admin/partials/page-header.vue";

export default {
  data() {
    return {
      title: "Galeri",
      items: [
        {
          text: "Image",
        },
        {
          text: "Galeri",
          active: true,
        },
      ],
    };
  },

  components: {
    AddGaleri,
    ListGaleri,
    Header,
  },
};
</script>

<style lang="scss" scoped></style>
