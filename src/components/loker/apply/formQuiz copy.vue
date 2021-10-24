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
          <div class="qu-is" v-for="(q, i) in pertanyaan" :key="i">
            <p>
              Pertanyaan {{ i + 1 }} dari {{ pertanyaan.length }} pertanyaan
            </p>
            <el-form-item :label="q" :prop="'p' + i + 1" class="d-block">
              <el-radio
                v-model="jawaban[i + 1]"
                v-for="o in JSON.parse(options[i])"
                :key="o"
                class="options ml-1 text-left"
                :label="o"
                border
                >{{ o }}
              </el-radio>
            </el-form-item>
          </div>

          <!-- <p>Pertanyaan 2 dari 3 pertanyaan</p>
          <el-form-item :label="pertanyaan[1]" prop="p2">
            <el-radio
              v-model="jawaban.p2"
              v-for="o in JSON.parse(options[1])"
              :key="o"
              class="options ml-1 text-left"
              :label="o"
              border
              >{{ o }}
            </el-radio>
          </el-form-item>
          <p>Pertanyaan 3 dari 3 pertanyaan</p>
          <el-form-item :label="pertanyaan[2]" prop="p3">
            <el-radio
              v-model="jawaban.p3"
              v-for="o in JSON.parse(options[2])"
              :key="o"
              :label="o"
              border
              class="options ml-1 text-left"
              >{{ o }}
            </el-radio>
          </el-form-item> -->
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

          <b-button class="w-100 mt-4 lanjutBtn" @click="reviewTab"
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
      timeUrl: "",
      kuisUrl: "",
      pertanyaan: {},
      options: {},
      kuis: {},
      model: {},
      jawaban: {},
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
    this.pertanyaan = kuis.map((kuis) => kuis.pertanyaan);
    this.correct = kuis.map((kuis) => kuis.jawaban);
    const opt = kuis.map((kuis) => kuis.options);
    this.options = opt;
    this.kuis = kuis;
    this.timeUrl = main + "/kuisTimeOn";
    this.ambilWaktu();
  },

  mounted() {
    this.modalShow = true;
  },

  methods: {
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
        jawaban: this.jawaban,
        correct: this.correct,
      };
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
          // this.accepted = false;
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
.options span.el-radio__inner {
  display: none;
}

.el-radio.options.el-radio.is-bordered {
  padding: 0 !important;
}

.el-form .el-form-item label.el-form-item__label {
  width: 100%;
  text-align: left;
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
