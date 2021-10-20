<template>
  <div class="navbarApply">
    <div class="secondNav">
      <b-container class="h-100">
        <b-row class="justify-content-center align-items-center h-100">
          <b-col class="text-left"
            ><a :href="'/loker/' + $route.params.id">
              <i class="fas fa-arrow-left mr-2"> </i>{{ $route.params.name }}
            </a></b-col
          >
          <b-col>
            <b-img src="/assets/images/logo.png" height="60"></b-img>
          </b-col>
        </b-row>
      </b-container>
    </div>
  </div>
</template>

<script>
export default {};
</script>

<style lang="scss" scoped>
.secondNav {
  height: 88px;
  background: linear-gradient(
    181.98deg,
    #07a148 26.57%,
    rgba(7, 161, 72, 0) 283.01%
  );
}

.text-left a {
  font-style: normal;
  font-weight: 600;
  font-size: 16px;
  line-height: 24px;
  color: #ffffff;
}

.text-left a:hover {
  color: #fd7d24;
}
</style>
