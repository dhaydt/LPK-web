<template>
  <div class="liputanDetail">
    <Breadcumb :items="items"></Breadcumb>
    <Main></Main>
  </div>
</template>

<script>
import Main from "../../components/liputan/main";
import Breadcumb from "../../components/breadcumb";
export default {
  components: {
    Main,
    Breadcumb,
  },
  data() {
    return {
      liputanUrl: "",
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
