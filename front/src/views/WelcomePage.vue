<template>
  <div class="container welcome">
    <p>ใใใใ</p>
    <div v-if="shouldShowLoginForm">
    <!-- ======= ๐ ใใใใๅคๆดใใ ======= -->
      <LoginForm @redirectToChatRoom="redirectToChatRoom"/>
    <!-- ======= ๐ ใใใพใงๅคๆดใใ ======= -->
      <p class="change-form">ๅใใฆใฎๆนใฏ<span @click="shouldShowLoginForm = false">ใใกใ</span>ใใฏใชใใฏ</p>
    </div>
    <div v-if="!shouldShowLoginForm">
    <!-- ======= ๐ ใใใใๅคๆดใใ ======= -->
      <SignupForm @redirectToChatRoom="redirectToChatRoom"/>
    <!-- ======= ๐ ใใใพใงๅคๆดใใ ======= -->
      <p class="change-form">ใขใซใฆใณใใใๆใกใฎๆนใฏ<span @click="shouldShowLoginForm = true">ใใกใ</span>ใใฏใชใใฏ</p>
    </div>
  </div>
</template>



<script>
import LoginForm from '../components/LoginForm.vue'
import SignupForm from "../components/SignupForm.vue"

export default  {
  components: { SignupForm, LoginForm },
  data () {
    return {
      shouldShowLoginForm: false
    }
  },
  /// ======= ๐ ใใใใ่ฟฝๅ ใใ =======
  methods: {
    redirectToChatRoom () {
      // ใใฎๆธใๆนใใใใจใๅผใฐใใๅพใซใชใใคใฌใฏใใใใ
      this.$router.push({ name: 'Chatroom' })
    }
  }  
  /// ======= ๐ ใใใพใง่ฟฝๅ ใใ =======
}
</script>
<!-- ...็็ฅ -->


<style>
  .welcome {
    text-align: center;
    padding: 20px 0;
  }
  /* ใใฉใผใ ใฎในใฟใคใซ */
  .welcome form {
    width: 300px;
    margin: 20px auto;
  }
  .welcome label {
    display: block;
    margin: 20px 0 10px;
  }
  .welcome input {
    width: 100%;
    padding: 12px 20px;
    margin: 8px auto;
    border-radius: 4px;
    border: 1px solid #eee;
    outline: none;
    box-sizing: border-box;
  }
  .welcome span{
    font-weight: bold;
    text-decoration: underline;
    cursor: pointer;
  }
  .welcome button {
    margin: 20px auto;
  }
  /* ======= ๐ ใใใใ่ฟฝๅ  ======= */
  .change-form {
    font-size: 14px;
    margin: 10px;
  }
  /* ====== ๐ ใใใพใง่ฟฝๅ  ======= */
</style>
