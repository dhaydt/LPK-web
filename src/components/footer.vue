<template>
  <footer>
    <b-row cols-md="5" cols-sm="2" class="foots">
      <b-col md="3" class="foot-img">
        <b-row no-gutters>
          <b-img src="/assets/images/logo/pgu-col-sm.png" height="93"></b-img>
          <span class="mt-2">Profesional, Beradab, Berdaya Juang</span>
        </b-row>
      </b-col>
      <b-col md="2" class="foot-menu">
        <b-row>
          <h3>About Us</h3>
        </b-row>
        <b-row class="flex-column text-left">
          <router-link to="/aboutus">Visi Misi</router-link>
          <router-link to="/aboutus">Legalitas</router-link>
          <router-link to="/aboutus">Struktur LKP</router-link>
          <router-link to="/liputan">Liputan Media</router-link>
          <router-link to="/aboutus">Data Cabang</router-link>
        </b-row>
      </b-col>
      <b-col md="2" class="foot-menu">
        <b-row>
          <h3>Instruktur</h3>
        </b-row>
        <b-row class="flex-column text-left">
          <router-link to="/instruktur">Instruktur PAZ</router-link>
          <router-link to="/instruktur">Kurikulum Pendidikan</router-link>
          <h3 class="mt-4">Gallery</h3>
          <router-link to="/galeri">Pelatihan</router-link>
          <router-link to="/galeri">Kopdar</router-link>
        </b-row>
      </b-col>

      <b-col md="2" class="foot-menu">
        <b-row>
          <h3>Pelatihan</h3>
        </b-row>
        <b-row class="flex-column text-left">
          <router-link to="/pelatihan">Pelatihan Offline</router-link>
          <router-link to="/pelatihan">Pelatihan Online</router-link>
          <router-link to="/pelatihan">Timeline Pelatihan</router-link>
        </b-row>
      </b-col>
      <b-col md="3" class="foot-menu-last">
        <b-row>
          <h3>Kontak</h3>
        </b-row>
        <b-row class="flex-column text-left">
          <p>
            <i class="fas fa-map-marker-alt mr-3"></i>
            <em>https://g.page/ayubcamp</em>
          </p>
          <p>
            <i class="fas fa-envelope mr-3"></i><em>mail@generasiunggul.com</em>
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
            <router-link to="#"><i class="fab fa-youtube"></i></router-link>
          </div>
        </b-row>
      </b-col>
    </b-row>
    <b-row class="foot mt-4 justify-content-center">
      <b-col md="8" class="mt-4">
        <span>LKP PAZ AL Kasaw © Hak Cipta Dilindungi</span>
      </b-col>
    </b-row>
    <div class="floating">
      <b-button><i class="fab fa-whatsapp"></i> Hubungi Kami</b-button>
    </div>
  </footer>
</template>

<script>
export default {};
</script>

<style lang="scss" scoped>
.row.foots {
  padding: 72px 76px 32px 76px;
}
.floating {
  position: absolute;
  right: 56px;
  bottom: 56px;
  .btn {
    background: #07a148;
    box-shadow: 0px 16px 24px rgba(7, 161, 72, 0.16),
      0px 2px 6px rgba(7, 161, 72, 0.12), 0px 0px 1px rgba(7, 161, 72, 0.12);
    border-radius: 50px;
    border: #07a148;
    padding-right: 34px;

    font-style: normal;
    font-weight: 600;
    font-size: 18px;
    line-height: 28px;
    color: #ffffff;

    .fab {
      margin: 10px 10px 10px 24px;
    }
  }
  .btn:hover {
    background: #fd7d24;
  }
}
footer {
  z-index: 1;
  position: relative;
  padding-bottom: 32px;
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
  margin-top: 15px;
  color: #757682;
}

.row a:hover {
  color: #099644;
}

p {
  margin-top: 5px;
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
  margin: 5px;
  font-size: 1.4rem;
  padding: 4px 10px;
  color: #fff;
  margin-right: 10px;
  background: #e9e9e9;
  border: 1px solid rgba(255, 255, 255, 0.2);
  border-radius: 50%;
  i {
    font-size: 24px;
  }
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
