<template>
  <section>
    <b-container>
      <b-row class="justify-content-center">
        <b-col lg="9">
          <b-card sub-title="Card subtitle" no-body>
            <template #header>
              <div class="head">
                <span>Tentang Kami</span>
              </div>
            </template>

            <b-card-body>
              <b-card-title>LPK PAZ AL KASAW</b-card-title>
              <b-card-text class="mt-2">
                <em>"</em> Lorem ipsum dolor sit amet consectetur adipisicing
                elit. Rerum officiis ipsam natus aspernatur eaque dolor adipisci
                neque aliquid voluptates quaerat, voluptatum, quibusdam
                doloribus alias vitae, explicabo consectetur et. Vero,
                commodi.<em>"</em>
              </b-card-text>
            </b-card-body>

            <!-- <a href="#" class="card-link">Card link</a> -->
            <!-- <b-link href="#" class="card-link">Another link</b-link> -->
          </b-card>
        </b-col>
      </b-row>
    </b-container>
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
  color: #757682;

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
</style>
