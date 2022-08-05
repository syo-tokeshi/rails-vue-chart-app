<template>
  <div>
    これはコンポーネントから表示されています。
    <p>{{ message }}</p>
    <!-- ======= 👇 ここから削除する ======= -->
    <p>{{ isEnabled }}</p>
    <!-- ======= 👆 ここまで削除する ======= -->
    <!-- ======= 👇 ここから追加する ======= -->
    <button @click="onClick">親メソッドを実行するボタン</button> 
    <!-- ======= 👆 ここまで追加する ======= -->
  </div>
</template>

<script>
export default {
  props: ['message'],
  // ====== 👇 ここから変更する =======
  methods: {
    onClick() {
      this.$emit('toggle')
    }
  }
  // ====== 👆 ここまで変更する =======
}
</script>
