<template>
  <div class="dash">
    <Header :title="title" :items="items"></Header>
    <b-card>
      <b-tabs content-class="mt-3">
        <b-tab title="Lamaran Masuk" active>
          <ListApply></ListApply>
        </b-tab>
      </b-tabs>
    </b-card>
  </div>
</template>

<script>
import ListApply from "./status/listApply";
import Header from "../../../components/admin/partials/page-header.vue";
export default {
  data() {
    return {
      title: "Status Pelamar",
      items: [
        {
          text: "Loker",
          href: "/admin/loker",
        },
        {
          text: "Status",
          active: true,
        },
      ],
    };
  },
  components: {
    ListApply,
    Header,
  },
};
</script>

<style lang="scss" scoped></style>
