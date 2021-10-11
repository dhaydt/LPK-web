<template>
  <div class="dash">
    <Header :title="title" :items="items"></Header>
    <b-card>
      Status Loker
    </b-card>
  </div>
</template>

<script>
import Header from "../../../components/admin/partials/page-header.vue";
export default {
  data() {
    return {
      title: "Status Pelamar",
      items: [
        {
          text: "Loker",
          href: "/admin/loker"
        },
        {
          text: "Status",
          active: true
        }
      ],
    };
  },
  components: {
    Header,
  },
};
</script>

<style lang="scss" scoped></style>
