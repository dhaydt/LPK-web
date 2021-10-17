<template>
  <div class="testimoni">
    <Header :title="title" :items="items"></Header>
    <b-card>
      <b-tabs content-class="mt-3" fill>
        <b-tab title="Testimoni" active>
          <ListTesti></ListTesti>
        </b-tab>
        <b-tab title="Tambah data">
          <AddTesti></AddTesti>
        </b-tab>
      </b-tabs>
    </b-card>
  </div>
</template>

<script>
import AddTesti from "./addTesti";
import ListTesti from "./listTesti";
import Header from "../../../components/admin/partials/page-header.vue";
export default {
  data() {
    return {
      title: "Testimoni",
      items: [
        {
          text: "Testimoni",
          active: true,
        },
      ],
    };
  },
  components: {
    AddTesti,
    ListTesti,
    Header,
  },
};
</script>

<style lang="scss" scoped></style>
