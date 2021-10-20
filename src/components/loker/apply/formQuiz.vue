<template>
  <b-row>
    <b-col md="8">
      <el-form :model="model.kuis" :rules="rules" ref="form">
        <el-form-item label="Rukun iman ada berapa" prop="p1">
          <el-radio v-model="model.kuis.p1" label="3" border
            >Rukun iman ada 3</el-radio
          >
          <el-radio v-model="model.kuis.p1" label="5" border
            >Rukun iman ada 5</el-radio
          >
          <el-radio v-model="model.kuis.p1" label="4" border
            >Rukun iman ada 4</el-radio
          >
          <el-radio v-model="model.kuis.p1" label="6" border
            >Rukun iman ada 6</el-radio
          >
        </el-form-item>

        <el-form-item label="Rukun islam ada berapa" prop="p2">
          <el-radio v-model="model.kuis.p2" label="3" border
            >Rukun islam ada 3</el-radio
          >
          <el-radio v-model="model.kuis.p2" label="2" border
            >Rukun islam ada 2</el-radio
          >
          <el-radio v-model="model.kuis.p2" label="5" border
            >Rukun islam ada 5</el-radio
          >
          <el-radio v-model="model.kuis.p2" label="7" border
            >Rukun islam ada 7</el-radio
          >
        </el-form-item>

        <el-form-item label="Pancasila ada berapa" prop="p3">
          <el-radio v-model="model.kuis.p3" label="2" border
            >Pancasila ada 2</el-radio
          >
          <el-radio v-model="model.kuis.p3" label="6" border
            >Pancasila ada 6</el-radio
          >
          <el-radio v-model="model.kuis.p3" label="5" border
            >Pancasila ada 5</el-radio
          >
          <el-radio v-model="model.kuis.p3" label="4" border
            >Pancasila ada 4</el-radio
          >
        </el-form-item>
      </el-form>
    </b-col>
    <b-col md="4"></b-col>
  </b-row>
</template>

<script>
export default {
  data() {
    return {
      model: {
        kuis: {
          p1: "",
          p2: "",
          p3: "",
        },
      },
      rules: {
        p1: [
          {
            required: true,
            message: "Pertanyaan 1 belum di isi",
            trigger: "change",
          },
        ],
        p2: [
          {
            required: true,
            message: "Pertanyaan 2 belum di isi",
            trigger: "blur",
          },
        ],
        p3: [
          {
            required: true,
            message: "Pertanyaan 3 belum di isi",
            trigger: "blur",
          },
        ],
      },
    };
  },
  methods: {
    validate() {
      return new Promise((resolve) => {
        this.$refs.form.validate((valid) => {
          this.$emit("on-validate", valid, this.model);
          resolve(valid);
        });
      });
    },
  },
};
</script>

<style></style>
