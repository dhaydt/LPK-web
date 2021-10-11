<template>
  <div>
    <div id="moon"></div>
    <div id="moontoon"></div>
    <b-jumbotron>
      <template #header>
        <h1>LPK PAZ AL KASAW</h1>
      </template>

      <template #lead>
        <h4>Mencetak Paztrooper Profesional, Beradab, dan Berdaya Juang</h4>
      </template>

      <b-button variant="outline-light" href="#" class="mt-4"
        ><span
          ><img src="../../assets/images/info.svg" alt="info" height="25" />
          Pelajari lebih lanjut</span
        ></b-button
      >
    </b-jumbotron>
    <section>
      <b-container>
        <b-row no-gutters class="justify-content-center">
          <b-col md="3" class="mr-2">
            <b-img src="/assets/images/potrait1.png" fluid-grow alt="Responsive image" class="h-100" />
          </b-col>
          <b-col md="4">
            <b-row style="height:50%" class="mb-2">
              <b-col><b-img src="/assets/images/land1.png" fluid alt="Responsive image" class="h-100" /></b-col>
            </b-row>
            <b-row style="height: 48%">
              <b-col><b-img src="/assets/images/land2.png" fluid alt="Responsive image" class="h-100" /></b-col>
            </b-row>
          </b-col>
          <b-col md="3" class="ml-2"><b-img src="/assets/images/potrait2.png" fluid alt="Responsive image" class="h-100" /></b-col>
        </b-row>
      </b-container>
    </section>
  </div>
</template>

<script>
export default {
  data() {
    return {}
  },
};
</script>

<style lang="scss" scoped>
#moon {
  font-size: 20em;
  display: inline-block;
  width: 0.4em;
  box-sizing: content-box;
  height: 0.4em;
  border: 0.3em solid #fff;
  position: absolute;
  top: -138px;
  right: -138px;
  opacity: 15% !important;
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
  opacity: 15% !important;
  border-radius: 50%;
}

.jumbotron {
  // background-color: #07a148;
  border-radius: 0;
  height: 110vh;
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
  line-height: 73px;
  color: #fff;
  margin-top: 10vh;
}

h4 {
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
  margin-top: -50vh;
}
</style>
