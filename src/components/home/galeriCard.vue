<template>
  <div class="galeri justify-content-center w-100 row">
    <b-col md="11" class="px-4 d-none d-md-flex">
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
    <div class="d-block d-md-none p-0 w-100" style="overflow: hidden;">
      <b-row no-gutters class="justify-content-center">
        <b-col>
          <div class="wrapper">
            <Flicking
              ref="flicking"
              :options="{
                align: 'center',
                defaultIndex: 0,
                circular: true,
                duration: 1100,
              }"
            >
              <div
                class="galeri-sm"
                v-for="img in images.slice(0, 4)"
                :key="img.id"
              >
                <b-img
                  :src="imgUrl + img.img"
                  alt="galeri-home"
                  class="card-img"
                ></b-img>
              </div>
            </Flicking>
          </div>
        </b-col>
      </b-row>
    </div>
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
    this.imgUrl = mainUrl + "/images/newGaleri/";
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
.galeri-sm {
  margin-right: 20px;
  .card-img {
    width: 250px;
    height: 308px;
    object-fit: cover;
    object-position: 20% 10%; /* try 20px 10px */
    border-radius: 4px;
  }
}
.galeriPelatihan img {
  height: 308px;
  width: 250px;
  object-fit: cover;
  object-position: 20% 10%; /* try 20px 10px */
  transition: 0.6s;
  border-radius: 4px;
}
</style>
