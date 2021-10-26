<template>
  <div class="traineDiagram">
    <b-row cols-md="5" no-gutters>
      <b-col v-for="(ins, i) in instruktur" :key="i">
        <b-card no-body>
          <b-card-img-lazy :src="ins.img"> </b-card-img-lazy>
        </b-card>
      </b-col>
    </b-row>
  </div>
</template>

<script>
export default {
  data() {
    return {
      instruktur: [
        {
          name: "Ahmad Kaimudin",
          Address: "Pontianak",
          img: "/assets/images/Container.png",
        },
        {
          name: "Ahmad Kaimudin",
          Address: "Pontianak",
          img: "/assets/images/Container (1).png",
        },
        {
          name: "Ahmad Kaimudin",
          Address: "Pontianak",
          img: "/assets/images/Container (2).png",
        },
        {
          name: "Ahmad Kaimudin",
          Address: "Pontianak",
          img: "/assets/images/Container (3).png",
        },
        {
          name: "Ahmad Kaimudin",
          Address: "Pontianak",
          img: "/assets/images/Container (4).png",
        },
        {
          name: "Ahmad Kaimudin",
          Address: "Pontianak",
          img: "/assets/images/Container (5).png",
        },
        {
          name: "Ahmad Kaimudin",
          Address: "Pontianak",
          img: "/assets/images/Container (6).png",
        },
        {
          name: "Ahmad Kaimudin",
          Address: "Pontianak",
          img: "/assets/images/Container (7).png",
        },
        {
          name: "Ahmad Kaimudin",
          Address: "Pontianak",
          img: "/assets/images/Container (8).png",
        },
        {
          name: "Ahmad Kaimudin",
          Address: "Pontianak",
          img: "/assets/images/Container (9).png",
        },
      ],
    };
  },
};
</script>

<style lang="scss" scoped></style>
