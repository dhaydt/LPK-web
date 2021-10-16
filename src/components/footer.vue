<template>
  <footer>
    <b-container class="p-4">
      <b-row cols-md="4">
        <b-col>
          <b-row>
            <b-img src="../../assets/images/logo.png"></b-img>
            <span class="mt-4">Klaten, Indonesia</span>
          </b-row>
        </b-col>
        <b-col>
          <b-row>
            <h3>About Us</h3>
          </b-row>
          <b-row class="flex-column text-left">
            <router-link to="#">Visi Misi</router-link>
            <router-link to="#">Legalitas</router-link>
            <router-link to="#">Struktur LKP</router-link>
            <router-link to="#">Liputan Media</router-link>
            <router-link to="#">Data Cabang</router-link>
          </b-row>
        </b-col>
        <b-col>
          <b-row>
            <h3>Instruktur</h3>
          </b-row>
          <b-row class="flex-column text-left">
            <router-link to="#">Instruktur PAZ</router-link>
            <router-link to="#">Kurikulum Pendidikan</router-link>
            <h3 class="mt-2">Pelatihan</h3>
            <router-link to="#">Jadwal pelatihan</router-link>
            <router-link to="#">Galeri Foto</router-link>
          </b-row>
        </b-col>
        <b-col>
          <b-row>
            <h3>Kontak</h3>
          </b-row>
          <b-row class="flex-column text-left">
            <p>
              <i class="fas fa-map-marker-alt mr-3"></i>
              <em>Klaten, Indonesia</em>
            </p>
            <p>
              <i class="fas fa-envelope mr-3"></i><em>Pazztrooper@gmail.com</em>
            </p>
            <p>
              <i class="fas fa-mobile-alt mr-3 px-2"></i><em>020-10 00 15</em>
            </p>
          </b-row>
          <b-row>
            <div class="sosmed">
              <router-link to="#"><i class="fab fa-instagram"></i></router-link>
            </div>
            <div class="sosmed">
              <router-link to="#"
                ><i class="fab fa-facebook-f px-1"></i
              ></router-link>
            </div>
            <div class="sosmed">
              <router-link to="#"
                ><i class="fab fa-linkedin-in"></i
              ></router-link>
            </div>
          </b-row>
        </b-col>
      </b-row>
      <b-row class="foot mt-4 justify-content-center">
        <b-col md="8" class="mt-4">
          <span>LKP PAZ AL Kasaw © Hak Cipta Dilindungi</span>
        </b-col>
      </b-row>
    </b-container>
  </footer>
</template>

<script>
export default {};
</script>

<style lang="scss" scoped>
footer {
  z-index: 1;
  position: relative;
}
footer {
  background-color: #04162c;
}

span {
  font-size: 1.2rem;
  font-style: normal;
  font-weight: 400;
  line-height: 20px;
  letter-spacing: 0em;
  text-align: left;
  color: #fff;
}

h3 {
  font-size: 1.3rem;
  font-style: normal;
  font-weight: 600;
  line-height: 28px;
  letter-spacing: 0em;
  text-align: left;
  color: #fff;
}

.row a {
  // font-size: 20px;
  font-style: normal;
  font-weight: 500;
  line-height: 20px;
  letter-spacing: 0em;
  text-align: left;
  text-transform: capitalize;
  color: #fff;
  margin-top: 15px;
}

.row a:hover {
  color: #099644;
}

p i {
  font-size: 1.1rem;
  color: #000;
  background-color: #fff;
  padding: 4px 6px;
  border-radius: 50%;
  border: 1px solid #fff;
}

p em {
  font-style: normal;
  font-weight: 400;
  line-height: 32px;
  letter-spacing: 0em;
  text-align: left;
  color: #fff;
}

.sosmed {
  font-size: 1.3rem;
  padding: 3px 10px;
  color: #fff;
  margin-right: 10px;
  background-color: rgba(255, 255, 255, 0.2);
  border: 1px solid rgba(255, 255, 255, 0.2);
  border-radius: 50%;
}

.sosmed:hover {
  background-color: #fff;
  i {
    color: #099644;
  }
}

.foot {
  border-top: 1px solid rgba(255, 255, 255, 0.4);
}
</style>
