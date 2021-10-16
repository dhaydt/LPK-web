<template>
  <div class="dash">
    <Header :title="title"></Header>
    <b-card>
      Dasboard
    </b-card>
  </div>
</template>

<script>
import Header from "@/components/admin/partials/page-header.vue";
export default {
  data() {
    return {
      title: "Dashboard",
    };
  },
  components: {
    Header,
  },
};
</script>

<style lang="scss" scoped></style>
