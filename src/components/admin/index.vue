<template>
  <div class="dash">
    <Header :title="title"></Header>
    <b-card>
      Home
    </b-card>
  </div>
</template>

<script>
import Header from "@/components/admin/partials/page-header.vue";
export default {
  data() {
    return {
      title: "Home",
    };
  },
  components: {
    Header,
  },
};
</script>

<style lang="scss" scoped></style>
