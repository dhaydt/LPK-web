<template>
  <div class="dash">
    <Header :title="title"></Header>
    <b-card>
      <b-tabs content-class="mt-3" fill>
        <b-tab title="List Users" active>
          <ListUser></ListUser>
        </b-tab>
        <b-tab title="Tambah User">
          <AddUsers></AddUsers>
        </b-tab>
      </b-tabs>
    </b-card>
  </div>
</template>

<script>
import AddUsers from "./addUsers";
import ListUser from "./listUser";
import Header from "@/components/admin/partials/page-header.vue";
export default {
  data() {
    return {
      title: "Manajemen User",
    };
  },
  components: {
    AddUsers,
    ListUser,
    Header,
  },
};
</script>

<style lang="scss" scoped></style>
