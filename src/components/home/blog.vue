<template>
  <section class="blog">
    <b-container>
      <b-row class="justify-content-center">
        <b-col md="7">
          <div class="head">
            <span>BLOG</span>
          </div>
          <h2 class="mt-4">
            Dapatkan informasi tentang kegiatan yang telah kami selenggarakan
            disini
          </h2>
          <b-button variant="outline-success seemore" href="#" class="mt-4 px-4"
            ><span
              ><img src="../../assets/images/blog.png" alt="info" height="25" />
              Lihat semua blog</span
            ></b-button
          >
        </b-col>
      </b-row>
      <b-row class="mt-4" style="max-height: 434px !important;">
        <b-col>
          <b-card overlay :img-src="img1" img-alt="news" text-variant="white">
            <div class="card-overlay">
              <b-card-title class="mx-4">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit.
              </b-card-title>
            </div>
          </b-card>
        </b-col>
        <b-col>
          <b-card-group v-for="(n, i) in news" :key="i">
            <b-card no-body class="overflow-hidden m-2" style="">
              <b-row no-gutters>
                <b-col md="6">
                  <b-card-img-lazy
                    :src="n.img"
                    alt="Image"
                    height="100"
                    class="rounded-0"
                  ></b-card-img-lazy>
                </b-col>
                <b-col md="6">
                  <b-card-body class="p-0">
                    <b-card-title>{{ n.title }}</b-card-title>
                    <b-card-text>
                      {{ n.content }}
                    </b-card-text>
                  </b-card-body>
                </b-col>
              </b-row>
            </b-card>
          </b-card-group>
        </b-col>
      </b-row>
    </b-container>
  </section>
</template>

<script>
export default {
  data() {
    return {
      img1: require("../../assets/images/police.png"),
      news: [
        {
          title:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet",
          img: require("../../assets/images/news1.png"),
          content:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet bibendum iaculis nisl elementum odio nis... Baca Selengkapnya",
        },
        {
          title:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet",
          img: require("../../assets/images/news2.png"),
          content:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet bibendum iaculis nisl elementum odio nis... Baca Selengkapnya",
        },
        {
          title:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet",
          img: require("../../assets/images/news3.png"),
          content:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet bibendum iaculis nisl elementum odio nis... Baca Selengkapnya",
        },
      ],
    };
  },
};
</script>

<style lang="scss" scoped>
section {
  margin-top: 110px;
}
.head {
  span {
    font-weight: 600;
    font-size: 16px;
    font-style: normal;
    line-height: 26px;
    letter-spacing: 0.2em;
    text-transform: uppercase;
    color: #07a148;
    padding-bottom: 5px;
    border-bottom: 2px solid #07a148;
  }
}

h2 {
  font-style: normal;
  font-weight: 600;
  line-height: 140%;
  /* or 48px */
  color: #2e3e5c;
  text-align: center;
  letter-spacing: 0.5px;
}

.seemore span {
  font-size: 16px;
  font-style: normal;
  font-weight: 600;
  line-height: 19px;
  letter-spacing: 0.04em;
  text-align: left;
  color: #07a148;
  text-transform: capitalize;
}

.card-overlay {
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  background-color: rgba(26, 30, 39, 0.7);

  .card-title {
    font-style: normal;
    font-weight: 600;
    font-size: 24px;
    line-height: 160%;
    /* or 38px */
    text-align: left;
    letter-spacing: 0.5px;

    color: #ffffff;
  }
}

.card-title {
  font-style: normal;
  font-weight: 500;
  font-size: 15px;
  margin-left: 10px;
  // line-height: 160%;
  /* or 26px */
  text-align: left;
  // letter-spacing: 0.5px;
  color: #2e3e5c;
}

.card-text {
  font-style: normal;
  font-weight: normal;
  font-size: 12px;
  margin-left: 10px;
  // line-height: 140%;
  /* or 22px */

  // letter-spacing: 0.5px;

  /* Black/2 */
  text-align: left;
  color: #757682;
}
</style>
