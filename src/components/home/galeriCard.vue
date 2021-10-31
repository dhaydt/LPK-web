<template>
  <div class="galeri justify-content-center w-100 row">
    <b-col md="11" class="px-4">
      <div class="card-body text-center">
        <b-row>
          <b-col
            md="3"
            sm="7"
            v-for="img in images.slice(0, 4)"
            :key="img.id"
            class="galeriPelatihan mt-4"
            ><b-img-lazy :src="imgUrl + img.img" alt="gallery"></b-img-lazy
          ></b-col>
        </b-row>
      </div>
    </b-col>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      imageUrl: "",
      imgUrl: "",
      images: [],
    };
  },

  created() {
    const mainUrl = localStorage.getItem("apiUrl");
    this.imageUrl = mainUrl + "/image";
    this.imgUrl = mainUrl + "/images/galeri/";
    this.getGaleri();
  },

  methods: {
    async getGaleri() {
      const resp = await axios.get(this.imageUrl);
      console.log(resp.data.data);
      this.images = resp.data.data;
    },
  },
};
</script>

<style lang="scss" scoped>
.galeriPelatihan img {
  height: 308px;
  width: 250px;
}
</style>
