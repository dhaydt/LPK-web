<template>
  <div class="liputanDetail">
    <Breadcumb :items="items"></Breadcumb>
    <b-card title="Liputan Media"></b-card>
  </div>
</template>

<script>
import Breadcumb from "../../components/breadcumb";
export default {
  components: { Breadcumb },
  data() {
    return {
      items: [
        {
          text: "Home",
          to: "/",
        },
        {
          text: "Liputan Media",
          active: true,
        },
      ],
    };
  },
};
</script>

<style lang="scss" scoped></style>
