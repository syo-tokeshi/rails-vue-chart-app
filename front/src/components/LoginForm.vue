<template>
  <div>
    <h2>γ­γ°γ€γ³</h2>
    <!-- ======= π γγγγε€ζ΄γγ ======= -->
    <form @submit.prevent="login">
      <!-- ====== π γγγΎγ§ε€ζ΄γγ ======= -->
      <input type="email" required placeholder="γ‘γΌγ«γ’γγ¬γΉ" v-model="email">
      <input type="password" required placeholder="γγΉγ―γΌγ" v-model="password">
      <!-- ======= π γγγγθΏ½ε γγ ======= -->
      <div class="error">{{ error }}</div>
      <!-- ====== π γγγΎγ§θΏ½ε γγ ======= -->
      <button>γ­γ°γ€γ³γγ</button>
    </form>
  </div>
</template>

<!-- ... ηη₯ -->
<script>
import axios from 'axios'
// ======= π γγγγθΏ½ε γγ =======
import setItem from '../auth/setItem'
// ====== π γγγΎγ§θΏ½ε γγ =======

export default {
  emits: ['redirectToChatRoom'],
  data () {
    return {
      email: '',
      password: '',
      error: null
    }
  },
  methods: {
    async login() {
      try {
        this.error = null
        const res = await axios.post('http://localhost:3000/auth/sign_in', {
          email: this.email,
          password: this.password,
          }
        )
        if (!res) {
          throw new Error('γ‘γΌγ«γ’γγ¬γΉγγγΉγ―γΌγγιγγΎγ')
        }

        if (!this.error) {
        // ======= π γγγγε€ζ΄γγ =======
          setItem(res.headers, res.data.data.name)
        // ====== π γγγΎγ§ε€ζ΄γγ =======
          this.$emit('redirectToChatRoom')
        }

        console.log({ res })
        return res
      } catch (error) {
        console.log({ error })
        this.error = 'γ‘γΌγ«γ’γγ¬γΉγγγΉγ―γΌγγιγγΎγ'
      }
    }
  }
}
</script>
