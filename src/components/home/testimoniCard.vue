<template>
  <div class="container">
    <div class="row">
      <div
        class="MultiCarousel"
        data-items="1,3,5,6"
        data-slide="1"
        id="MultiCarousel"
        data-interval="1000"
      >
        <div class="MultiCarousel-inner">
          <div class="cont item" v-for="(slide, i) in testi" :key="i">
            <b-card class="px-2 pt-0" no-body>
              <b-card-img-lazy
                v-if="slide.img"
                :src="imgUrl + slide.img"
                height="240"
                class="img-top"
              ></b-card-img-lazy>
              <LazyVideo
                v-if="slide.video"
                :src="imgUrl + slide.video"
                style="height: 240px;"
                class="card-img"
              />

              <div class="card-body">
                <b-col sm="9" class="text-left px-0">
                  <h5 class="pb-2">{{ slide.name }}</h5>
                  <span>{{ slide.address }}</span>
                </b-col>
                <b-card-text class="pt-4">{{ slide.content }}</b-card-text>
              </div>
            </b-card>
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
export default {
  data() {
    return {
      testi: [],
      imgUrl: "",
    };
  },

  created() {
    this.testi = JSON.parse(localStorage.getItem("testi"));
    console.log(this.testi);
    const mainUrl = localStorage.getItem("apiUrl");
    this.imgUrl = mainUrl + "/images/testi/";
  },

  mounted() {
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
  padding: 24px;
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
  min-height: 512px;

  border: 1px solid #e8eaed;
  box-sizing: border-box;
  box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.04), 0px 2px 6px rgba(0, 0, 0, 0.04),
    0px 0px 1px rgba(0, 0, 0, 0.04);
  border-radius: 8px;
}
h5 {
  font-style: normal;
  font-weight: 600;
  font-size: 20px;
  letter-spacing: 0.01em;
  margin-bottom: 0;
  /* Black/3 */
  color: #121527;
}

span {
  font-style: normal;
  font-weight: normal;
  font-size: 14px;
  line-height: 130%;
  letter-spacing: 0.01em;
  /* Black/2 */
  color: #757682;
}

.card-text {
  font-family: Inter;
  font-style: normal;
  font-weight: normal;
  font-size: 16px;
  overflow-y: hidden;
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
