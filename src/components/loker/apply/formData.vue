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
              </tab-content>
              <tab-content
                title="Kuis"
                :before-change="() => validate('secondStep')"
              >
                <FormQuiz
                  ref="secondStep"
                  @on-validate="onStepValidate"
                ></FormQuiz>
              </tab-content>
              <tab-content title="Penyelesaian" icon="fas fa-check">
                your data
                <pre>{{ finalModel }}</pre>
              </tab-content>
              <template slot="footer" slot-scope="props">
                <b-row class="justify-content-start align-items-center">
                  <b-col md="7">
                    <div class="wizard-footer-left">
                      <el-checkbox
                        v-model="next"
                        class="mb-0"
                        style="line-height: 3;"
                        label="Saya sudah mengisi form lamaran pekerjaan dengan jujur dan sebenar-benarnya."
                      ></el-checkbox>
                      <wizard-button
                        v-if="props.activeTabIndex > 0 && !props.isLastStep"
                        @click.native="props.prevTab()"
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
                        class="wizard-footer-right"
                        :style="props.fillButtonStyle"
                        >Lanjut</wizard-button
                      >

                      <wizard-button
                        v-else
                        @click.native="onComplete"
                        class="wizard-footer-right finish-button"
                        :style="props.fillButtonStyle"
                      >
                        {{ props.isLastStep ? "Done" : "Next" }}</wizard-button
                      >
                    </div>
                  </b-col>
                </b-row>
              </template>
            </form-wizard>
          </b-col>
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
      next: false,
      finalModel: {
        nama: "",
        wa: "",
        email: "",
        domisili: "",
        provinsi: "",
        kelamin: "",
        pendidikan: null,
        jurusan: "",
        agama: "",
        pengalaman: "",
        alasan: "",
        portfolio: null,
        loker_id: "",
        status: "",
        kuis: {
          p1: "",
          p2: "",
          p3: "",
        },
      },
      activeTabIndex: 0,
      applyUrl: "",
    };
  },
  components: {
    Biodata,
    FormQuiz,
  },

  created() {
    const mainUrl = localStorage.getItem("apiUrl");
    this.applyUrl = mainUrl + "/apply/" + this.$route.params.id;
  },
  methods: {
    async onComplete() {
      console.log(this.finalModel);
      let model = new FormData();
      model.append("nama", this.finalModel.nama);
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
      model.append("portfolio", this.finalModel.portfolio);
      model.append("loker_id", this.finalModel.loker_id);
      model.append("status", this.finalModel.status);
      model.append("kuis", JSON.stringify(this.finalModel.kuis));
      console.log("model", model);
      await axios.post(this.applyUrl, model);
      alert("Lamaran anda sudah kami terima!!!");
    },

    validate(ref) {
      return this.$refs[ref].validate();
    },

    onStepValidate(validated, model) {
      if (validated) {
        this.finalModel = { ...this.finalModel, ...model };
      }
    },
  },
};
</script>

<style lang="scss">
.wizard-card-footer .wizard-footer-right {
  float: none;
  height: 47px;
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
