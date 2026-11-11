
<script setup>
import { ref, markRaw } from 'vue'

import DiseaseDetail from './details/heartab.vue'
import PreventionDetail from './details/heartab.vue'
import HealthDetail from './details/heartab.vue'
import Heartab from './details/heartab.vue'
import Common from './details/common.vue'

// ==============================
// 1. 十二个功能入口
// ==============================

const sectors = [
  { id: 'd1', label: '常见疾病', page: markRaw(Common) },
  { id: 'd2', label: '呼吸系统', page: markRaw(DiseaseDetail) },
  { id: 'd3', label: '消化系统', page: markRaw(DiseaseDetail) },
  { id: 'd4', label: '心血管', page: markRaw(Heartab) },

  { id: 'd5', label: '神经系统', page: markRaw(DiseaseDetail) },
  { id: 'd6', label: '感染性疾病', page: markRaw(DiseaseDetail) },
  { id: 'd7', label: '日常预防', page: markRaw(PreventionDetail) },
  { id: 'd8', label: '饮食健康', page: markRaw(PreventionDetail) },

  { id: 'd9', label: '运动健康', page: markRaw(PreventionDetail) },
  { id: 'd10', label: '健康习惯', page: markRaw(HealthDetail) },
  { id: 'd11', label: '健康知识', page: markRaw(HealthDetail) },
  { id: 'd12', label: '注意事项', page: markRaw(HealthDetail) }
]

// ==============================
// 2. 当前界面状态
// ==============================

const currentDetail = ref(null)
const selectedSector = ref(null)

const isExpanded = ref(false)

// ==============================
// 3. 点击扇区
// ==============================

function selectSector(item, index) {
  if (isExpanded.value) return

  selectedSector.value = item
  currentDetail.value = item.page

  // 保存被点击扇区的方向
  selectedSector.value = {
    ...item,
    angle: index * 30 + 15
  }

  isExpanded.value = true
}

// 点击红十字，返回导航
function goBack() {
  isExpanded.value = false
}

// 动画结束后清除详情
function onNavigationTransitionEnd(event) {
  if (
    event.propertyName === 'transform' &&
    !isExpanded.value
  ) {
    currentDetail.value = null
    selectedSector.value = null
  }
}

// ==============================
// 4. SVG 几何计算
// ==============================

const centerX = 400
const centerY = 300

const innerRadius = 112
const outerRadius = 255

// 极坐标转 SVG 坐标
function polar(radius, angle) {
  const rad = angle * Math.PI / 180

  return {
    x: centerX + radius * Math.cos(rad),
    y: centerY + radius * Math.sin(rad)
  }
}

// 生成环形扇区路径
function sectorPath(index) {
  const gap = 2.5

  const startAngle = index * 30 - 90 + gap / 2
  const endAngle = (index + 1) * 30 - 90 - gap / 2

  const p1 = polar(outerRadius, startAngle)
  const p2 = polar(outerRadius, endAngle)
  const p3 = polar(innerRadius, endAngle)
  const p4 = polar(innerRadius, startAngle)

  return [
    `M ${p1.x} ${p1.y}`,
    `A ${outerRadius} ${outerRadius} 0 0 1 ${p2.x} ${p2.y}`,
    `L ${p3.x} ${p3.y}`,
    `A ${innerRadius} ${innerRadius} 0 0 0 ${p4.x} ${p4.y}`,
    'Z'
  ].join(' ')
}

// 扇区文字位置
function labelPosition(index) {
  const angle = index * 30 - 75

  return polar(185, angle)
}

// ==============================
// 5. 缩小导航盘移动到对角位置
// ==============================

function navigationPosition() {
  if (!isExpanded.value) {
    // 初始状态：界面正中央
    return {
      left: '50%',
      top: '50%'
    }
  }

  // 展开状态：移动到左上角
  return {
    left: '88%',
    top: '14%'
  }
}
</script>

