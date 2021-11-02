<template>
  <div class="formData">
    <section class="mt-5">
      <b-container>
        <b-row class="justify-content-center">
          <b-col md="12">
            <form-wizard
              color="#07A148"
              stepSize="sm"
              title=""
              subtitle=""
              validate-on-back
              ref="wizard"
              :start-index.sync="activeTabIndex"
              error-color="#ff4949"
              @on-complete="onComplete"
            >
              <tab-content
                title="Administrasi"
                :before-change="() => validate('firstStep')"
              >
                <b-row class="justify-content-center">
                  <b-col md="10">
                    <b-card class="bio">
                      <Biodata
                        ref="firstStep"
                        @on-validate="onStepValidate"
                      ></Biodata>
                      <b-row class="text-left justify-content-center">
                        <b-col md="12" sm="12">
                          <el-checkbox
                            v-model="next"
                            id="agreement"
                            class="mb-0 agreement"
                            style="line-height: 3;"
                            label="Saya sudah mengisi form lamaran pekerjaan dengan jujur dan sebenar-benarnya."
                          ></el-checkbox>
                        </b-col>
                        <b-col md="6" sm="12" class="navi">
                          <b-button
                            class="w-100 mt-4 kembaliBtn"
                            :to="`/loker/` + $route.params.id"
                            >Kembali</b-button
                          >
                        </b-col>
                        <b-col md="6" sm="12" class="navi">
                          <b-button
                            :disabled="!next"
                            class="w-100 mt-4 lanjutBtn"
                            @click="nextTab"
                            >Lanjut Tes</b-button
                          >
                        </b-col>
                      </b-row>
                    </b-card>
                  </b-col>
                </b-row>
              </tab-content>
              <tab-content
                title="Kuis"
                :before-change="() => validate('secondStep')"
              >
                <FormQuiz
                  v-if="kuis"
                  ref="secondStep"
                  @on-validate="onStepValidate"
                ></FormQuiz>
              </tab-content>
              <tab-content title="Penyelesaian" icon="fas fa-check">
                <b-card>
                  <b-card-text style="font-transform: capitalize;"
                    >Data anda akan segera kami simpan setelah anda mengirim
                    nya.</b-card-text
                  >
                </b-card>
              </tab-content>
              <template slot="footer" slot-scope="props">
                <b-row class="justify-content-start align-items-center">
                  <b-col md="7">
                    <div class="wizard-footer-left">
                      <wizard-button
                        class="d-none"
                        v-if="props.activeTabIndex > 0 && !props.isLastStep"
                        @v-on:click="props.prevTab()"
                        :style="props.fillButtonStyle"
                        >Previous</wizard-button
                      >
                    </div>
                  </b-col>
                  <b-col md="5">
                    <div class="wizard-footer-right">
                      <wizard-button
                        :disabled="!next"
                        v-if="!props.isLastStep"
                        @click.native="props.nextTab()"
                        id="nextBtn"
                        class="wizard-footer-right d-none"
                        :style="props.fillButtonStyle"
                        >Lanjut</wizard-button
                      >

                      <wizard-button
                        v-else
                        id="nextBtn"
                        @click.native="completeConfirm"
                        class="wizard-footer-right finish-button"
                        :style="props.fillButtonStyle"
                      >
                        {{
                          props.isLastStep ? "Kirim Jawaban" : "Next"
                        }}</wizard-button
                      >
                    </div>
                  </b-col>
                </b-row>
              </template>
            </form-wizard>
          </b-col>
          <b-modal v-model="modalComplete" id="modal1">
            <template #modal-title>
              <span class="titleCard">Perhatian</span>
            </template>
            <p class="pcard">
              Apakah anda sudah yakin ingin menyelesaikan dan mengirim hasil
              jawaban dari kuis?
            </p>
            <template #modal-footer>
              <b-row class="w-100">
                <b-col md="6">
                  <b-button
                    block
                    @click="$bvModal.hide('modal1')"
                    class="modalBack"
                    >Kembali</b-button
                  >
                </b-col>
                <b-col md="6">
                  <b-button block @click="onComplete" class="modalNext"
                    >Kirim Jawaban</b-button
                  >
                </b-col>
              </b-row>
            </template>
          </b-modal>
        </b-row>
        <b-modal v-model="modalAkhir" id="modal1">
          <template #modal-title>
            <span class="titleCard">Terima Kasih</span>
          </template>
          <p class="pcard">
            Lamaran pekerjaan anda berupa data diri dan jawaban pre-test telah
            sukses terkirim. Rekap jawaban anda telah kami kirim ke email anda.
          </p>
          <template #modal-footer>
            <b-row class="w-100">
              <b-col md="12">
                <b-button
                  block
                  href="/loker"
                  class="modalNext"
                  variant="success"
                  >Tutup</b-button
                >
              </b-col>
            </b-row>
          </template>
        </b-modal>
      </b-container>
    </section>
  </div>
</template>

