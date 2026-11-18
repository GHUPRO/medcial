<script setup>
import { ref, computed, onMounted, onUnmounted } from 'vue'

const emit = defineEmits(['navigate'])

const root = ref(null)
const scrollY = ref(0)

let scrollContainer = null
let moduleTitleGroups = []

// 页面滚动监听
function handleScroll() {
  scrollY.value = scrollContainer?.scrollTop || 0
  if (!scrollContainer) return

  const viewportTop = scrollContainer.getBoundingClientRect().top
  const upperThird = viewportTop + scrollContainer.clientHeight / 3

  moduleTitleGroups.forEach(({ title, subtitle }) => {
    const rect = title.getBoundingClientRect()
    const titleCenter = rect.top + rect.height / 2
    const enlarged = titleCenter >= viewportTop && titleCenter <= upperThird

    title.classList.toggle('module-title-enlarged', enlarged)
    subtitle?.classList.toggle('module-subtitle-enlarged', enlarged)
  })
}

// 根据滚动距离计算背景颜色
const backgroundStyle = computed(() => {
  const progress = Math.min(scrollY.value / 1100, 1)

  const start = [239, 247, 250]
  const end = [250, 239, 239]

  const color = start.map((value, index) =>
    Math.round(value + (end[index] - value) * progress)
  )

  return {
    backgroundColor: `rgb(${color.join(',')})`
  }
})

// 插画移动效果
function decorationStyle(item) {
  const offset = scrollY.value * item.speed

  return {
    transform: `translate3d(${item.x * offset}px, ${item.y * offset}px, 0)
                rotate(${scrollY.value * item.rotate}deg)`
  }
}

// 卡通装饰素材
const decorations = [
  { id: 1, icon: '🫀', left: '7%', top: '12%', size: 78, speed: -0.16, x: 0.1, y: -1, rotate: 0.025 },
  { id: 2, icon: '🫁', left: '82%', top: '18%', size: 86, speed: -0.22, x: 0.1, y: 1, rotate: -0.02 },
  { id: 3, icon: '🦠', left: '15%', top: '52%', size: 52, speed: -0.12, x: -0.2, y: -1, rotate: 0.05 },
  { id: 4, icon: '🧠', left: '86%', top: '55%', size: 76, speed: -0.18, x: 0.1, y: 1, rotate: 0.02 },
  { id: 5, icon: '🩺', left: '8%', top: '82%', size: 68, speed: -0.14, x: 0.2, y: -1, rotate: 0.03 },
  { id: 6, icon: '🦴', left: '88%', top: '88%', size: 64, speed: -0.20, x: -0.1, y: -1, rotate: -0.03 }
]

onMounted(() => {
  // App.vue 中真正发生滚动的是 main-content
  scrollContainer = root.value?.parentElement

  moduleTitleGroups = Array.from(
    root.value?.querySelectorAll('.section-heading, .goal-content') || []
  )
    .map((module) => ({
      title: module.querySelector('h2'),
      subtitle: module.querySelector('p')
    }))
    .filter(({ title }) => title)

  if (scrollContainer) {
    scrollContainer.addEventListener('scroll', handleScroll, { passive: true })
    handleScroll()
  }
})

onUnmounted(() => {
  scrollContainer?.removeEventListener('scroll', handleScroll)
})
</script>

