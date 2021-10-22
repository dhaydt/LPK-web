<template>
  <div class="dash">
    <Header :title="title" :items="items"></Header>
    <b-card>
      <b-row class="justify-content-center">
        <router-link
          to="/admin/loker/status"
          v-b-tooltip.hover
          title="Kembali ke list"
          style="font-size:20px; color: #636e76"
          ><i class="fas fa-arrow-left mr-2"></i
        ></router-link>
        <b-col md="8">
          <b-alert
            :show="dismissCountDown"
            dismissible
            :variant="variant"
            @dismissed="dismissCountDown = 0"
            @dismiss-count-down="countDownChanged"
          >
            <p>{{ messages }}</p>
            <b-progress
              variant="variant"
              :max="dismissSecs"
              :value="dismissCountDown"
              height="4px"
            ></b-progress>
          </b-alert>
          <b-card class="text-right">
            <b-row>
              <b-col md="2" class="text-left"></b-col>
              <b-col md="10">
                <b-avatar
                  button
                  variant="success"
                  @click="onClick"
                  v-b-tooltip.hover
                  title="Ubah status pelamar"
                  class="align-baseline"
                  ><i class="fas fa-user-edit"></i></b-avatar
              ></b-col>
            </b-row>

            <b-modal ref="my-modal" hide-footer title="Ubah status pelamar">
              <div class="d-block text-center">
                <b-card>
                  <b-row>
                    <b-col md="6">
                      <h6>
                        Status sekarang:
                      </h6>
                    </b-col>
                    <b-col md="6">
                      <h6>
                        <b-badge variant="success p-2"
                          >{{ data.status }}
                        </b-badge>
                      </h6>
                    </b-col>
                    <b-col md="12">
                      <b-input-group prepend="Ubah status">
                        <b-form-select
                          v-model="status"
                          :options="options"
                        ></b-form-select>
                      </b-input-group>
                    </b-col>
                  </b-row>
                </b-card>
              </div>
              <b-button
                @click="updateStatus"
                class="mt-2"
                variant="outline-warning"
                block
                >Update Status</b-button
              >
            </b-modal>

            <b-form class="text-left">
              <b-form-group
                label="ID Pelamar"
                label-for="id"
                class="w-100 mb-3"
              >
                <b-form-input
                  id="id"
                  :value="data.id"
                  class="ml-2 w-100"
                  readonly
                ></b-form-input> </b-form-group
              ><b-form-group label="Nama" label-for="nama">
                <b-form-input
                  id="nama"
                  :value="data.nama"
                  class="ml-2 w-100"
                  readonly
                ></b-form-input> </b-form-group
              ><b-form-group
                label="Posisi yang dilamar"
                label-for="nama12"
                class="w-100 mb-3"
              >
                <b-form-input
                  id="nama12"
                  :value="data.judul"
                  class="ml-2"
                  readonly
                ></b-form-input> </b-form-group
              ><b-form-group
                label="Status Pelamar"
                label-for="nama11"
                class="w-100 mb-3"
              >
                <h5 class="text-right">
                  <b-badge
                    variant="success"
                    size="md"
                    style="text-transform: capitalize; padding: 8px;"
                    >{{ data.status }}
                  </b-badge>
                </h5> </b-form-group
              ><b-form-group
                label="WhatsApp Pelamar"
                label-for="wa"
                class="w-100 mb-3"
              >
                <b-form-input
                  id="wa"
                  :value="data.wa"
                  class="ml-2"
                  readonly
                ></b-form-input> </b-form-group
              ><b-form-group
                label="Tempat lahir"
                label-for="tempat"
                class="w-100 mb-3"
              >
                <b-form-input
                  id="tempat"
                  :value="data.tempat_lhr"
                  class="ml-2"
                  readonly
                ></b-form-input> </b-form-group
              ><b-form-group
                label="Tanggal Lahir"
                label-for="tgl"
                class="w-100 mb-3"
              >
                <b-form-input
                  id="tgl"
                  :value="data.tgl_lhr | moment(`MMMM Do YYYY`)"
                  class="ml-2"
                  readonly
                ></b-form-input> </b-form-group
              ><b-form-group
                label="Bahasa yang dikuasai"
                label-for="bahasa"
                class="w-100 mb-3"
              >
                <b-form-input
                  id="bahasa"
                  :value="data.bahasa"
                  class="ml-2"
                  readonly
                ></b-form-input> </b-form-group
              ><b-form-group
                label="Menguasai Komputer"
                label-for="kmptr"
                class="w-100 mb-3"
              >
                <b-form-input
                  id="kmptr"
                  :value="data.komputer"
                  class="ml-2"
                  readonly
                ></b-form-input> </b-form-group
              ><b-form-group
                label="Profil Instagram"
                label-for="ig"
                class="w-100 mb-3"
              >
                <b-form-input
                  id="ig"
                  :value="data.instagram"
                  class="ml-2"
                  readonly
                ></b-form-input> </b-form-group
              ><b-form-group
                label="Profil Facebook"
                label-for="fb"
                class="w-100 mb-3"
              >
                <b-form-input
                  id="fb"
                  :value="data.facebook"
                  class="ml-2"
                  readonly
                ></b-form-input> </b-form-group
              ><b-form-group
                label="E-mail Pelamar"
                label-for="email"
                class="w-100 mb-3"
              >
                <b-form-input
                  id="email"
                  :value="data.email"
                  class="ml-2"
                  readonly
                ></b-form-input> </b-form-group
              ><b-form-group
                label="Domisili"
                label-for="nama1"
                class="w-100 mb-3"
              >
                <b-form-input
                  id="nama1"
                  :value="data.domisili"
                  class="ml-2"
                  readonly
                ></b-form-input> </b-form-group
              ><b-form-group
                label="Provinsi"
                label-for="nama2"
                class="w-100 mb-3"
              >
                <b-form-input
                  id="nama2"
                  :value="data.provinsi"
                  class="ml-2"
                  readonly
                ></b-form-input> </b-form-group
              ><b-form-group
                label="Kelamin"
                label-for="nama3"
                class="w-100 mb-3"
              >
                <b-form-input
                  id="nama3"
                  :value="data.kelamin"
                  class="ml-2"
                  readonly
                ></b-form-input> </b-form-group
              ><b-form-group
                label="Pendidikan Pelamar"
                label-for="nama4"
                class="w-100 mb-3"
              >
                <b-form-input
                  id="nama4"
                  :value="data.pendidikan"
                  class="ml-2"
                  readonly
                ></b-form-input> </b-form-group
              ><b-form-group
                label="Jurusan Pelamar"
                label-for="nama5"
                class="w-100 mb-3"
              >
                <b-form-input
                  id="nama5"
                  :value="data.jurusan"
                  class="ml-2"
                  readonly
                ></b-form-input> </b-form-group
              ><b-form-group
                label="Agama Pelamar"
                label-for="nama6"
                class="w-100 mb-3"
              >
                <b-form-input
                  id="nama6"
                  :value="data.agama"
                  class="ml-2"
                  readonly
                ></b-form-input> </b-form-group
              ><b-form-group
                label="Pengalaman Pelamar"
                label-for="nama7"
                class="w-100 mb-3"
              >
                <b-form-input
                  id="nama7"
                  :value="data.pengalaman"
                  class="ml-2"
                  readonly
                ></b-form-input> </b-form-group
              ><b-form-group
                label="Alasan kami menerima Pelamar"
                label-for="nama8"
                class="w-100 mb-3"
              >
                <span
                  id="nama8"
                  v-html="data.alasan"
                  class="ml-2 form-control"
                ></span>
              </b-form-group>
              <b-form-group
                label="Foto Pelamar"
                label-for="nama91"
                class="w-100 mb-3"
              >
                <b-img
                  :src="pdfUrl + data.foto"
                  class="ml-2"
                  height="200"
                  v-b-tooltip.hover
                  title="Foto pelamar"
                ></b-img>
              </b-form-group>
              <b-form-group
                label="Foto KTP"
                label-for="nama92"
                class="w-100 mb-3"
              >
                <b-img
                  :src="pdfUrl + data.ktp"
                  class="ml-2"
                  height="200"
                  v-b-tooltip.hover
                  title="Foto KTP"
                ></b-img>
              </b-form-group>
              <b-form-group
                label="Foto Ijazah"
                label-for="nama93"
                class="w-100 mb-3"
              >
                <b-img
                  :src="pdfUrl + data.ijazah"
                  class="ml-2"
                  height="200"
                  v-b-tooltip.hover
                  title="Foto Ijazah"
                ></b-img>
              </b-form-group>
              <b-form-group
                label="Foto Sertifikat"
                label-for="nama94"
                class="w-100 mb-3"
              >
                <b-img
                  :src="pdfUrl + data.sertifikat"
                  class="ml-2"
                  height="200"
                  v-b-tooltip.hover
                  title="Foto pelamar"
                ></b-img>
              </b-form-group>
              <b-form-group
                label="Foto SKCK"
                label-for="nama95"
                class="w-100 mb-3"
              >
                <b-img
                  :src="data.skck ? pdfUrl + data.skck : `null`"
                  class="ml-2"
                  alt="Tidak tersedia"
                  height="200"
                  v-b-tooltip.hover
                  title="Foto pelamar"
                ></b-img>
              </b-form-group>
              <b-form-group
                label="Portfolio Pelamar"
                label-for="nama9"
                class="w-100 mb-3"
              >
                <a
                  :href="pdfUrl + data.portfolio"
                  target="_blank"
                  class="form-control ml-2"
                  v-b-tooltip.hover
                  title="Lihat Portfolio"
                  ><i
                    class="fas fa-file-pdf mr-4"
                    style="color: red; font-size: 20px;"
                  ></i
                  >{{ data.portfolio }}</a
                >
              </b-form-group>
              <b-form-group
                label="Pertanyaan Kuis"
                label-for="nama99"
                class="w-100 mb-3"
              >
                <b-form-input
                  v-for="(p, i) in data.pertanyaan
                    ? JSON.parse(data.pertanyaan)
                    : 'kosong'"
                  :key="i"
                  id="nama99"
                  :value="i + 1 + '. ' + p"
                  class="ml-2"
                  readonly
                ></b-form-input>
              </b-form-group>
              <b-form-group
                label="Jawaban Kuis"
                label-for="nama99"
                class="w-100 mb-3"
              >
                <b-form-input
                  v-for="(p, key, i) in data.jawaban
                    ? JSON.parse(data.jawaban)
                    : 'kosong'"
                  :key="key"
                  id="nama99"
                  :value="
                    p ? i + 1 + '. ' + p : i + 1 + '. ' + `(tidak di jawab)`
                  "
                  class="ml-2"
                  readonly
                ></b-form-input>
              </b-form-group>
            </b-form>
          </b-card>
        </b-col>
      </b-row>
    </b-card>
  </div>
