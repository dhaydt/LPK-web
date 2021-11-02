<template>
  <section class="liputan">
    <b-container>
      <b-row class="justify-content-center">
        <b-col md="7">
          <div class="head">
            <span>liputan media</span>
          </div>
          <h2 class="mt-4 pt-2">
            Dapatkan informasi tentang kegiatan yang telah kami selenggarakan
            disini
          </h2>
          <router-link to="/liputan">
            <b-button variant="outline-success seemore" class="mt-4 pt-2 px-4"
              ><span
                ><img
                  src="../../assets/images/blog.png"
                  alt="info"
                  height="25"
                />
                Lihat semua</span
              ></b-button
            ></router-link
          >
        </b-col>
      </b-row>
      <b-row class="cardNews" style="max-height: 434px !important;">
        <LiputanCard></LiputanCard>
      </b-row>
    </b-container>
  </section>
</template>
<script>
import LiputanCard from "./liputanCard";
export default {
  components: { LiputanCard },
};
</script>
<style lang="scss" scoped>
#moon {
  font-size: 20em;
  display: inline-block;
  width: 0.4em;
  box-sizing: content-box;
  height: 0.4em;
  background-color: #fd7d24;
  border: 0.3em solid #fd7d24;
  position: absolute;
  left: -264px;
  opacity: 0.1;
  top: 300px;
}

#shape {
  position: absolute;
  right: 0;
  top: 1700px;
  width: 60px;
  overflow: hidden;
}

#moons {
  font-size: 20em;
  display: inline-block;
  width: 0.2em;
  box-sizing: content-box;
  height: 0.2em;
  border: 0.1em solid #fd7d24;
  background-color: #fd7d24;
  opacity: 0.1;
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

h2 {
  font-style: normal;
  font-weight: 600;
  text-transform: capitalize;
  color: #2e3e5c;
  text-align: center;
  letter-spacing: 0.5px;
}
</style>
