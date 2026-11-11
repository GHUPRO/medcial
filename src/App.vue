<script setup>
import { ref, markRaw } from 'vue'

import Sidebar from './components/sidebar.vue'
import Home from './components/home.vue'
import FirstAid from './components/first-aid.vue'
import List from './components/list.vue'

const pages = {
  home: markRaw(Home),
  firstAid: markRaw(FirstAid),
  prevention: markRaw(FirstAid),
  list: markRaw(List),
}

const currentPage = ref(pages.home)

function changePage(name) {
  if (pages[name]) {
    currentPage.value = pages[name]
  }
}
</script>

<template>
  <div class="app-container">

    <!-- 左侧侧边栏 -->
    <Sidebar @navigate="changePage" />

    <!-- 右侧主内容 -->
    <main class="main-content">
      <Transition name="fade" mode="out-in">
        <component :is="currentPage" />
      </Transition>
    </main>

  </div>
</template>

<style>
* {
  box-sizing: border-box;
}

body {
  margin: 0;
}

.app-container {
  display: flex;
  width: 100%;
  height: 100vh;
  overflow: hidden;
}

.main-content {
  flex: 1;
  min-width: 0;
  height: 100%;
  overflow-y: auto;
  background: #f3f6f8;
}
/* 进入和离开动画的过渡时间 */
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.3s ease;
}

/* 进入开始、离开结束 */
.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}

/* 进入结束、离开开始 */
.fade-enter-to,
.fade-leave-from {
  opacity: 1;
}
</style>