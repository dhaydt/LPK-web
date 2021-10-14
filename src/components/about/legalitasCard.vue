<template>
  <div class="container">
    <div class="row">
      <div>
        <vue-easy-lightbox
          :visible="visible"
          :imgs="lightboximgs"
          :index="index"
          @hide="visible = false"
        ></vue-easy-lightbox>
      </div>

      <div
        class="MultiCarousel"
        data-items="1,3,5,6"
        data-slide="1"
        id="MultiCarousel"
        data-interval="1000"
      >
        <div class="MultiCarousel-inner">
          <div class="cont item" v-for="(slide, i) in testi" :key="i">
            <a @click="() => showImg(i)">
              <b-card
                tag="article"
                img-top
                style="max-width: 20rem;"
                class="mb-2"
                no-body
              >
                <b-card-img-lazy :src="slide.thumbnail" fluid></b-card-img-lazy>
                <b-card-title class="px-4 pt-3 pb-2">{{
                  slide.title
                }}</b-card-title>
                <b-card-text class="px-4">{{ slide.instansi }} </b-card-text>
              </b-card>
            </a>
          </div>
        </div>
        <button class="btn btn-success leftLst">
          <i class="fas fa-chevron-left"></i>
        </button>
        <button class="btn btn-success rightLst">
          <i class="fas fa-chevron-right"></i>
        </button>
      </div>
    </div>
  </div>
</template>

<script>
import $ from "jquery";
import VueEasyLightbox from "vue-easy-lightbox";
export default {
  data() {
    return {
      imgs: "", // Img Url , string or Array of string
      visible: false,
      index: 0, // default: 0
      lightboximgs: [],
      testi: [
        {
          thumbnail: "/assets/images/izin1.png",
          img: "/assets/images/izinfull1.png",
          title: "Izin Menyelenggarakan Kursus",
          instansi: "Disdik / Kemendisbud",
        },
        {
          thumbnail: "/assets/images/izin2.png",
          img: "/assets/images/izin2.png",
          title: "Izin Penyelenggaraan Pelatihan",
          instansi: "Disnaker / Depnaker",
        },
        {
          thumbnail: "/assets/images/izin3.png",
          img: "/assets/images/izin3.png",
          title: "Sertifikat NPSN",
          instansi: "Kemendisbud",
        },
        {
          thumbnail: "/assets/images/izin1.png",
          img: "/assets/images/izin1.png",
          title: "Izin Menyelenggarakan Kursus",
          instansi: "Disdik / Kemendisbud",
        },
      ],
    };
  },

  components: {
    VueEasyLightbox,
  },

  mounted() {
    this.lightboximgs = this.testi.map((e) => e["img"]);
    // console.log(this.lightboximgs);
  },

  methods: {
    showSingle() {
      this.imgs = require("../../assets/images/izin1.png");
      // or
      // this.imgs = {
      //   title: "A placeholder",
      //   src: "1.jpg",
      // };
      this.show();
    },

    show() {
      this.visible = true;
    },

    handleHide() {
      this.visible = false;
    },
    showImg(i) {
      this.index = i;
      this.visible = true;
    },
  },

  created() {
    $(document).ready(function() {
      var itemsMainDiv = ".MultiCarousel";
      var itemsDiv = ".MultiCarousel-inner";
      var itemWidth = "";

      $(".leftLst, .rightLst").click(function() {
        var condition = $(this).hasClass("leftLst");
        if (condition) click(0, this);
        else click(1, this);
      });

      ResCarouselSize();

      $(window).resize(function() {
        ResCarouselSize();
      });

      //this function define the size of the items
      function ResCarouselSize() {
        var incno = 0;
        var dataItems = "data-items";
        var itemClass = ".item";
        var id = 0;
        var btnParentSb = "";
        var itemsSplit = "";
        var sampwidth = $(itemsMainDiv).width();
        var bodyWidth = $("body").width();
        $(itemsDiv).each(function() {
          id = id + 1;
          var itemNumbers = $(this).find(itemClass).length;
          btnParentSb = $(this)
            .parent()
            .attr(dataItems);
          itemsSplit = btnParentSb.split(",");
          $(this)
            .parent()
            .attr("id", "MultiCarousel" + id);

          if (bodyWidth >= 1200) {
            incno = itemsSplit[1];
            itemWidth = sampwidth / incno;
          } else if (bodyWidth >= 992) {
            incno = itemsSplit[1];
            itemWidth = sampwidth / incno;
          } else if (bodyWidth >= 768) {
            incno = itemsSplit[1];
            itemWidth = sampwidth / incno;
          } else {
            incno = itemsSplit[0];
            itemWidth = sampwidth / incno;
          }
          $(this).css({
            transform: "translateX(0px)",
            width: itemWidth * itemNumbers,
          });
          $(this)
            .find(itemClass)
            .each(function() {
              $(this).outerWidth(itemWidth);
            });

          $(".leftLst").addClass("over");
          $(".rightLst").removeClass("over");
        });
      }

      //this function used to move the items
      function ResCarousel(e, el, s) {
        var leftBtn = ".leftLst";
        var rightBtn = ".rightLst";
        var translateXval = "";
        var divStyle = $(el + " " + itemsDiv).css("transform");
        var values = divStyle.match(/-?[\d\\.]+/g);
        var xds = Math.abs(values[4]);
        if (e == 0) {
          translateXval = parseInt(xds) - parseInt(itemWidth * s);
          $(el + " " + rightBtn).removeClass("over");

          if (translateXval <= itemWidth / 2) {
            translateXval = 0;
            $(el + " " + leftBtn).addClass("over");
          }
        } else if (e == 1) {
          var itemsCondition =
            $(el)
              .find(itemsDiv)
              .width() - $(el).width();
          translateXval = parseInt(xds) + parseInt(itemWidth * s);
          $(el + " " + leftBtn).removeClass("over");

          if (translateXval >= itemsCondition - itemWidth / 2) {
            translateXval = itemsCondition;
            $(el + " " + rightBtn).addClass("over");
          }
        }
        $(el + " " + itemsDiv).css(
          "transform",
          "translateX(" + -translateXval + "px)"
        );
      }

      //It is used to get some elements from btn
      function click(ell, ee) {
        var Parent =
          "#" +
          $(ee)
            .parent()
            .attr("id");
        var slide = $(Parent).attr("data-slide");
        ResCarousel(ell, Parent, slide);
      }
    });
  },
};
</script>

