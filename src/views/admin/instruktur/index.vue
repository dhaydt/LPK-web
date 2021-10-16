<template>
  <div class="dash">
    <Header :title="title" :items="items"></Header>
    <b-card>
      Instruktur
    </b-card>
  </div>
</template>

<script>
import Header from "../../../components/admin/partials/page-header.vue";
export default {
  data() {
    return {
      title: "Instruktur",
      items: [
        {
          text: "Instruktur",
          active: true,
        },
      ],
    };
  },
  components: {
    Header,
  },
};
</script>

<style lang="scss" scoped></style>
