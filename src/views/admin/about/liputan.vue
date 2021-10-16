<template>
  <div class="dash">
    <Header :title="title" :items="items"></Header>
    <b-card>
      <b-tabs content-class="mt-3" fill>
        <b-tab title="Liputan Media" active>
          <ListLiputan></ListLiputan>
        </b-tab>
        <b-tab title="Tambah Data">
          <b-container>
            <AddLiputan></AddLiputan>
          </b-container>
        </b-tab>
      </b-tabs>
    </b-card>
  </div>
</template>

<script>
import AddLiputan from "./liputan/addLiputan";
import ListLiputan from "./liputan/listLiputan";
import Header from "../../../components/admin/partials/page-header.vue";
export default {
  data() {
    return {
      title: "Liputan",
      items: [
        {
          text: "About",
          href: "/admin/about",
        },
        {
          text: "Liputan",
          active: true,
        },
      ],
    };
  },
  components: {
    AddLiputan,
    ListLiputan,
    Header,
  },
};
</script>

<style lang="scss" scoped></style>
