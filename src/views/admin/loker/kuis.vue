<template>
  <div class="dash">
    <Header :title="title" :items="items"></Header>
    <b-card>
      <b-tabs content-class="mt-3" fill>
        <b-tab title="List Pertanyaan" active> </b-tab>
        <b-tab title="Tambah Pertanyaan"> </b-tab>
      </b-tabs>
    </b-card>
  </div>
</template>

<script>
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
    Header,
  },
};
</script>

<style lang="scss" scoped></style>
