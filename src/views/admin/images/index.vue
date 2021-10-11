<template>
  <div class="dash">
    <Header :title="title" :items="items"></Header>
    <b-card>
      Gallery
    </b-card>
  </div>
</template>

<script>
import Header from "../../../components/admin/partials/page-header.vue";
export default {
  data() {
    return {
      title: "Gallery",
      items: [
        {
          text: "Gallery",
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
