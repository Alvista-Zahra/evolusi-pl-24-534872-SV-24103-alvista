<template>
  <nav>
    <router-link to="/">Dashboard</router-link>
    |
    <router-link to="/tasks">Tasks</router-link>
  </nav>

  <main>
    <router-view />
  </main>
</template>