<template>
  <div ref="root" class="home-page" :style="backgroundStyle">

    <!-- 背景插画 -->
    <div class="decoration-layer">
      <div
        v-for="item in decorations"
        :key="item.id"
        class="decoration"
        :style="{
          left: item.left,
          top: item.top,
          fontSize: item.size + 'px',
          ...decorationStyle(item)
        }"
      >
        {{ item.icon }}
      </div>
    </div>

    <!-- 首屏 -->
    <section class="hero-section">
      <div class="hero-content">
        <div class="hero-tag">
          ✚ MEDICAL SCIENCE
        </div>

        <h1>
          关注健康<br>
          <span>从科学认知开始</span>
        </h1>

        <p class="hero-subtitle">
          让医学知识更简单，让健康生活更容易
        </p>

        <p class="hero-description">
          面向大众的医学健康科普平台，围绕常见疾病、
          科学预防与应急救护，帮助每个人了解健康知识，
          提高自我保护与应急处理能力。
        </p>

        <div class="hero-keywords">
          <span>常见疾病</span>
          <span>健康预防</span>
          <span>应急救护</span>
        </div>

        <div class="scroll-hint">
          <span>向下滚动，了解更多</span>
          <span class="arrow">↓</span>
        </div>
      </div>
    </section>

    <!-- 项目介绍 -->
    <section class="intro-section">
      <div class="section-heading">
        <span>ABOUT US</span>
        <h2>关于医学科普</h2>
        <p>从认识疾病到预防疾病，再到掌握急救方法</p>
      </div>

      <div class="intro-card">
        <div class="intro-symbol">✚</div>
        <div>
          <h3>让健康知识触手可及</h3>
          <p>
            本项目致力于向普通大众普及医学健康知识，
            以通俗易懂的方式介绍常见疾病、预防措施
            以及基础急救知识，帮助公众形成正确的
            健康认知，提高健康意识与应急能力。
          </p>
        </div>
      </div>
    </section>

    <!-- 三大内容 -->
    <section class="feature-section">
      <div class="section-heading">
        <span>WHAT WE PROVIDE</span>
        <h2>我们的科普内容</h2>
        <p>三个方向，构建基础健康知识体系</p>
      </div>

      <div class="feature-list">
        <article class="feature-card disease">
          <div class="feature-number">01</div>
          <div class="feature-icon">🫀</div>
          <h3>常见疾病科普</h3>
          <p>
            介绍常见疾病的基本知识、主要症状、
            相关诱因及注意事项，帮助公众
            更好地认识身体健康状况。
          </p>
          <span class="feature-label">DISEASE KNOWLEDGE</span>
        </article>

        <article class="feature-card prevention">
          <div class="feature-number">02</div>
          <div class="feature-icon">🛡️</div>
          <h3>科学预防指南</h3>
          <p>
            从合理饮食、规律运动、生活习惯
            等方面介绍疾病预防措施，
            倡导科学健康的生活方式。
          </p>
          <span class="feature-label">HEALTH PREVENTION</span>
        </article>

        <article class="feature-card first-aid">
          <div class="feature-number">03</div>
          <div class="feature-icon">🚑</div>
          <h3>应急急救知识</h3>
          <p>
            普及常见突发状况的基础处理方法，
            介绍必要的急救知识，
            提高公众应急救护意识。
          </p>
          <span class="feature-label">FIRST AID</span>
        </article>
      </div>
    </section>

    <!-- 项目目标 -->
    <section class="goal-section">
      <div class="goal-content">
        <span>OUR MISSION</span>
        <h2>健康始于了解<br>守护始于行动</h2>
        <p>
          用简单易懂的方式传播医学知识，
          让更多人学会关注健康、预防疾病，
          并在紧急情况下掌握必要的急救技能。
        </p>
        <article class="feature-card go-to" @click="emit('navigate', 'list')"> 
          <div class="feature-number"></div>
          <div class="feature-icon">>>></div>
          <h3>点击开始浏览</h3>
          <p>
            
          </p>
          <span class="feature-label">PRESS TO VIEW</span>
        </article>
      </div>
    </section>

    <footer class="home-footer">
      MEDICAL SCIENCE CENTER
      <span>医学科普 · 健康生活 · 科学急救</span>
    </footer>

  </div>
</template>

<style scoped>
.home-page {
  position: relative;
  min-height: 100%;
  overflow: hidden;
  color: #294657;
  transition: background-color 0.15s linear;
}

/* 背景插画层 */
.decoration-layer {
  position: absolute;
  inset: 0;
  pointer-events: none;
  z-index: 0;
  overflow: hidden;
}

.decoration {
  position: absolute;
  opacity: 0.20;
  filter: saturate(0.8);
  will-change: transform;
}

/* 首屏 */
.hero-section {
  min-height: 680px;
  height: 100vh;
  max-height: 900px;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 40px;
  position: relative;
  z-index: 1;
  text-align: center;
}

.hero-content {
  max-width: 760px;
}

.hero-tag {
  display: inline-block;
  padding: 9px 20px;
  border: 1px solid #a9c6d1;
  border-radius: 30px;
  color: #548296;
  font-size: 12px;
  letter-spacing: 3px;
  margin-bottom: 28px;
}

.hero-content h1 {
  font-size: clamp(38px, 5vw, 66px);
  line-height: 1.35;
  margin: 0;
  font-weight: 750;
  letter-spacing: 3px;
}

.hero-content h1 span {
  color: #4c899e;
}

.hero-subtitle {
  font-size: 19px;
  margin-top: 26px;
  color: #587786;
}

.hero-description {
  max-width: 570px;
  margin: 24px auto;
  color: #718994;
  font-size: 15px;
  line-height: 2;
}

.hero-keywords {
  display: flex;
  justify-content: center;
  gap: 14px;
  margin-top: 30px;
  flex-wrap: wrap;
}

