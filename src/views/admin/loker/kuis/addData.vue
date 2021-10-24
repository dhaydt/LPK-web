<template>
  <div>
    <b-tabs content-class="mt-3">
      <b-tab title="Tambah Pertanyaan" active>
        <AddKuis></AddKuis>
      </b-tab>
      <b-tab title="Tambah Waktu">
        <AddWaktu></AddWaktu>
      </b-tab>
    </b-tabs>
  </div>
</template>

<script>
import AddWaktu from "./addWaktu";
import AddKuis from "./addKuis";
export default {
  components: {
    AddWaktu,
    AddKuis,
  },
};
</script>

<style lang="scss" scoped></style>
