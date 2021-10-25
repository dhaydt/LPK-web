<template>
  <div class="galeri justify-content-center w-100 row">
    <b-col md="11">
      <div class="card-body border-top text-center">
        <b-row>
          <b-col md="3" v-for="i in img" :key="i.id" class="galeriPelatihan"
            ><b-img-lazy :src="imgUrl + i.img" alt="gallery"></b-img-lazy
          ></b-col>
        </b-row>
      </div>
    </b-col>
  </div>
</template>

<script>
export default {
  props: ["img"],
  data() {
    return {
      imgUrl: "",
    };
  },

  created() {
    const mainUrl = localStorage.getItem("apiUrl");
    this.imgUrl = mainUrl + "/images/galeri/";
  },

  methods: {},
};
</script>

<style lang="scss" scoped>
.galeriPelatihan img {
  height: 308px;
  width: 250px;
}
</style>
