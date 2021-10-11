<template>
  <div class="dash">
    <Header :title="title" :items="items"></Header>
    <b-card>
      Struktur
    </b-card>
  </div>
</template>

<script>
import Header from "../../../components/admin/partials/page-header.vue";
export default {
  data() {
    return {
      title: "Struktur LPK",
      items: [
        {
          text: "About",
          href: "/admin/about"
        },
        {
          text: "Struktur LPK",
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
