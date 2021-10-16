<template>
  <div class="dash">
    <Header :title="title" :items="items"></Header>
    <b-card>
      Kopdar Alumni
    </b-card>
  </div>
</template>

<script>
import Header from "../../../components/admin/partials/page-header.vue";
export default {
  data() {
    return {
      title: "Kopdar Alumni",
      items: [
        {
          text: "Gallery",
          href: '/admin/images'
        },{
          text: "Kopdar Alumni",
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