.hero-keywords span {
  padding: 9px 20px;
  border-radius: 30px;
  background: #ffffff99;
  color: #527b8b;
  font-size: 13px;
}

.scroll-hint {
  margin-top: 75px;
  color: #7896a2;
  font-size: 12px;
  letter-spacing: 2px;
}

.arrow {
  display: block;
  font-size: 24px;
  margin-top: 10px;
  animation: float 1.5s infinite ease-in-out;
}

@keyframes float {
  50% {
    transform: translateY(8px);
  }
}

/* 通用标题 */
.intro-section,
.feature-section,
.goal-section {
  position: relative;
  z-index: 1;
  padding: 100px 8%;
}

.section-heading {
  text-align: center;
  margin-bottom: 55px;
}

.section-heading > span,
.goal-content > span {
  color: #6795a5;
  font-size: 12px;
  letter-spacing: 4px;
}

.section-heading h2 {
  font-size: 32px;
  margin: 15px 0;
}

.section-heading p {
  color: #80949d;
  font-size: 14px;
}

/* 项目介绍 */
.intro-card {
  max-width: 850px;
  margin: auto;
  padding: 45px;
  display: flex;
  gap: 30px;
  align-items: center;
  background: #ffffffbd;
  border: 1px solid #ffffff;
  border-radius: 22px;
  box-shadow: 0 15px 45px #5c819010;
}

.intro-symbol {
  width: 80px;
  height: 80px;
  flex-shrink: 0;
  display: grid;
  place-items: center;
  border-radius: 20px;
  background: #dcecf1;
  color: #528ca0;
  font-size: 48px;
}

.intro-card h3 {
  margin-top: 0;
  font-size: 21px;
}

.intro-card p {
  color: #718994;
  line-height: 2;
  font-size: 14px;
}

/* 三大内容卡片 */
.feature-list {
  display: grid;
  grid-template-columns: repeat(3, minmax(0, 1fr));
  gap: 22px;
  max-width: 1100px;
  margin: auto;
}

.feature-card {
  position: relative;
  padding: 32px 25px;
  min-height: 310px;
  border-radius: 20px;
  background: #ffffffbd;
  border: 1px solid #ffffff;
  transition: transform 0.3s, box-shadow 0.3s;
}

.feature-card:hover {
  transform: translateY(-8px);
  box-shadow: 0 18px 35px #54798b20;
}

.feature-number {
  color: #a5b9c0;
  font-size: 13px;
  letter-spacing: 2px;
}

.feature-icon {
  font-size: 48px;
  margin: 25px 0 15px;
}

.feature-card h3 {
  font-size: 19px;
}

.feature-card p {
  color: #718994;
  font-size: 13px;
  line-height: 2;
}

.feature-label {
  display: inline-block;
  margin-top: 15px;
  font-size: 9px;
  letter-spacing: 1.5px;
  color: #86a4af;
}

/* 项目目标 */
.goal-section {
  padding-top: 100px;
  padding-bottom: 100px;
  background: #e5eff2aa;
  text-align: center;
}

.goal-content {
  max-width: 650px;
  margin: auto;
  position: relative;
}

.goal-content h2 {
  font-size: 38px;
  line-height: 1.5;
  margin: 25px 0;
}

.goal-content p {
  color: #718994;
  font-size: 14px;
  line-height: 2;
}

.goal-cross {
  color: #d65b60;
  font-size: 55px;
  margin-top: 35px;
}

/* 页脚 */
.home-footer {
  position: relative;
  z-index: 1;
  padding: 35px;
  text-align: center;
  color: #75919c;
  font-size: 11px;
  letter-spacing: 3px;
}

.home-footer span {
  display: block;
  margin-top: 10px;
  letter-spacing: 1px;
}

/* 小屏适配 */
@media (max-width: 800px) {
  .feature-list {
    grid-template-columns: 1fr;
  }

  .intro-card {
    padding: 25px;
    flex-direction: column;
    text-align: center;
  }

  .hero-section {
    min-height: 650px;
  }

  .decoration {
    opacity: 0.12;
  }
}

@media (prefers-reduced-motion: reduce) {
  .arrow {
    animation: none;
  }

  .feature-card {
    transition: none;
  }
}

.section-heading h2,
.goal-content h2,
.section-heading p,
.goal-content > p {
  transform-origin: center;
  transition: transform 0.3s ease;
}

.module-title-enlarged {
  transform: scale(1.6);
}

.module-subtitle-enlarged {
  transform: scale(1.08);
}
</style>
