<template>
  <div class="setting">
    <Header :title="title" :items="items"></Header>
    <b-card>
      <b-tabs content-class="mt-3" fill>
        <b-tab title="Notification" active>
          <Notif></Notif>
        </b-tab>
        <b-tab title="Footer">
          <Footer></Footer>
        </b-tab>
      </b-tabs>
    </b-card>
  </div>
</template>

<script>
import Footer from './footer'
import Notif from './notif'
import Header from "../../../components/admin/partials/page-header.vue";
export default {
  data() {
    return {
      title: "Setting",
      items: [
        {
          text: "Setting",
          active: true,
        },
      ],
    };
  },
  components: {
    Footer,
    Notif,
    Header,
  },
};
</script>

<style lang="scss" scoped></style>
