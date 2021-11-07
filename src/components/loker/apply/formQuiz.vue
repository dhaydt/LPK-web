<template>
  <b-row>
    <b-modal
      v-model="modalShow"
      id="modal"
      no-close-on-esc
      no-close-on-backdrop
      hide-header-close
    >
      <template #modal-title>
        <span class="titleCard text-center">Perhatian</span>
      </template>
      <p class="pcard">
        Lowogan pekerjaan berikut memiliki tes dengan batas waktu dan tidak
        diperkenankan untuk kembali. Apakah anda sudah yakin telah mengisi form
        lamaran dan siap untuk mengerjakan tes?
      </p>
      <template #modal-footer>
        <b-row class="w-100">
          <b-col md="6">
            <b-button block @click="backTab" class="modalBack"
              >Kembali</b-button
            >
          </b-col>
          <b-col md="6">
            <b-button block @click="lanjut" class="modalNext"
              >Lanjut Mengerjakan</b-button
            >
          </b-col>
        </b-row>
      </template>
    </b-modal>
    <b-col md="8">
      <b-card class="quis">
        <el-form
          :model="jawaban"
          :rules="rules"
          ref="form"
          v-show="accepted"
          class="kuis"
        >
          <div class="qu-is text-left" v-for="(q, i) in kuis" :key="i">
            <p>Pertanyaan {{ i + 1 }} dari {{ kuis.length }} pertanyaan</p>
            <el-form-item :label="q.text" class="d-block question">
              <b-row cols-md="2" cols="1" cols-lg="2">
                <b-col
                  v-for="(o, index) in JSON.parse(q.responses)"
                  :key="index"
                >
                  <el-radio-group v-model="userResponses[i]">
                    <el-radio-button :label="o">
                      <span>{{ o.text }} </span>
                    </el-radio-button>
                  </el-radio-group>
                </b-col>
              </b-row>
            </el-form-item>
          </div>
        </el-form>
      </b-card>
    </b-col>
    <b-col md="4">
      <b-card class="counter">
        <div class="countdown">
          <span v-if="!status">Sisa Waktu</span>
          <span v-if="status">Waktu habis</span>
          <h2>
            {{ timeLeft }}
          </h2>
        </div>
        <b-col class="navi">
          <b-button class="w-100 mt-4 kembaliBtn" @click="backTab"
            >Kembali</b-button
          >

          <b-button class="w-100 mt-4 lanjutBtn" @click="score"
            >Review Jawaban</b-button
          >
        </b-col>
        <!-- <ul class="columns is-mobile is-centered">
          <li v-for="(time, index) in times" :key="index" class="column time">
            <a
              v-on:click.prevent="setTime(time.sec)"
              :class="[
                'button',
                'is-link',
                { 'is-active': time.sec === selectedTime && endTime !== 0 },
              ]"
            >
              {{ time.display }}
            </a>
          </li>
        </ul> -->
      </b-card>
    </b-col>
    {{ userResponses }}
  </b-row>
</template>

<script>
import axios from "axios";
var intervalTimer;
function zeroPadded(num) {
  // 4 --> 04
  return num < 10 ? `0${num}` : num;
}

function hourConvert(hour) {
  // 15 --> 3
  return hour % 12 || 12;
}

export default {
  data() {
    return {
      userResponses: [],
      nilai: "",
      timeUrl: "",
      kuisUrl: "",
      pertanyaan: {},
      jawaban: {},
      kuis: {},
      model: {},
      correct: {},
      rules: {
        // p1: [
        //   {
        //     required: true,
        //     message: "Pertanyaan 1 belum di isi",
        //     trigger: "change",
        //   },
        // ],
        // p2: [
        //   {
        //     required: true,
        //     message: "Pertanyaan 2 belum di isi",
        //     trigger: "blur",
        //   },
        // ],
        // p3: [
        //   {
        //     required: true,
        //     message: "Pertanyaan 3 belum di isi",
        //     trigger: "blur",
        //   },
        // ],
      },

      accepted: false,
      modalShow: true,
      status: false,
      selectedTime: 0,
      timeLeft: "00:00",
      endTime: "0",
      times: [],
    };
  },

  created() {
    const kuis = JSON.parse(localStorage.getItem("kuis"));
    const main = localStorage.getItem("apiUrl");
    this.kuis = kuis;
    this.userResponses = Array(kuis.length).fill({ text: "", correct: false });
    this.timeUrl = main + "/kuisTimeOn";
    this.ambilWaktu();
  },

  mounted() {
    this.modalShow = true;
  },

  methods: {
    score() {
      var score = this.userResponses;

      const nilai = score.reduce((acc, it) => {
        acc[it.correct] = acc[it.correct] + 1 || 1;
        return acc;
      }, {});
      var hasil = ((nilai.true / this.kuis.length) * 100).toFixed(0);
      // this.nilai =  + "%";
      console.log(hasil);
      if (isNaN(hasil)) {
        this.nilai = "0";
      } else {
        this.nilai = hasil;
      }

      this.pertanyaan = this.kuis.map((kuis) => kuis.text);
      this.reviewTab();
    },
    async ambilWaktu() {
      const resp = await axios.get(this.timeUrl);
      console.log(resp.data.data[0]);
      this.times = resp.data.data[0];
    },
    backTab() {
      this.$root.$emit("previous");
    },
    reviewTab() {
      this.$root.$emit("next");
    },
    lanjut() {
      this.accepted = true;
      this.$bvModal.hide("modal");
      this.setTime(this.times.time);
      window.scrollTo(0, 0);
    },
    validate() {
      this.model = {
        pertanyaan: this.pertanyaan,
        jawaban: this.userResponses,
        nilai: this.nilai,
      };
      console.log(this.model);
      return new Promise((resolve) => {
        this.$refs.form.validate((valid) => {
          this.$emit("on-validate", valid, this.model);
          resolve(valid);
        });
      });
    },

    setTime(seconds) {
      clearInterval(intervalTimer);
      this.timer(seconds);
    },
    timer(seconds) {
      const now = Date.now();
      const end = now + seconds * 1000;
      this.displayTimeLeft(seconds);

      this.selectedTime = seconds;
      // this.initialTime = seconds;
      this.displayEndTime(end);
      this.countdown(end);
    },
    countdown(end) {
      // this.initialTime = this.selectedTime;
      intervalTimer = setInterval(() => {
        const secondsLeft = Math.round((end - Date.now()) / 1000);

        if (secondsLeft === 0) {
          this.endTime = 0;
          this.status = true;
          this.accepted = false;
        }

        if (secondsLeft < 0) {
          clearInterval(intervalTimer);
          return;
        }
        this.displayTimeLeft(secondsLeft);
      }, 1000);
    },
    displayTimeLeft(secondsLeft) {
      const minutes = Math.floor((secondsLeft % 3600) / 60);
      const seconds = secondsLeft % 60;

      this.timeLeft = `${zeroPadded(minutes)}:${zeroPadded(seconds)}`;
    },
    displayEndTime(timestamp) {
      const end = new Date(timestamp);
      const hour = end.getHours();
      const minutes = end.getMinutes();

      this.endTime = `${hourConvert(hour)}:${zeroPadded(minutes)}`;
    },
  },
};
</script>

