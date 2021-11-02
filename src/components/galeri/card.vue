<template>
  <div class="galeriCard justify-content-center w-100 row">
    <b-col md="11" sm="8">
      <div class="card-body border-top text-center">
        <b-row no-gutters>
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
      images: {},
    };
  },

  created() {
    const mainUrl = localStorage.getItem("apiUrl");
    this.imgUrl = mainUrl + "/images/galeri/";
    // console.log(this.img);
    // this.pushImg();
  },

  methods: {
    async pushImg() {
      this.images = await this.img;
    },
  },
};
</script>

<style lang="scss" scoped>
.galeriPelatihan img {
  height: 308px;
  width: 250px;
  object-fit: cover;
  object-position: 20% 10%; /* try 20px 10px */
  transition: 0.6s;
  border-radius: 4px;
}
</style>