</template>

<script>
import axios from "axios";
import Header from "../../../../components/admin/partials/page-header";
export default {
  data() {
    return {
      data: [],
      pdfUrl: "",
      updateUrl: "",
      status: "",
      options: [
        { text: "Lamaran Masuk", value: "lamaran masuk" },
        { text: "Proses ADM", value: "Proses ADM" },
        { text: "Interview", value: "Interview" },
        { text: "Pengumuman", value: "Pengumuman" },
      ],
      title: "Data Pelamar",
      items: [
        {
          text: "Loker",
          to: "/admin/loker",
        },
        {
          text: "Status",
          to: "/admin/loker/status",
        },
        {
          text: "View Apply",
          active: true,
        },
      ],

      variant: "",
      dismissSecs: 5,
      dismissCountDown: 0,
      messages: "",
    };
  },
  components: {
    Header,
  },

  created() {
    const params = this.$route.params;
    if (params.nama === undefined) {
      this.$router.push("/admin/loker/status");
    } else {
      this.data = params;
      console.log(params);
    }

    this.status = params.status;

    const mainUrl = localStorage.getItem("apiUrl");
    this.updateUrl = mainUrl + "/apply/" + params.id;
    console.log(this.updateUrl);
    this.pdfUrl = mainUrl + "/documents/apply/";
  },

  methods: {
    onClick() {
      this.$refs["my-modal"].show();
    },

    async updateStatus() {
      await axios.put(this.updateUrl, { status: this.status });
      this.messages = "Status di update";
      this.variant = "success";
      this.showAlert();
      this.$refs["my-modal"].hide();
      this.$root.$emit("getVisi");
      this.$router.push("/admin/loker/status");
    },

    countDownChanged(dismissCountDown) {
      this.dismissCountDown = dismissCountDown;
    },
    showAlert() {
      this.dismissCountDown = this.dismissSecs;
    },
  },
};
</script>

<style lang="scss" scoped></style>
