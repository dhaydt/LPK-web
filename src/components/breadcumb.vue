<script>
export default {
  components: {},
  props: {
    title: {
      type: String,
      default: "",
    },
    items: {
      type: Array,
      default: () => {
        return [];
      },
    },
  },
};
</script>

<template>
  <!-- start page title -->
  <div class="row">
    <div class="navback"></div>
    <div class="col-12">
      <div
        class="page-title-box d-flex align-items-center justify-content-between"
      >
        <!-- <h4 class="mb-0">{{ title }}</h4> -->

        <b-breadcrumb :items="items" class="bread my-4"></b-breadcrumb>
        <!-- <div class="page-title-right">
        </div> -->
      </div>
    </div>
  </div>
  <!-- end page title -->
</template>

<style lang="scss">
.navback {
  width: 100%;
  height: 141px;
  background: #07a148;
}
.bread {
  margin-left: 106px;
}
.bread .breadcrumb-item a {
  font-style: normal;
  font-weight: normal;
  font-size: 14px;
  line-height: 1;
  color: #07a148 !important;
}

.bread .breadcrumb-item.active span {
  font-style: normal;
  font-weight: normal;
  font-size: 14px;
  color: #121527;
  max-width: 700px;
  display: -webkit-box;
  -webkit-line-clamp: 1;
  -webkit-box-orient: vertical;
  overflow: hidden;
  text-overflow: ellipsis;
}
</style>
