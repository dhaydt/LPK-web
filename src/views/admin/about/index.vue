<template>
  <div class="dash">
    <Header :title="title" :items="items"></Header>
    <b-card>
      Visi Misi
    </b-card>
  </div>
</template>

<script>
import Header from "../../../components/admin/partials/page-header.vue";
export default {
  data() {
    return {
      title: "Visi Misi",
      items: [
        {
          text: "Visi Misi",
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
