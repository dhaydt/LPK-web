<template>
  <div class="applyLoker">
    <NavbarApply></NavbarApply>
    <FormData></FormData>
  </div>
</template>

<script>
import FormData from "../../components/loker/apply/formData";
import NavbarApply from "../../components/loker/apply/navbarApply";
export default {
  metaInfo: {
    // if no subcomponents specify a metaInfo.title, this title will be used
    title: "PGU",
    // all titles will be injected into this template
    titleTemplate: "%s | Loker Apply",
  },
  components: {
    FormData,
    NavbarApply,
  },

  created() {
    window.onload = function() {
      var navi = this.document.querySelector(".navfront");
      if (navi !== null) {
        navi.classList.toggle("d-none");
      }
    };
  },

  mounted() {
    this.$root.$emit("navbar");
  },
};
</script>

<style lang="scss" scoped></style>
