<template>
  <div>
    <b-tabs content-class="mt-3">
      <b-tab title="List Pertanyaan" active>
        <ListKuis></ListKuis>
      </b-tab>
      <b-tab title="Waktu Pengerjaan">
        <ListWaktu></ListWaktu>
      </b-tab>
    </b-tabs>
  </div>
</template>

<script>
import ListWaktu from "./listWaktu";
import ListKuis from "./listKuis";
export default {
  components: {
    ListWaktu,
    ListKuis,
  },
};
</script>

<style lang="scss" scoped></style>
