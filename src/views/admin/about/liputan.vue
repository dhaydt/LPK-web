<template>
  <div class="dash">
    <Header :title="title" :items="items"></Header>
    <b-card>
      Liputan
    </b-card>
  </div>
</template>

<script>
import Header from "../../../components/admin/partials/page-header.vue";
export default {
  data() {
    return {
      title: "Liputan",
items: [
        {
          text: "About",
          href: "/admin/about"
        },
        {
          text: "Liputan",
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
