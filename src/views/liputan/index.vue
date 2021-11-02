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
  metaInfo: {
    // if no subcomponents specify a metaInfo.title, this title will be used
    title: "LKP PAZ Generasi Unggul",
    // all titles will be injected into this template
    titleTemplate: "%s | LIPUTAN",
  },
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
