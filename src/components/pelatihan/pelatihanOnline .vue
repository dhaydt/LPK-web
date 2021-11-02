<template>
  <div class="container pelatihanOnline">
    <div class="row">
      <div
        class="MultiCarousel"
        data-items="1,3,5,6"
        data-slide="1"
        id="MultiCarousel"
        data-interval="1000"
      >
        <div class="card-title-event">
          Pelatihan Online
        </div>
        <div class="MultiCarousel-inner">
          <div class="cont item" v-for="(slide, i) in training" :key="i">
            <b-card
              :title="slide.title"
              :img-src="imgUrl + slide.img"
              img-alt="Image"
              img-height="250"
              img-top
              class="mb-2"
            >
              <b-card-text>
                {{ slide.subtitle }}
              </b-card-text>
              <b-row>
                <b-col>
                  <div class="calender text-left">
                    <i class="far fa-calendar"></i>
                    <span>{{ slide.akses }}</span>
                  </div>
                </b-col>
              </b-row>
              <b-row>
                <b-col>
                  <div class="time text-left">
                    <i class="far fa-clock"></i>
                    <span>{{ slide.expire }}</span>
                  </div>
                </b-col>
              </b-row>
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
      training: [],
      onUrl: "",
      imgUrl: "",
    };
  },

  created() {
    const pelOnData = localStorage.getItem("pelOnline");
    this.training = JSON.parse(pelOnData);
    const mainUrl = localStorage.getItem("apiUrl");
    this.imgUrl = mainUrl + "/images/pelatihan/";
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
@import "@/assets/main.scss";

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
  display: flex;
  flex-direction: row;
  float: left;
  padding-top: 50px;
}
.MultiCarousel .MultiCarousel-inner .item {
  float: left;
}
.MultiCarousel .MultiCarousel-inner .item > div {
  text-align: center;
  padding: 0px;
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
  background-color: $paz-main;
  color: #fff;
}

button.btn-success.rightLst {
  position: absolute;
  top: 28px;
  right: 10vw;
}

button.btn-success.leftLst {
  position: absolute;
  top: 28px;
  left: initial;
  right: 15vw;
}

button.btn-success.leftLst:hover,
button.btn-success.rightLst:hover {
  background-color: $paz-secondary;
}

.card {
  box-shadow: 0px 21.6792px 32.5188px rgba(0, 0, 0, 0.06),
    0px 2.7099px 8.12969px rgba(0, 0, 0, 0.04),
    0px 0px 1.35495px rgba(0, 0, 0, 0.04);
  border-radius: 4px;
  width: 396px;
  max-width: 20rem;
}

.card-title-event {
  font-style: normal;
  font-weight: bold;
  font-size: 40px;
  line-height: 140%;
  text-align: left;
  color: $paz-main;
}

.card-title {
  font-size: 1.1rem;
  font-style: normal;
  font-weight: 600;
  line-height: 28px;
  letter-spacing: 0.01em;
  text-align: left;
  color: #121527;
}

.card-text {
  font-size: 1rem;
  font-style: normal;
  font-weight: 500;
  line-height: 19px;
  letter-spacing: 0em;
  text-align: left;
  color: #757682;
}

.calender,
.time {
  font-size: 14px;
  font-style: normal;
  margin-top: 20px;
  font-weight: 400;
  line-height: 17px;
  letter-spacing: 0.01em;
  text-align: left;
  color: #757682;
}

.calender i,
.time i {
  font-size: 1.2rem;
  margin-right: 10px;
}
</style>
