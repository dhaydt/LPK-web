<template>
  <div class="beforeFoot">
    <section>
      <b-row>
        <b-col md="5" sm="12">
          <b-img
            src="/assets/images/callus.png"
            height="624"
            class="img-foot"
          ></b-img>
        </b-col>
        <b-col md="7" sm="12">
          <b-container class="h-100">
            <b-row class="align-items-center h-100 justify-content-center">
              <b-col class="right-col text-left">
                <h1>Tertarik mengikuti pelatihan PAZ?</h1>
                <p>
                  Pelatihan PAZ yang diselenggarakan dibimbing oleh para
                  instruktur terbaik kami. Jika anda tertarik mengikuti
                  pelatihan PAZ, anda dapat cek jadwal pelatihan PAZ yang akan
                  datang.
                </p>
                <router-link to="/pelatihan">
                  <button class="btn">
                    Cek Jadwal Pelatihan
                  </button>
                </router-link>
              </b-col>
            </b-row>
          </b-container>
        </b-col>
      </b-row>
    </section>
  </div>
</template>

<script>
export default {};
</script>

<style lang="scss" scoped>
.right-col h1 {
  font-style: normal;
  font-weight: 600;
  font-size: 34px;
  margin-bottom: 20px;
  letter-spacing: 0.5px;
  color: #ffffff;
}

.right-col p {
  font-style: normal;
  font-weight: normal;
  font-size: 24px;
  margin-bottom: 40px;
  color: #ffffff;
}

.right-col button.btn {
  background-color: #fff;
  font-weight: 600;
  font-size: 16px;
  letter-spacing: 0.04em;
  color: #07a148;
  border: none;
  border-radius: 4px;
  padding: 14px 57px;
  transition: 0.3s;
}

.right-col a .btn:hover {
  background-color: #fd7d24;
  color: #fff;
}

.beforeFoot {
  margin-top: 180px;
}
section {
  max-height: 512px;
  background: linear-gradient(
    181.98deg,
    #07a148 26.57%,
    rgba(7, 161, 72, 0) 283.01%
  );
}

.img-foot {
  margin-top: -112px;
}
</style>
