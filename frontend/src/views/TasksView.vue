<template>
  <div>
    <h1>Daftar Task</h1>

    <router-link to="/">
      Kembali ke Dashboard
    </router-link>

    <p v-if="loading">Memuat data...</p>

    <p v-else-if="error">
      Gagal mengambil data task.
    </p>

    <ul v-else>
      <li v-for="task in tasks" :key="task.id">
        {{ task.title }} - {{ task.status }}
      </li>
    </ul>
  </div>
</template>

<script setup>
import { onMounted, ref } from 'vue'

const tasks = ref([])
const loading = ref(true)
const error = ref(false)

const apiUrl = import.meta.env.VITE_API_URL

onMounted(async () => {
  try {
    const response = await fetch(`${apiUrl}/tasks`)

    if (!response.ok) {
      throw new Error('Gagal mengambil data')
    }

    tasks.value = await response.json()
  } catch (err) {
    console.error(err)
    error.value = true
  } finally {
    loading.value = false
  }
})
</script>