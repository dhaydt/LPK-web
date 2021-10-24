<template>
  <footer>
    <b-container class="p-4 pt-5">
      <b-row cols-md="4">
        <b-col>
          <b-row>
            <b-img src="/assets/images/logo/pgu-col-sm.png" height="93"></b-img>
            <span class="mt-2">Klaten, Indonesia</span>
          </b-row>
        </b-col>
        <b-col>
          <b-row>
            <h3>About Us</h3>
          </b-row>
          <b-row class="flex-column text-left">
            <router-link to="/aboutus">Visi Misi</router-link>
            <router-link to="/aboutus">Legalitas</router-link>
            <router-link to="/aboutus">Struktur LKP</router-link>
            <router-link to="#">Liputan Media</router-link>
            <router-link to="/aboutus">Data Cabang</router-link>
          </b-row>
        </b-col>
        <b-col>
          <b-row>
            <h3>Instruktur</h3>
          </b-row>
          <b-row class="flex-column text-left">
            <router-link to="/instruktur">Instruktur PAZ</router-link>
            <router-link to="/instruktur">Kurikulum Pendidikan</router-link>
            <h3 class="mt-2">Pelatihan</h3>
            <router-link to="/pelatihan">Jadwal pelatihan</router-link>
            <router-link to="/galeri">Galeri Foto</router-link>
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
  // height: 489px;
}
footer {
  background: #fbfbfb;
}

span {
  font-weight: normal;
  font-size: 16px;
  color: #121527;
}

h3 {
  font-style: normal;
  font-weight: bold;
  font-size: 20px;
  line-height: 28px;
  color: #121527;
}

.row a {
  font-weight: normal;
  font-size: 16px;
  color: #757682;
}

.row a:hover {
  color: #099644;
}

p i {
  font-size: 1.1rem;
  color: #757682;
  background: #e9e9e9;
  padding: 4px 6px;
  border-radius: 50%;
  border: 2px solid #e9e9e9;
}

p em {
  font-style: normal;
  font-weight: normal;
  font-size: 16px;
  line-height: 24px;
  color: #757682;
}

.sosmed {
  font-size: 1.3rem;
  padding: 3px 10px;
  color: #fff;
  margin-right: 10px;
  background: #e9e9e9;
  border: 1px solid rgba(255, 255, 255, 0.2);
  border-radius: 50%;
}

.sosmed:hover {
  background-color: rgb(155, 155, 155);
  i {
    color: #099644;
  }
}

.foot {
  border-top: 1px solid #e9e9e9;
}

.foot .mt-4 span {
  font-family: Inter;
  font-style: normal;
  font-weight: 500;
  font-size: 20px;
  text-align: center;
  letter-spacing: 0.01em;
  color: #757682;
}
</style>
