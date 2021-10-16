<template>
  <div class="legalitas">
    <Header :title="title" :items="items"></Header>
    <b-card>
      <b-tabs content-class="mt-3" fill>
        <b-tab title="Legalitas" active>
          <ListLegal></ListLegal>
        </b-tab>
        <b-tab title="Tambah Data">
          <b-container>
            <AddLegal></AddLegal>
          </b-container>
        </b-tab>
      </b-tabs>
    </b-card>
  </div>
</template>

<script>
import ListLegal from "./legalitas/listLegal";
import AddLegal from "./legalitas/addLegal";
import Header from "../../../components/admin/partials/page-header.vue";
export default {
  data() {
    return {
      title: "Legaslitas",
      items: [
        {
          text: "About",
          href: "/admin/about",
        },
        {
          text: "Legalitas",
          active: true,
        },
      ],
    };
  },
  components: {
    ListLegal,
    AddLegal,
    Header,
  },
};
</script>

<style lang="scss" scoped></style>
