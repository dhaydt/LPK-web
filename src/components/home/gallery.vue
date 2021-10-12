<template>
  <section class="mb-4">
    <b-container>
      <b-row class="justify-content-center">
        <b-col lg="9">
          <b-card sub-title="Card subtitle" no-body>
            <template #header>
              <div class="head">
                <span>Galeri pelatihan</span>
              </div>
            </template>

            <b-card-body>
              <b-card-title>PELATIHAN YANG KAMI SELENGGARAKAN</b-card-title>
              <b-card-text class="mt-4">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit ut
                aliquam, purus sit amet luctus venenatis, lectus magna fringilla
                urna
              </b-card-text>
              <b-button
                variant="outline-success seemore"
                href="#"
                class="mt-4 px-4"
                ><span
                  ><img
                    src="../../assets/images/pict.svg"
                    alt="info"
                    height="25"
                  />
                  Lihat semua foto</span
                ></b-button
              >
            </b-card-body>
          </b-card>
        </b-col>
      </b-row>
    </b-container>
    <b-row class="justify-content-center">
      <b-col md="10">
        <div class="card-body border-top text-center">
          <b-row cols-md="4" cols-sm="2">
            <b-col
              ><b-img
                src="../../assets/images/potrait3.png"
                alt="gallery"
              ></b-img
            ></b-col>
            <b-col
              ><b-img
                src="../../assets/images/potrait4.png"
                alt="gallery"
              ></b-img
            ></b-col>
            <b-col
              ><b-img
                src="../../assets/images/potrait5.png"
                alt="gallery"
              ></b-img
            ></b-col>
            <b-col
              ><b-img
                src="../../assets/images/potrait6.png"
                alt="gallery"
              ></b-img
            ></b-col>
          </b-row>
        </div>
      </b-col>
    </b-row>
  </section>
</template>

<script>
export default {};
</script>

<style lang="scss" scoped>
section {
  margin-top: 100px;
}

.card {
  border: none;
  box-shadow: none;
}

.card-header {
  background-color: transparent;
}

.card-title {
  font-size: 32px;
  font-style: normal;
  font-weight: 600;
  line-height: 45px;
  letter-spacing: 0.5px;
  text-align: center;
  color: #2e3e5c;
}

.card-text {
  font-size: 24px;
  font-style: normal;
  font-weight: 400;
  line-height: 38px;
  letter-spacing: 0px;
  text-align: center;
  color: #686870;
}

em {
  font-size: 20px;
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
</style>