<style lang="scss" scoped>
.MultiCarousel {
  float: left;
  overflow: hidden;
  padding: 15px;
  width: 100%;
  position: relative;
}
.MultiCarousel .MultiCarousel-inner {
  transition: 1s ease all;
  width: 400px;
  float: left;
}
.MultiCarousel .MultiCarousel-inner .item {
  float: left;
}
.MultiCarousel .MultiCarousel-inner .item > div {
  text-align: center;
  padding: 10px;
  margin: 10px;
  color: #666;
}
.MultiCarousel .leftLst,
.MultiCarousel .rightLst {
  position: absolute;
  border-radius: 50%;
  top: calc(50% - 20px);
}
.MultiCarousel .leftLst {
  left: 0;
}
.MultiCarousel .rightLst {
  right: 0;
}

.MultiCarousel .leftLst.over,
.MultiCarousel .rightLst.over {
  pointer-events: none;
  background: #ccc;
}

button.btn-success.leftLst,
button.btn-success.rightLst {
  background-color: #07a148;
}

button.btn-success.leftLst:hover,
button.btn-success.rightLst:hover {
  background-color: #07a147c5;
}

.card {
  background: #ffffff;
  cursor: pointer;
  /* Neutral / 05 */
  min-height: 320px;
  transition: 0.6s;
  border: 1px solid #e8eaed;
  box-sizing: border-box;
  box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.04), 0px 2px 6px rgba(0, 0, 0, 0.04),
    0px 0px 1px rgba(0, 0, 0, 0.04);
  border-radius: 8px;
}

.card:hover {
  background-color: #12152718;
}

.card-title {
  font-style: normal;
  font-weight: 600;
  font-size: 20px;
  line-height: 140%;
  /* identical to box height, or 28px */

  letter-spacing: 0.01em;
  text-align: left;
  color: #121527;
}

.card-text {
  font-family: Inter;
  font-style: normal;
  font-weight: normal;
  font-size: 16px;
  line-height: 130%;
  letter-spacing: 0.01em;
  text-align: left;
  /* Black/2 */
  color: #757682;
}

.inner-border {
  border-top: 5px solid #07a148;
}
</style>
