<template>
  <div class="pelatihan">
    <PageHeader :title="title" :items="items"></PageHeader>
    <b-card>
      <b-tabs content-class="mt-3" fill>
        <b-tab title="List Timeline" active>
          <ListTimenline></ListTimenline>
        </b-tab>
        <b-tab title="Tambah data">
          <AddTimeline></AddTimeline>
        </b-tab>
      </b-tabs>
    </b-card>
  </div>
</template>

<script>
import AddTimeline from "./addTimeline";
import ListTimenline from "./listTimenline";
import PageHeader from "../../../../components/admin/partials/page-header.vue";
export default {
  data() {
    return {
      title: "Timeline Pelatihan",
      items: [
        {
          text: "Pelatihan",
          to: "/admin/pelatihan",
        },
        {
          text: "Timeline Pelatihan",
          active: true,
        },
      ],
    };
  },
  components: {
    AddTimeline,
    ListTimenline,
    PageHeader,
  },
};
</script>

<style lang="scss" scoped></style>
