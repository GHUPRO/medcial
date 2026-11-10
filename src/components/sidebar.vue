<script setup>
import { ref } from 'vue'

const emit = defineEmits(['navigate'])

const activePage = ref('home')
const collapsed = ref(false)

const navItems = [
  { id: 'home', title: '首页', icon: '⌂' },
  { id: 'disease', title: '病症分类', icon: '▤' },
  { id: 'prevention', title: '预防指南', icon: '♡' },
  { id: 'list', title: '疾病概览', icon: '》' },
]

function selectPage(id) {
  activePage.value = id
  emit('navigate', id)
}
</script>

<template>
  <aside class="sidebar" :class="{ collapsed }">

    <!-- 项目标题 -->
    <div class="brand">
      <div class="brand-icon">✚</div>

      <span v-if="!collapsed">
        导航
      </span>
    </div>

    <!-- 导航列表 -->
    <nav class="nav-list">
      <button
        v-for="item in navItems"
        :key="item.id"
        class="nav-item"
        :class="{ active: activePage === item.id }"
        @click="selectPage(item.id)"
      >
        <span class="nav-icon">{{ item.icon }}</span>
        <span v-if="!collapsed">{{ item.title }}</span>
      </button>
    </nav>

    <!-- 底部区域 -->
    <div class="sidebar-bottom">
      <button
        class="collapse-btn"
        @click="collapsed = !collapsed"
      >
        {{ collapsed ? '»' : '« 收起侧边栏' }}
      </button>
    </div>

  </aside>
</template>

<style scoped>
.sidebar {
  width: 240px;
  height: 100%;
  box-sizing: border-box;

  background: #26394a;
  color: white;

  display: flex;
  flex-direction: column;

  transition: width 0.25s ease;
}

.sidebar.collapsed {
  width: 72px;
}

/* 项目标题 */
.brand {
  height: 76px;
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 0 20px;

  font-size: 19px;
  font-weight: bold;
  white-space: nowrap;
}

.brand-icon {
  width: 32px;
  height: 32px;
  border-radius: 9px;

  display: flex;
  align-items: center;
  justify-content: center;

  background: #4d8297;
  font-size: 21px;
}

/* 导航列表 */
.nav-list {
  flex: 1;
  padding: 15px 10px;
}

.nav-item {
  width: 100%;
  height: 48px;

  display: flex;
  align-items: center;
  gap: 14px;

  padding: 0 13px;
  margin-bottom: 8px;

  border: none;
  border-radius: 9px;

  color: #c5d1dc;
  background: transparent;

  font-size: 14px;
  text-align: left;
  white-space: nowrap;

  cursor: pointer;
  transition: background 0.2s, color 0.2s;
}

.nav-item:hover {
  background: #354d60;
  color: white;
}

.nav-item.active {
  background: #426b80;
  color: white;
}

.nav-icon {
  width: 20px;
  text-align: center;
  font-size: 19px;
  flex-shrink: 0;
}

/* 底部 */
.sidebar-bottom {
  padding: 12px;
}

.collapse-btn {
  width: 100%;
  height: 40px;

  border: none;
  border-radius: 8px;

  background: #354b5d;
  color: #d5e0e9;

  cursor: pointer;
}
</style>