<template>
  <div class="pengayaan">
    <section>
      <b-container>
        <div class="header">
          <h1 class="d-block text-left">PAZ Pengayaan</h1>
          <h4 class="d-block text-left">
            Tambahan materi supplement bagi paztrooper
          </h4>
        </div>
        <b-row cols-md="2">
          <b-col v-for="(pe, i) in pengayaan" :key="i">
            <b-card>
              <b-img-lazy :src="pe.img" height="104" width="104"></b-img-lazy>

              <div class="card-title mt-4">{{ pe.title }}</div>
              <div class="card-text mt-2">{{ pe.content }}</div>
            </b-card>
          </b-col>
        </b-row>
      </b-container>
    </section>
  </div>
</template>

<script>
export default {
  data() {
    return {
      pengayaan: [
        {
          img: "/assets/images/quran.png",
          title: "pengajian",
          content: "Belajar tahsin bersama kami",
        },
        {
          img: "/assets/images/people.png",
          title: "enterpreneur",
          content: "Belajar Bisnis bersama kami",
        },
      ],
    };
  },
};
</script>

<style lang="scss" scoped>
.card {
  background: #ffffff;
  /* 3 */

  box-shadow: 0px 16px 24px rgba(0, 0, 0, 0.06), 0px 2px 6px rgba(0, 0, 0, 0.04),
    0px 0px 1px rgba(0, 0, 0, 0.04);
  border-radius: 4px;
}
.card-title {
  font-style: normal;
  font-weight: 600;
  font-size: 20px;
  line-height: 140%;
  text-transform: capitalize;
  text-align: center;
  color: #121527;
}

.card-text {
  font-style: normal;
  font-weight: normal;
  font-size: 16px;
  line-height: 160%;
  text-transform: capitalize;
  text-align: center;
  color: #757682;
}
.pengayaan {
  margin-top: 80px;
}

.header h1 {
  font-style: normal;
  font-weight: 600;
  font-size: 32px;
  line-height: 140%;
  /* identical to box height, or 45px */

  letter-spacing: 0.5px;

  /* Black/3 */

  color: #121527;
}

.header h4 {
  font-style: normal;
  font-weight: normal;
  font-size: 20px;
  line-height: 160%;
  /* identical to box height, or 32px */

  /* Black/2 */

  color: #757682;
}
</style>