<template>
  <div class="home-stage">

    <!-- ========================
         详情层
    ========================= -->
    <Transition name="detail">
      <div
        v-if="currentDetail"
        class="detail-layer"
      >
        <component
          :is="currentDetail"
          :title="selectedSector?.label"
          :sector-id="selectedSector?.id"
        />
      </div>
    </Transition>

    <!-- ========================
         导航整体
    ========================= -->
    <div
      class="navigation-art"
      :class="{ expanded: isExpanded }"
      :style="navigationPosition()"
      @transitionend="onNavigationTransitionEnd"
    >

      <svg
        class="navigation-svg"
        viewBox="0 0 800 600"
        xmlns="http://www.w3.org/2000/svg"
      >

        <!-- 十二个环形扇区 -->
        <g class="sector-group">

          <g
            v-for="(item, index) in sectors"
            :key="item.id"
            class="sector"
            @click="selectSector(item, index)"
          >
            <path
              :d="sectorPath(index)"
              :class="{
                selected: selectedSector?.id === item.id
              }"
            />

            <text
              :x="labelPosition(index).x"
              :y="labelPosition(index).y"
              class="sector-label"
            >
              {{ item.label }}
            </text>
          </g>

        </g>

        <!-- 中央红十字 -->
        <g
          class="cross-group"
          @click="goBack"
        >
          <circle
            cx="400"
            cy="300"
            r="108"
            fill="#ffffff"
            stroke="#e8edef"
            stroke-width="2"
          />

          <path
            class="cross"
            d="
              M 365 235
              H 435
              V 265
              H 465
              V 335
              H 435
              V 365
              H 365
              V 335
              H 335
              V 265
              H 365
              Z
            "
          />

          <text
            x="400"
            y="390"
            class="cross-caption"
          >
            MEDICAL
          </text>
        </g>

      </svg>

    </div>

  </div>
</template>

<style scoped>

/* =========================
   主容器
========================= */

.home-stage {
  position: relative;
  width: 100%;
  height: 100%;
  min-height: 600px;

  overflow: hidden;
  background: #f3f6f8;
}

/* =========================
   导航整体
========================= */

.navigation-art {
  position: absolute;
  width: min(88vw, 760px, 110vh);
  aspect-ratio: 4 / 3;

  left: 50%;
  top: 50%;

  transform: translate(-50%, -50%) scale(1);
  transform-origin: center center;

  z-index: 5;

  transition:
    left 0.45s cubic-bezier(.22,.8,.25,1),
    top 0.45s cubic-bezier(.22,.8,.25,1),
    transform 0.45s cubic-bezier(.22,.8,.25,1);
}

.navigation-art.expanded {
  transform: translate(-50%, -50%) scale(0.25);
}



/* SVG */
.navigation-svg {
  width: 100%;
  height: 100%;
  display: block;
  overflow: visible;
}

/* =========================
   扇区
========================= */

.sector {
  cursor: pointer;
}

.sector path {
  fill: #dce8ed;
  stroke: #ffffff;
  stroke-width: 3;

  transition:
    fill .2s,
    filter .2s;
}

.sector:hover path {
  fill: #8db8c5;
  filter: drop-shadow(0 2px 5px #7895a055);
}

.sector path.selected {
  fill: #d94343;
}

.sector-label {
  fill: #315d78;
  font-size: 16px;
  font-weight: 600;
  text-anchor: middle;
  dominant-baseline: middle;

  pointer-events: none;
}

/* =========================
   红十字
========================= */

.cross-group {
  cursor: pointer;
}

.cross {
  fill: #d94343;
  filter: drop-shadow(0 3px 8px #0002);
}

.cross-caption {
  fill: #315d78;
  font-size: 11px;
  font-weight: bold;
  text-anchor: middle;
  letter-spacing: 2px;
}

/* =========================
   详情层
========================= */

.detail-layer {
  position: absolute;
  inset: 0;
  z-index: 2;

  padding: 35px;
  overflow-y: auto;
}

/* 同时淡入淡出 */
.detail-enter-active {
  transition: opacity 0.3s ease;
}

.detail-leave-active {
  transition: opacity 0.15s ease;
}

.detail-enter-from,
.detail-leave-to {
  opacity: 0;
}

</style>
