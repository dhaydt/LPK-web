<template>
  <div class="landing">
    <b-jumbotron class="w-100 home" style="overflow: hidden">
      <div id="shape">
        <div id="moon"></div>
      </div>
      <div id="moontoon"></div>
      <template #header>
        <h1 class="head">LKP PAZ generasi unggul</h1>
      </template>

      <template #lead>
        <b-row class="justify-content-center">
          <b-col sm="12" md="9">
            <p>
              PAZ Generasi Unggul merupakan lembaga yang mengelola dan
              meneruskan pengajaran temuan Hak Cipta Intelektual dari Ustadz
              Haris Moedjahid Rahimahullah berupa Ilmu Pengobatan dan Konsep
              hidup Ala PAZ Al Kasaw.
            </p>
          </b-col>
        </b-row>
      </template>

      <b-button variant="outline-light" href="#" class="mt-2"
        ><span
          ><img src="../../assets/images/info.svg" alt="info" height="25" />
          Pelajari lebih lanjut</span
        ></b-button
      >
    </b-jumbotron>
    <section id="home">
      <b-row no-gutters class="justify-content-center">
        <b-col md="3" sm="12" class="mr-2">
          <b-img-lazy
            src="/assets/images/potrait1.png"
            fluid-grow
            alt="Responsive image"
            class="h-100 w-100 imgPort"
          />
        </b-col>
        <b-col md="4" sm="12">
          <b-row style="height:50%; width: 100%;" class="mb-2" no-gutters>
            <b-img-lazy
              src="/assets/images/land1.png"
              fluid
              alt="Responsive image"
              class="h-100 imgLand w-100"
            />
          </b-row>
          <b-row style="height: 48%; width: 100%;" no-gutters>
            <b-img-lazy
              src="/assets/images/land2.png"
              fluid
              alt="Responsive image"
              class="h-100 imgLand w-100"
            />
          </b-row>
        </b-col>
        <b-col md="3" sm="12"
          ><b-img-lazy
            src="/assets/images/potrait2.png"
            fluid
            alt="Responsive image"
            class="w-100 h-100 imgPort last"
        /></b-col>
      </b-row>
    </section>
  </div>
</template>

<script>
export default {
  data() {
    return {};
  },
};
</script>

<style lang="scss" scoped>
.imgPort {
  max-width: 340px;
  max-height: 500px;
}

.imgPort.last {
  margin-left: 10px;
}

.imgLand {
  max-width: 528px;
  max-height: 244;
}

#shape {
  position: absolute;
  top: -98px;
  right: 0;
  overflow: hidden;
  width: 130px;
}
#moon {
  font-size: 20em;
  display: inline-block;
  width: 0.4em;
  box-sizing: content-box;
  height: 0.4em;
  border: 0.2em solid #fff;

  opacity: 0.1;
  border-radius: 50%;
}

#moontoon {
  font-size: 20em;
  display: inline-block;
  width: 0.4em;
  box-sizing: content-box;
  height: 0.4em;
  border: 0.3em solid #fff;
  position: absolute;
  top: 142px;
  left: -149px;
  opacity: 0.1;
  border-radius: 50%;
}

.jumbotron {
  // background-color: #07a148;
  border-radius: 0;
  height: 828px;
  min-height: 528px;
  background: linear-gradient(
    181.98deg,
    #07a148 26.57%,
    rgba(7, 161, 72, 0) 283.01%
  );
}

h1 {
  font-weight: 700;
  font-size: 60px;
  font-style: normal;
  line-height: 43px;
  color: #fff;
  text-transform: uppercase;
  margin-top: 107px;
}

p {
  font-weight: 400;
  font-style: normal;
  font-size: 20px;
  color: #fff;
}

span {
  font-weight: 600;
  font-style: normal;
  font-size: 16px;
  line-height: 19.36px;
  letter-spacing: 1px;
  color: #fff;
}

.btn:hover {
  background-color: #07a148;
}

section {
  margin-top: -380px;
}
</style>
