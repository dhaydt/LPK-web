<template>
  <div class="setting">
    <Header :title="title" :items="items"></Header>
    <b-card>
      <b-tabs content-class="mt-3" fill>
        <b-tab title="List Alumni" active>
          <ListAlumni></ListAlumni>
        </b-tab>
        <b-tab title="Add Alumni">
          <AddAlumni></AddAlumni>
        </b-tab>
      </b-tabs>
    </b-card>
  </div>
</template>

<script>
import AddAlumni from './addAlumni'
import ListAlumni from './listAlumni'
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
    AddAlumni,
    ListAlumni,
    Header,
  },
};
</script>

<style lang="scss" scoped></style>
