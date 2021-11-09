<template>
  <section class="aboutUs" id="aboutUs">
    <b-container>
      <div id="moon"></div>
      <b-row class="justify-content-center">
        <b-col lg="10" md="10" sm="12">
          <b-card sub-title="Card subtitle" no-body>
            <template #header>
              <div class="head">
                <span>Tentang Kami</span>
              </div>
            </template>
            <b-card-body>
              <b-card-title class="mt-2">LKP PAZ generasi unggul</b-card-title>
              <b-card-text class="mt-5">
                <em>"</em> Lorem ipsum dolor sit amet consectetur adipisicing
                elit. Rerum officiis ipsam natus aspernatur eaque dolor adipisci
                neque aliquid voluptates quaerat, voluptatum, quibusdam
                doloribus alias vitae, explicabo consectetur et. Vero,
                commodi.<em>"</em>
              </b-card-text>
            </b-card-body>

            <div class="card-body text-center mt-4">
              <div class="row">
                <div class="col-sm-4 mt-4">
                  <div class="d-inline-flex">
                    <h5 class="mr-2 student">150x</h5>
                  </div>
                  <p class="text-muted text-truncate mb-0">event pelatihan</p>
                </div>

                <div class="col-sm-4 mt-4">
                  <div class="d-inline-flex">
                    <h5 class="mr-2 student">11k</h5>
                  </div>
                  <p class="text-muted text-truncate mb-0">alumni pelatihan</p>
                </div>

                <div class="col-sm-4 mt-4">
                  <div class="d-inline-flex">
                    <h5 class="mr-2 student">50+</h5>
                  </div>
                  <p class="text-muted text-truncate mb-0">griya sehat PAZ</p>
                </div>
              </div>
            </div>
          </b-card>
        </b-col>
      </b-row>
      <div id="shape">
        <div id="moons"></div>
      </div>
    </b-container>
  </section>
</template>

<script>
export default {};
</script>

<style lang="scss" scoped>
@media (max-width: 575.98px) {
  .card-body {
    h4.card-title {
      font-size: 30px;
      font-weight: 700;
    }
    p.card-text {
      font-size: 16px;
      margin-top: 20px !important;
    }
  }

  .card-body.text-center {
    padding-top: 0;

    margin-top: 0 !important;
    .row {
      h5.student {
        font-size: 30px;
      }
      p.text-muted {
        font-size: 16px;
      }
    }
  }
}

section {
  margin-top: 100px;
}

#moon {
  font-size: 20em;
  display: inline-block;
  width: 0.4em;
  box-sizing: content-box;
  height: 0.4em;
  border: 0.3em solid #fd7d24;
  position: absolute;
  left: -164px;
  opacity: 0.1;
  border-radius: 50%;
}

#shape {
  position: absolute;
  right: 0;
  top: 1080px;
  overflow: hidden;
  width: 60px;
}

#moons {
  font-size: 20em;
  display: inline-block;
  width: 0.2em;
  box-sizing: content-box;
  height: 0.2em;
  border: 0.1em solid #fd7d24;
  opacity: 0.1;
  border-radius: 50%;
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
  text-transform: uppercase;
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

.student {
  font-size: 60px;
  font-style: normal;
  font-weight: 700;
  line-height: 60px;
  letter-spacing: 0px;
  text-align: center;
  color: #fd7d24;
}

.text-muted {
  font-size: 20px;
  font-style: normal;
  font-weight: 400;
  line-height: 20px;
  letter-spacing: 0px;
  text-align: center;
  color: #aaacba;
  text-transform: capitalize;
}
</style>
