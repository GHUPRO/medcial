
<script setup>
import { computed } from 'vue'
import { detailContents } from './detailData.js'

defineProps({
  title: {
    type: String,
    default: '疾病介绍'
  },
  entitle: {
    type: String,
    default: ''
  },
  sectorId: {
    type: String,
    default: ''
  }
})
const detail = computed(() => detailContents['slow'])
</script>

<template>
  <div class="detail-content">

    <header>
      <span class="category">MEDICAL KNOWLEDGE</span>
      <div class="title-line">
        <h1>{{ title }}</h1>
        <span class="title-hint">点击右上角呼出轮盘</span>
      </div>
      <p>{{ entitle }}</p>
    </header>

   
    <section>
      <h2>{{ detail.heads[0] }}</h2>
      <p class="detail-intro">{{ detail.intro }}</p>
    </section>

    <section>
      <h2>{{ detail.heads[1] }}</h2>
      <ul class="detail-list">
        <li v-for="(item, index) in detail.symptoms" :key="'symptom-' + index">{{ item }}</li>
      </ul>
    </section>

    <section>
      <h2>{{ detail.heads[2] }}</h2>
      <ul class="detail-list">
        <li v-for="(item, index) in detail.prevention" :key="'prevention-' + index">{{ item }}</li>
      </ul>
    </section>

    <section>
      <h2>重点知识卡</h2>
      <div class="detail-grid">
        <article class="detail-card" v-for="(item, index) in detail.cards" :key="'card-' + index">
          <h3>{{ item[0] }}</h3>
          <p>{{ item[1] }}</p>
        </article>
      </div>
    </section>

    <section>
      <h2>相关风险因素</h2>
      <ul class="detail-list">
        <li v-for="(item, index) in detail.risks" :key="'risk-' + index">{{ item }}</li>
      </ul>
    </section>

    <section>
      <h2>何时需要及时就医</h2>
      <div class="detail-notice">
        <strong>健康提醒</strong>
        <p v-for="(item, index) in detail.alerts" :key="'alert-' + index">{{ item }}</p>
      </div>
    </section>

    <section>
      <h2>可以从这些小事做起</h2>
      <ul class="detail-list">
        <li v-for="(item, index) in detail.actions" :key="'action-' + index">{{ item }}</li>
      </ul>
    </section>

    <p class="detail-footer">
      本页面用于健康知识科普，不能替代医生诊断、检查或治疗建议。具体健康问题请咨询专业医务人员；遇到紧急情况，请立即联系当地急救服务。
    </p>

  </div>
</template>

<style scoped>
.detail-content {
  max-width: 900px;
  margin: 0 auto;
  color: #26394a;
}

.category {
  color: #d94343;
  font-size: 12px;
  letter-spacing: 2px;
  font-weight: bold;
}

header {
  margin-bottom: 30px;
}

.title-line {
  display: flex;
  align-items: baseline;
  flex-wrap: wrap;
  column-gap: 12px;
  row-gap: 4px;
}

.title-hint {
  color: #8a9aa3;
  font-size: 12px;
  font-weight: normal;
  white-space: nowrap;
}

header h1 {
  font-size: 30px;
  margin: 12px 0;
}

header p {
  color: #71828e;
}

section {
  background: white;
  border-radius: 12px;
  padding: 22px;
  margin-bottom: 18px;
}

section h2 {
  font-size: 19px;
  margin-top: 0;
}

section p {
  line-height: 1.8;
  color: #657783;
}
.detail-intro {
  margin: 0;
  line-height: 1.9;
}
.detail-grid {
  display: grid;
  grid-template-columns: repeat(3, minmax(0, 1fr));
  gap: 14px;
}
.detail-card {
  min-width: 0;
  padding: 18px;
  border: 1px solid #edf1f3;
  border-radius: 12px;
  background: linear-gradient(145deg, #ffffff, #f8fbfc);
}
.detail-card h3 {
  margin: 0 0 10px;
  color: #314b5c;
  font-size: 16px;
}
.detail-card p {
  margin: 0;
  line-height: 1.8;
  color: #657783;
  font-size: 14px;
}
.detail-list {
  display: grid;
  gap: 12px;
  margin: 0;
  padding: 0;
  list-style: none;
}
.detail-list li {
  position: relative;
  padding: 12px 14px 12px 38px;
  border-radius: 9px;
  background: #f7f9fa;
  color: #657783;
  line-height: 1.8;
}
.detail-list li::before {
  content: '';
  position: absolute;
  left: 15px;
  top: 21px;
  width: 8px;
  height: 8px;
  border-radius: 50%;
  background: #d94343;
}
.detail-notice {
  padding: 18px 20px;
  border-left: 4px solid #d94343;
  border-radius: 8px;
  background: #fff7f5;
  color: #795b57;
  line-height: 1.8;
}
.detail-notice strong {
  display: block;
  margin-bottom: 6px;
  color: #b83e3e;
}
.detail-footer {
  margin: 20px 0 8px;
  color: #89969e;
  font-size: 12px;
  line-height: 1.8;
}
@media (max-width: 760px) {
  .detail-grid { grid-template-columns: 1fr; }
  section { padding: 18px; }
  header h1 { font-size: 25px; }
}
</style>