<style lang="scss">
.el-radio-group {
  width: 100%;
  .el-radio-button {
    width: 100%;
    .el-radio-button__inner {
      width: 100%;

      text-align: left;
      span {
        text-transform: capitalize;
        font-style: normal;
        font-weight: 500;
        font-size: 14px;
        line-height: 20px;
        color: #757682;
      }
    }

    .el-radio-button__inner:hover {
      color: #07a148;
    }

    .el-radio-button__orig-radio:checked + .el-radio-button__inner {
      background-color: transparent !important;
      color: #07a148;
      border: 1px solid #07a148;
    }
  }
}

.el-radio.options.ml-1.text-left.kuisRadio.is-focus.is-bordered {
  border: 1px solid #48a248;

  .el-radio__label {
    color: #48a248;
  }
}
.options span.el-radio__inner {
  display: none;
}

.el-radio.options.el-radio.is-bordered {
  padding: 0 !important;
  transition: 0.3s;
}

.el-form .el-form-item label.el-form-item__label {
  width: 100%;
  text-align: left;
  text-transform: capitalize;
}

.modal-header h5 {
  display: block;
  text-align: center;
  width: 100%;
}

span.titleCard {
  font-style: normal;
  font-weight: 600;
  font-size: 20px;
  width: 100%;
  line-height: 16px;
  text-align: center;
  color: #121527;
}

.modal-body p.pcard {
  font-style: normal;
  font-weight: normal;
  font-size: 14px;
  text-align: center;
  color: #757682;
}

.row .col-md-6 .modalBack,
.row .col-md-6 .modalNext {
  font-style: normal;
  height: 45px;
  border-radius: 4px;
  font-weight: 600;
  font-size: 16px;
  letter-spacing: 0.04em;
}

.row .col-md-6 .btn.modalBack {
  color: #07a148 !important;
  background-color: #fff;
  border: 1px solid #07a148;
}

.row .col-md-6 .btn.modalNext {
  background-color: #07a148;
  color: #ffffff;
}

.card.quis {
  background: #ffffff;
  box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.04), 0px 0px 2px rgba(0, 0, 0, 0.06),
    0px 0px 1px rgba(0, 0, 0, 0.04);
  border-radius: 8px;
}

.card.quis .card-body .el-form.kuis .el-form-item label {
  font-style: normal;
  font-weight: 500;
  font-size: 20px;
  text-transform: capitalize;
  line-height: 28px;
  color: #121527;
}

.kuis h5 {
  font-style: normal;
  font-weight: normal;
  font-size: 14px;
  letter-spacing: 0.01em;
  color: #757682;
  text-align: left;
}

.card.counter {
  // height: 193px;
  background: #ffffff;
  box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.04), 0px 0px 2px rgba(0, 0, 0, 0.06),
    0px 0px 1px rgba(0, 0, 0, 0.04);
  border-radius: 8px;
}

.countdown {
  padding: 10px 0;
  height: 74px;
  background: #fbfbfb;
  border: 1px solid #e9e9e9;
  box-sizing: border-box;
  border-radius: 8px;
  h2 {
    font-weight: 500;
    font-size: 24px;
    margin: 10px 0;
    color: #07a148;
  }

  span {
    font-style: normal;
    font-weight: 500;
    font-size: 14px;
    line-height: 16px;
    letter-spacing: 0.02em;
    color: #aaacba;
  }
}
</style>
