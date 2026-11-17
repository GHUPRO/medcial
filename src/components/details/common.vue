
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

// 常见疾病数据
const diseases = [
  {
    name: '感冒',
    en: 'Common Cold',
    desc: '急性上呼吸道感染，多由病毒引起，季节交替时高发，属于自限性疾病。',
    symptoms: ['鼻塞流涕', '咽部干痒', '低热咳嗽', '全身乏力'],
    care: '多休息、多饮温水，一般 5-7 天可自愈；症状明显时可对症用药缓解。'
  },
  {
    name: '流行性感冒',
    en: 'Influenza',
    desc: '由流感病毒引起的急性呼吸道传染病，秋冬季节流行，传染性强。',
    symptoms: ['突发高热', '头痛肌痛', '明显乏力', '干咳咽痛'],
    care: '发病 48 小时内使用抗病毒药物效果最好；建议每年接种流感疫苗。'
  },
  {
    name: '高血压',
    en: 'Hypertension',
    desc: '未使用降压药情况下，非同日三次测量血压 ≥ 140/90 mmHg 即可诊断。',
    symptoms: ['头晕头胀', '心悸耳鸣', '颈部发紧', '多数无症状'],
    care: '每日食盐摄入低于 5 克，规律服用降压药，定期监测血压并记录。'
  },
  {
    name: '2型糖尿病',
    en: 'Type 2 Diabetes',
    desc: '以血糖升高为特征的代谢性疾病，与遗传、肥胖、生活方式密切相关。',
    symptoms: ['多饮多尿', '多食易饥', '体重下降', '伤口不易愈合'],
    care: '控制总热量摄入，餐后规律运动，遵医嘱用药并监测空腹及餐后血糖。'
  },
  {
    name: '急性胃肠炎',
    en: 'Acute Gastroenteritis',
    desc: '因进食不洁食物或受凉引起的胃肠道急性炎症，夏秋季多见。',
    symptoms: ['腹痛腹泻', '恶心呕吐', '发热畏寒', '脱水乏力'],
    care: '清淡饮食、及时补充水分和电解质；呕吐腹泻严重时需就医补液。'
  },
  {
    name: '偏头痛',
    en: 'Migraine',
    desc: '反复发作的搏动性头痛，女性多见，常与遗传、内分泌和情绪相关。',
    symptoms: ['单侧头痛', '搏动性疼痛', '畏光畏声', '恶心呕吐'],
    care: '记录发作诱因（睡眠、饮食、压力），发作期在安静暗处休息，规律作息减少诱因。'
  }
]

// 需要立即就医的危险信号
const warnings = [
  '高热持续 3 天以上不退，或体温超过 40°C',
  '出现意识模糊、抽搐、剧烈头痛、喷射性呕吐',
  '胸痛、胸闷伴呼吸困难，或心悸明显',
  '血压突然升高超过 180/120 mmHg 并伴不适',
  '呕血、便血或腹泻导致明显脱水（口干、尿少、站立头晕）'
]
</script>

<template>
  <div class="detail-content">

    <header>
      <span class="category">MEDICAL KNOWLEDGE</span>
      <h1>{{ title }}</h1>
      <p>{{ entitle }}</p>
    </header>

    <section class="intro-card">
      <h2>板块简介</h2>
      <p>
        常见疾病是日常门诊中发病率最高的一类健康问题。了解它们的典型表现和基本处理原则，
        可以帮助我们及时识别、合理就医、避免延误。本板块收录 {{ diseases.length }} 种最常见的疾病，
        覆盖呼吸、消化、代谢等系统。
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
          <span class="care-label">护理要点</span>
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
      共收录 {{ diseases.length }} 种常见疾病 · {{ warnings.length }} 条就医警示
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
  margin: 0;
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

/* 护理要点 */
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
