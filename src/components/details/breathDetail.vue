
<script setup>
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

// 呼吸系统疾病数据
const diseases = [
  {
    name: '支气管哮喘',
    en: 'Bronchial Asthma',
    desc: '气道慢性炎症导致的可逆性气道阻塞，常由过敏原、感染或运动诱发。',
    symptoms: ['反复喘息', '胸闷气促', '夜间咳嗽', '呼气延长'],
    care: '远离尘螨、花粉等过敏原，遵医嘱规律使用吸入糖皮质激素，随身携带急救吸入剂。'
  },
  {
    name: '社区获得性肺炎',
    en: 'Pneumonia',
    desc: '在医院外由细菌、病毒等引起的肺部感染，老年人和儿童发病率较高。',
    symptoms: ['发热寒战', '咳嗽咳痰', '胸痛气促', '疲乏纳差'],
    care: '明确病原后足量足疗程抗感染治疗；老年患者症状常不典型，持续低热需警惕。'
  },
  {
    name: '慢性阻塞性肺疾病',
    en: 'COPD',
    desc: '以持续气流受限为特征的慢性肺病，长期吸烟是最主要的危险因素。',
    symptoms: ['长期咳痰', '活动后气短', '桶状胸', '冬季加重'],
    care: '戒烟是延缓病情最有效的措施；配合长效支气管扩张剂和呼吸康复训练。'
  },
  {
    name: '慢性支气管炎',
    en: 'Chronic Bronchitis',
    desc: '每年咳嗽咳痰累计 3 个月、连续 2 年以上的气管慢性炎症，吸烟者多见。',
    symptoms: ['晨间咳嗽', '白色黏痰', '反复感染', '天气变冷加重'],
    care: '戒烟并避免二手烟，冬季注意保暖防感冒，急性加重期及时抗感染治疗。'
  },
  {
    name: '过敏性鼻炎',
    en: 'Allergic Rhinitis',
    desc: '接触过敏原后鼻黏膜发生的变态反应，分为季节性和常年性两种。',
    symptoms: ['阵发性喷嚏', '清水样鼻涕', '鼻痒鼻塞', '眼痒流泪'],
    care: '检测并回避过敏原，发作期使用鼻用糖皮质激素和抗组胺药，可考虑脱敏治疗。'
  },
  {
    name: '肺结核',
    en: 'Pulmonary Tuberculosis',
    desc: '结核分枝杆菌引起的慢性传染病，经飞沫传播，规范治疗治愈率高。',
    symptoms: ['咳嗽超两周', '咯血痰中带血', '午后低热', '夜间盗汗消瘦'],
    care: '确诊后按"早期、规律、全程、适量、联合"原则服药 6 个月以上，不可自行停药。'
  }
]

// 需要立即就医的危险信号
const warnings = [
  '咯血或痰中带血，尤其是反复出现',
  '呼吸困难突然加重、口唇或指甲发紫（发绀）',
  '指氧饱和度低于 93%，或静息状态下明显气促',
  '高热伴剧烈胸痛、咳脓痰',
  '哮喘发作时使用急救药物 15 分钟仍无缓解'
]
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

    <section class="intro-card">
      <h2>板块简介</h2>
      <p>
        呼吸系统直接与外界相通，最容易受到病原体、过敏原和空气污染的影响。
        本板块收录 {{ diseases.length }} 种常见呼吸系统疾病，帮助你识别早期信号、
        掌握日常防护要点，并了解哪些情况必须及时就医。
      </p>
    </section>

    <section class="disease-grid">
      <article
        v-for="item in diseases"
        :key="item.name"
        class="disease-card"
      >
        <div class="card-head">
          <h3>{{ item.name }}</h3>
          <span class="card-en">{{ item.en }}</span>
        </div>

        <p class="card-desc">{{ item.desc }}</p>

        <div class="tag-row">
          <span
            v-for="s in item.symptoms"
            :key="s"
            class="tag"
          >
            {{ s }}
          </span>
        </div>

        <div class="card-care">
          <span class="care-label">防护要点</span>
          <p>{{ item.care }}</p>
        </div>
      </article>
    </section>

    <section class="warning-card">
      <h2>出现以下情况请立即就医</h2>
      <ul>
        <li
          v-for="w in warnings"
          :key="w"
        >
          {{ w }}
        </li>
      </ul>
    </section>

    <footer class="page-foot">
      共收录 {{ diseases.length }} 种呼吸系统疾病 · {{ warnings.length }} 条就医警示
    </footer>

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

/* 简介卡 */
.intro-card {
  border-left: 4px solid #4d8297;
}

/* 疾病卡片网格 */
.disease-grid {
  background: transparent;
  padding: 0;

  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
  gap: 16px;
}

.disease-card {
  background: white;
  border-radius: 12px;
  padding: 20px;

  transition: transform 0.2s, box-shadow 0.2s;
}

.disease-card:hover {
  transform: translateY(-3px);
  box-shadow: 0 8px 20px #26414d1f;
}

.card-head h3 {
  margin: 0 0 2px;
  font-size: 18px;
  color: #26394a;
}

.card-en {
  font-size: 12px;
  color: #9aabb7;
  letter-spacing: 1px;
}

.card-desc {
  font-size: 13.5px;
  line-height: 1.7;
  color: #657783;
  margin: 10px 0 12px;
}

/* 症状标签 */
.tag-row {
  display: flex;
  flex-wrap: wrap;
  gap: 6px;
  margin-bottom: 14px;
}

.tag {
  font-size: 12px;
  color: #3e6f88;
  background: #e8f1f5;
  border-radius: 20px;
  padding: 3px 10px;
}

/* 防护要点 */
.card-care {
  border-top: 1px dashed #dde7ec;
  padding-top: 12px;
}

.care-label {
  font-size: 12px;
  font-weight: bold;
  color: #4d8297;
  letter-spacing: 1px;
}

.card-care p {
  font-size: 13px;
  line-height: 1.7;
  color: #657783;
  margin: 6px 0 0;
}

/* 警示卡 */
.warning-card {
  border-left: 4px solid #d94343;
}

.warning-card h2 {
  color: #d94343;
}

.warning-card ul {
  margin: 0;
  padding-left: 20px;
}

.warning-card li {
  line-height: 1.9;
  color: #7d5454;
  font-size: 14px;
}

/* 页脚 */
.page-foot {
  text-align: center;
  font-size: 12px;
  color: #9aabb7;
  padding: 10px 0 20px;
}
</style>
