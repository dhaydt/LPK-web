<template>
  <div class="detailNews">
    <b-container>
      <b-row>
        <b-col>
          <b-card no-body>
            <b-card-title class="mainTitle"> {{ news.title }} </b-card-title>
            <div class="card-subtitle date">
              {{ news.date | moment("DD MMMM YYYY HH:MM") }} WIB
            </div>
            <div class="tag-box d-flex justify-content-center" v-if="news.tag">
              <b-badge
                class="card-subtitle tag"
                v-for="(n, i) in JSON.parse(news.tag)"
                :key="i"
                >{{ n.text }}
              </b-badge>
            </div>
            <div class="img">
              <b-img-lazy :src="imgUrl + news.img" v-if="news.img"></b-img-lazy>
              <div v-if="news.video" class="pt-4 video">
                <b-embed
                  type="iframe"
                  aspect="21by9"
                  allowfullscreen
                  :src="imgUrl + news.video"
                ></b-embed>
              </div>
             <div class="youtube-vid w-100 pt-4" v-if="news.youtube">

        <LazyYoutube
          ref="vimeoLazyVideo"
          :src="news.youtube"
          
          aspect-ratio="21:12"
          thumbnail-quality="medium"
        /> </div>
            </div>
            <div class="card-body mt-4">
              <b-row cols-md="2" cols-sm="1">
                <b-col md="11" sm="12" class="mb-3">
                  <div class="body-title">{{ news.subtitle }}</div>
                  <b-card-text
                    v-html="news.content"
                    class="text-left"
                  ></b-card-text>
                  <div class="iklan w-100 inner-border my-4">
                    {{ news.quote }}
                  </div>
                  <b-card-text
                    v-html="news.content2"
                    class="text-left"
                  ></b-card-text>
                </b-col>
                <b-col md="1" class="sosmedLiputan" id="sosmedLiputan">
                  <b-avatar size="48" class="mb-4 ml-2">
                    <i class="fab fa-facebook-f"></i>
                  </b-avatar>
                  <b-avatar size="48" class="mb-4 ml-2"
                    ><i class="fab fa-twitter"></i
                  ></b-avatar>
                  <b-avatar size="48" class="mb-4 ml-2"
                    ><i class="fab fa-instagram"></i
                  ></b-avatar>
                  <b-avatar size="48" class="mb-4 ml-2"
                    ><i class="fab fa-whatsapp"></i
                  ></b-avatar>
                </b-col>
              </b-row>
            </div>
          </b-card>
        </b-col>
      </b-row>
      <b-row>
        <LiputanLainnya></LiputanLainnya>
      </b-row>
    </b-container>
  </div>
</template>

<script>
import LiputanLainnya from "./liputanLainnya";
export default {
  components: { LiputanLainnya },
  props: ["news"],

  watch: {
    news: () => {
      console.log("props change");
    },
  },

  data() {
    return {
      imgUrl: "",
    };
  },
  created() {
    window.scrollTo(0, 0);
    const mainUrl = localStorage.getItem("apiUrl");
    this.imgUrl = mainUrl + "/images/liputan/";
  },
};
</script>

<style lang="scss" scoped>
.body-title {
  text-transform: capitalize;
}
.card {
  box-shadow: none;
  .card-title {
    font-style: normal;
    font-weight: 600;
    font-size: 32px;
    line-height: 140%;
    text-align: center;
    letter-spacing: 0.5px;
    margin-bottom: 20px;
    color: #2e3e5c;
  }

  .card-subtitle.date {
    font-style: normal;
    font-weight: 500;
    margin-bottom: 20px;
    font-size: 16px;
    line-height: 24px;
    color: #757682;
  }

  .tag-box .badge {
    padding: 7px 12px;
    background: #e9e9e9;
    font-style: normal;
    margin-left: 10px;
    font-weight: 500;
    font-size: 14px;
    text-transform: capitalize;
    color: #757682;
  }

  .img {
    height: 512px;
    img {
      // height: 512px;
      max-height: 100%;
      width: auto;
      margin-top: 20px;
    }
  }

  .card-body {
    .body-title {
      font-style: normal;
      font-weight: 600;
      text-align: left;
      font-size: 24px;
      color: #121527;
    }

    .card-text {
      margin-top: 20px;
      font-style: normal;
      font-weight: normal;
      font-size: 16px;
    }
  }

  span.b-avatar {
    background: #e9e9e9;
    color: #757682;
    font-size: 24px;
    cursor: pointer;
  }
}

.iklan {
  font-family: Inter;
  font-style: italic;
  font-weight: 500;
  font-size: 20px;
  line-height: 160%;
  /* or 32px */
  border-radius: 4px;

  text-align: center;

  /* Black/2 */

  color: #757682;
}
.inner-border {
  border-left: 5px solid #07a148;
}
</style>
