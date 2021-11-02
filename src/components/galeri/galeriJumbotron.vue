<template>
  <div class="galeriJumbotron">
    <b-jumbotron>
      <!-- <div id="moon"></div> -->
      <div id="moontoon"></div>
      <b-row class="justify-content-center align-items-center h-100">
        <b-col md="10" sm="12">
          <div id="header">
            <h1>Galeri</h1>
          </div>

          <div id="subheader" class="mt-4">
            <p>
              Kumpulan dari beberapa album foto dokumentasi kegiatan PAZ seperti
              pelatihan dan juga kopdar (pertemuan rutin) antar alumni pelatihan
              di beberapa daerah aktif PAZ
            </p>
          </div>
        </b-col>
      </b-row>
    </b-jumbotron>
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
  height: 459px;
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
  text-transform: uppercase;
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
  margin-top: -50vh;
}
</style>
