<template>
  <div class="dash">
    <Header :title="title" :items="items"></Header>
    <b-card>
      Legalitas
    </b-card>
  </div>
</template>

<script>
import Header from "../../../components/admin/partials/page-header.vue";
export default {
  data() {
    return {
      title: "Legaslitas",
      items: [
        {
          text: "About",
          href: "/admin/about"
        },
        {
          text: "Legalitas",
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
