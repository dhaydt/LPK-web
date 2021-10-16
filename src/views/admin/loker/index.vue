<template>
  <div class="dash">
    <Header :title="title" :items="items"></Header>
    <b-card>
      Loker
    </b-card>
  </div>
</template>

<script>
import Header from "../../../components/admin/partials/page-header.vue";
export default {
  data() {
    return {
      title: "Lowongan kerja",
      items: [
        {
          text: "Loker",
          href: "/admin/loker"
        },
        {
          text: "List",
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
