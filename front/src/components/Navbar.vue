<template>
  <nav>
    <div>
      <p>こんにちは、<span class="name">{{ name }}</span>さん</p>
      <p class="email">現在、 {{ email }} でログイン中です</p>
      <!-- ======= 👇 ここから変更する ======= -->
      <div class="error">{{ error }}</div>
      <!-- ======= 👆 ここまで変更する ======= -->
    </div>
    <button @click="logout">ログアウト</button>
  </nav>
</template>

<script>
import axios from 'axios'

export default {
  data () {
    return {
      name: window.localStorage.getItem('name'),
      email: window.localStorage.getItem('uid'),
      // ======= 👇 ここから追加する =======
      error: null
      // ======= 👆 ここまで追加する =======
    }
  },
  methods: {
    async logout () {
      // ======= 👇 ここから追加する =======
      this.error = null
      // ======= 👆 ここまで追加する =======

      try {
        const res = await axios.delete('http://localhost:3000/auth/sign_out', {
          headers: {
            uid: this.email,
            "access-token": window.localStorage.getItem('access-token'),
            client: window.localStorage.getItem('client')
          }
        })

        // ======= 👇 ここから変更する =======
        if (!res) {
        //   new Error('ログアウトできませんでした')
        }

        if (!this.error) {
          console.log("ログアウトしました")
          window.localStorage.removeItem('access-token')
          window.localStorage.removeItem('client')
          window.localStorage.removeItem('uid')
          window.localStorage.removeItem('name')

          this.$router.push({ name: 'Welcome' })
        }
        // ======= 👆 ここまで変更する =======

        return res
      } catch (error) {
        // ======= 👇 ここから変更する =======
        // this.error = 'ログアウトできませんでした'
        // ======= 👆 ここまで変更する =======
      }
    }
  }
}
</script>
<!-- ...省略 -->
