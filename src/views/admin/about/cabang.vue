<template>
  <div class="dash">
    <Header :title="title" :items="items"></Header>
    <b-card>
      Cabang
    </b-card>
  </div>
</template>

<script>
import Header from "../../../components/admin/partials/page-header.vue";
export default {
  data() {
    return {
      title: "Cabang",
      items: [
        {
          text: "About",
          href: "/admin/about"
        },
        {
          text: "Cabang",
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
