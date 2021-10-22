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
                <Biodata
                  ref="firstStep"
                  @on-validate="onStepValidate"
                ></Biodata>
                <b-row class="text-left justify-content-center">
                  <b-col md="10">
                    <el-checkbox
                      v-model="next"
                      class="mb-0"
                      style="line-height: 3;"
                      label="Saya sudah mengisi form lamaran pekerjaan dengan jujur dan sebenar-benarnya."
                    ></el-checkbox>
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
                <b-card title="Data Anda Akan Kami Simpan di Database Kami">
                  <b-card-text style="font-transform: capitalize;"
                    >Terima kasih telah berpartisipasi</b-card-text
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
                        class="wizard-footer-right"
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

    this.kuisUrl = mainUrl + "/kuis";
    this.getKuis();
  },
  methods: {
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
      console.log("model", model);
      await axios.post(this.applyUrl, model);
      // this.$router.push("/loker");
      alert("Lamaran anda sudah kami terima!!!");
      window.location.href = "/loker";
    },

    validate(ref) {
      return this.$refs[ref].validate();
    },

    onStepValidate(validated, model) {
      if (validated) {
        this.finalModel = { ...this.finalModel, ...model };
        this.kuis = true;
      }
      // this.$root.$emit("getModal");
    },
  },
};
</script>

<style lang="scss">
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