<script>
import axios from "axios";
import Biodata from "./biodata";
import FormQuiz from "./formQuiz";
export default {
  data() {
    return {
      modalComplete: false,
      modalAkhir: false,
      next: false,
      finalModel: {
        nama: "",
        kelamin: "",
        tempat_lhr: "",
        tgl_lhr: "",
        agama: "",
        menikah: "",
        wa: "",
        email: "",
        domisili: "",
        provinsi: "",
        pendidikan: null,
        jurusan: "",
        pengalaman: "",
        komputer: "",
        facebook: "",
        instagram: "",
        bahasa: "",
        alasan: "",
        foto: null,
        ktp: null,
        ijazah: null,
        skck: null,
        sertifikat: null,
        portfolio: null,
        loker_id: "",
        status: "",
        pertanyaan: {},
        jawaban: {},
        nilai: {},
      },
      activeTabIndex: 0,
      applyUrl: "",
      kuisUrl: "",
      nextValue: "",
      kuis: false,
    };
  },
  components: {
    Biodata,
    FormQuiz,
  },
  created() {
    const mainUrl = localStorage.getItem("apiUrl");
    this.applyUrl = mainUrl + "/apply/" + this.$route.params.id;
    this.kuisUrl = mainUrl + "/kuisOn";
    this.getKuis();
  },

  mounted() {
    this.$root.$on("previous", this.previous);
    this.$root.$on("next", this.nextTab);
  },
  methods: {
    previous() {
      this.$refs.wizard.prevTab();
      this.kuis = false;
    },
    nextTab() {
      this.$refs.wizard.nextTab();
    },

    async getKuis() {
      const resp = await axios.get(this.kuisUrl);
      console.log(resp.data.data);
      localStorage.setItem("kuis", JSON.stringify(resp.data.data));
    },
    completeConfirm() {
      this.modalComplete = true;
    },
    async onComplete() {
      console.log(this.finalModel);
      let model = new FormData();
      model.append("nama", this.finalModel.nama);
      model.append("tempat_lhr", this.finalModel.tempat_lhr);
      model.append("tgl_lhr", this.finalModel.tgl_lhr);
      model.append("menikah", this.finalModel.menikah);
      model.append("komputer", this.finalModel.komputer);
      model.append("bahasa", this.finalModel.bahasa);
      model.append("instagram", this.finalModel.instagram);
      model.append("facebook", this.finalModel.facebook);
      model.append("wa", this.finalModel.wa);
      model.append("email", this.finalModel.email);
      model.append("domisili", this.finalModel.domisili);
      model.append("provinsi", this.finalModel.provinsi);
      model.append("kelamin", this.finalModel.kelamin);
      model.append("pendidikan", this.finalModel.pendidikan);
      model.append("jurusan", this.finalModel.jurusan);
      model.append("agama", this.finalModel.agama);
      model.append("pengalaman", this.finalModel.pengalaman);
      model.append("alasan", this.finalModel.alasan);
      model.append("loker_id", this.finalModel.loker_id);
      model.append("status", this.finalModel.status);
      model.append("portfolio", this.finalModel.portfolio);
      model.append("foto", this.finalModel.foto);
      model.append("ktp", this.finalModel.ktp);
      model.append("ijazah", this.finalModel.ijazah);
      model.append("sertifikat", this.finalModel.sertifikat);
      model.append("skck", this.finalModel.skck);
      model.append("pertanyaan", JSON.stringify(this.finalModel.pertanyaan));
      model.append("jawaban", JSON.stringify(this.finalModel.jawaban));
      model.append("nilai", this.finalModel.nilai);
      console.log("model", model);
      await axios.post(this.applyUrl, model);
      this.modalAkhir = true;
      // this.$router.push("/loker");
      // alert("Lamaran anda sudah kami terima!!!");
      // window.location.href = "/loker";
    },
    validate(ref) {
      return this.$refs[ref].validate();
    },
    onStepValidate(validated, model) {
      if (validated) {
        this.finalModel = { ...this.finalModel, ...model };
        this.kuis = true;
      } else {
        alert("Lengkapi data yang dibutuhkan");
        window.scrollTo(0, 0);
      }
      // this.$root.$emit("getModal");
    },
  },
};
</script>

<style lang="scss">
.navi .btn.lanjutBtn {
  height: 47px;
  background-color: #07a148;
  border-radius: 4px;

  font-style: normal;
  font-weight: 600;
  font-size: 16px;
  letter-spacing: 0.04em;
  color: #ffffff;
}

.navi .btn.kembaliBtn.btn-secondary {
  height: 47px;
  background-color: #ffffff;
  border: 1px solid #07a148;
  box-sizing: border-box;
  border-radius: 4px;

  font-style: normal;
  font-weight: 600;
  font-size: 16px;
  letter-spacing: 0.04em;
  color: #07a148 !important;
}

.bio .card-body {
  background: #ffffff;
  box-shadow: 0px 16px 24px rgba(0, 0, 0, 0.06), 0px 2px 6px rgba(0, 0, 0, 0.04),
    0px 0px 1px rgba(0, 0, 0, 0.04);
  border-radius: 8px;
}

.wizard-card-footer .wizard-footer-right {
  float: none;
  height: 47px;
}
.wizard-footer-right {
  width: 100%;
}
#step-Administrasi0.wizard-icon-circle {
  border: 5px solid rgba(7, 161, 72, 0.2) !important;
  border-radius: 50%;
  .wizard-icon-container {
    border-radius: 50%;
  }
}
.stepTitle {
  font-style: normal;
  font-weight: 500;
  font-size: 14px;
  line-height: 3;
  text-align: center;
  color: #757682;
}
span.el-checkbox__input.is-checked .el-checkbox__inner {
  background-color: #07a148;
}
span.el-checkbox__input.is-checked + .el-checkbox__label {
  color: #07a148;
}
.stepTitle.active {
  font-style: normal;
  font-weight: 600;
  font-size: 14px;
  line-height: 3;
  text-align: center;
  color: #121527 !important;
}
</style>
