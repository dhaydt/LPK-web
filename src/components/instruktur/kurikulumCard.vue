<template>
  <div class="kurikulumUpgrading">
    <b-card no-body>
      <b-container>
        <b-card-title>
          PAZ Upgrading
        </b-card-title>
        <b-row>
          <b-col sm="12" md="8">
            <div class="card-subtitle mt-4">
              Pembahasan tematik terhadap suatu masalah tertentu yang dibagi
              kedalam 9 topik pembahasan diantaranya:
            </div>
          </b-col>
        </b-row>
        <b-row>
          <div
            class="MultiCarousel"
            data-items="1,3,5,6"
            data-slide="1"
            id="MultiCarousel"
            data-interval="1000"
          >
            <div class="MultiCarousel-inner">
              <div
                class="cardSlider item "
                v-for="(slide, i) in upgrade"
                :key="i"
              >
                <b-card class="inner-border text-center sliderCard" no-body>
                  <b-img :src="slide.img" height="104"></b-img>
                  <b-col sm="12" class="mt-4">
                    <h5>{{ slide.title }}</h5>
                    <span>{{ slide.text }}</span>
                  </b-col>
                  <b-card-text class="p-2">{{ slide.content }}</b-card-text>
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
        </b-row>
      </b-container>
    </b-card>
  </div>
</template>

<script>
import $ from "jquery";
export default {
  data() {
    return {
      upgrade: [
        {
          title: "Jantung",
          img: "/assets/svg/heart.svg",
          text:
            "Koroner, jantung bengkak, bypass, aritmea, klep bocor, lemah jantung",
        },
        {
          title: "Babypaz",
          img: "/assets/svg/baby.svg",
          text:
            "Cerebral palsy, down syndrom, jantung bocor, pneumonia, asma, kejang, epilepsi, polio",
        },
        {
          title: "Kanker / Benjolan",
          img: "/assets/svg/breast.svg",
          text: "Tumor dan kanker payudara",
        },
        {
          title: "Skoliosis",
          img: "/assets/svg/bone.png",
          text: "Bentuk tulang belakang yang tidak simetris",
        },
        {
          title: "Autoimun",
          img: "/assets/svg/immun.svg",
          text: "Lupus, psoriasis, arthritis",
        },
        {
          title: "Diabetes",
          img: "/assets/svg/finger.svg",
          text: "Mata kabur, sering tidur, sering buang air kecil",
        },
        {
          title: "PAZ Maryam",
          img: "/assets/svg/pregnant.svg",
          text: "Melahirkan secara alami dan cepat",
        },
        {
          title: "PAZ Stroke",
          img: "/assets/svg/cerebral.svg",
          text: "Penanganan stroke",
        },
        {
          title: "Paz Survival",
          img: "/assets/svg/fire.svg",
          text: "Bertahan hidup",
        },
      ],
    };
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
  box-shadow: none;
  margin-top: 50px;
}
.card-title {
  text-align: left;
  font-style: normal;
  font-weight: 600;
  font-size: 32px;
  line-height: 140%;
  letter-spacing: 0.5px;
  color: #121527;
}
.card-subtitle {
  text-align: left;
  font-style: normal;
  font-weight: normal;
  font-size: 20px;
  line-height: 160%;
  color: #757682;
}

.sliderCard {
  min-height: 272px;
  box-shadow: 0px 16px 24px rgba(0, 0, 0, 0.06), 0px 2px 6px rgba(0, 0, 0, 0.04),
    0px 0px 1px rgba(0, 0, 0, 0.04);
  border-radius: 4px;

  h5 {
    font-style: normal;
    font-weight: 600;
    font-size: 20px;
    line-height: 140%;
    /* identical to box height, or 28px */

    text-align: center;

    /* Black/3 */

    color: #121527;
  }
  span {
    font-style: normal;
    font-weight: normal;
    font-size: 16px;
    line-height: 160%;
    /* or 26px */

    text-align: center;

    /* Black/2 */

    color: #757682;
  }
}
</style>
