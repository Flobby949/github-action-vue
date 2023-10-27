<script setup>
import { ref } from 'vue'
import axios from 'axios'

defineProps({
  msg: String,
})

const count = ref(0)
const result = ref([])
const sendReq = () => {
  axios.get("http://localhost:8777/test").then((res) => {
    console.log(res.data)
    result.value = res.data
  })
}
</script>

<template>
  <h1>{{ msg }}</h1>

  <div class="card">
    <button type="button" @click="sendReq">发送请求</button>
    <button type="button" @click="count++">count is {{ count }}</button>
    <p>
      {{ result }}
    </p>
  </div>
</template>

<style scoped>
.read-the-docs {
  color: #888;
}
</style>
