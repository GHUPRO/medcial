
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

// 消化系统疾病数据
const diseases = [
  {
    name: '慢性胃炎',
    en: 'Chronic Gastritis',
    desc: '胃黏膜的慢性炎症，幽门螺杆菌感染是最常见病因，不良饮食习惯会加重病情。',
    symptoms: ['上腹隐痛', '餐后饱胀', '反酸嗳气', '食欲减退'],
    care: '三餐规律、细嚼慢咽，戒烟限酒；建议检测幽门螺杆菌，阳性者规范根除治疗。'
  },
  {
    name: '消化性溃疡',
    en: 'Peptic Ulcer',
    desc: '包括胃溃疡和十二指肠溃疡，胃酸与幽门螺杆菌是主要致病因素。',
    symptoms: ['节律性上腹痛', '胃溃疡餐后痛', '十二指肠饥饿痛', '夜间痛醒'],
    care: '规范抑酸治疗 4-8 周，根除幽门螺杆菌；避免长期服用布洛芬等止痛药。'
  },
  {
    name: '胃食管反流病',
    en: 'GERD',
    desc: '胃内容物反流入食管引起不适，与食管下括约肌松弛、腹压增高等有关。',
    symptoms: ['烧心反酸', '胸骨后灼痛', '夜间呛咳', '咽部异物感'],
    care: '睡前 3 小时不进食，少吃高脂、辛辣食物和浓茶咖啡，睡觉时抬高床头 15-20cm。'
  },
  {
    name: '病毒性肝炎',
    en: 'Viral Hepatitis',
    desc: '由肝炎病毒（甲、乙、丙等）引起的肝脏炎症，乙肝最常见且需长期管理。',
    symptoms: ['乏力纳差', '尿色加深', '皮肤巩膜黄染', '肝区不适'],
    care: '乙肝患者定期复查肝功能和病毒载量，遵医嘱抗病毒；乙肝疫苗是最有效的预防手段。'
  },
  {
    name: '胆囊炎与胆石症',
    en: 'Cholecystitis & Gallstones',
    desc: '胆汁淤积或胆固醇代谢异常形成结石，进食油腻后常诱发急性发作。',
    symptoms: ['右上腹绞痛', '饭后腹胀', '放射至右肩', '发作时恶心呕吐'],
    care: '低脂饮食、规律吃早餐；反复发作或结石较大时，可考虑腹腔镜胆囊切除。'
  },
  {
    name: '肠易激综合征',
    en: 'IBS',
    desc: '常见的功能性肠病，检查无器质性病变，与肠道敏感、精神压力密切相关。',
    symptoms: ['反复腹痛', '腹泻或便秘交替', '排便后缓解', '情绪紧张加重'],
    care: '记录并回避诱发食物，规律作息、适度运动，必要时配合调节肠道菌群和心理疏导。'
  }
]

// 需要立即就医的危险信号
const warnings = [
  '呕血、呕咖啡色样物，或排黑色柏油样大便',
  '剧烈腹痛持续超过 2 小时不缓解，或腹部摸到硬块',
  '黄疸快速加深伴发热、腹痛',
  '短期内不明原因体重明显下降',
  '频繁呕吐无法进食进水，超过 24 小时'
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
        消化系统承担着食物消化、营养吸收和废物排出的任务，"吃出来的问题"也最多。
        本板块收录 {{ diseases.length }} 种常见消化系统疾病，介绍典型症状、常见病因和日常养护方法。
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
          <span class="care-label">养护要点</span>
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
      共收录 {{ diseases.length }} 种消化系统疾病 · {{ warnings.length }} 条就医警示
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

/* 养护要点 */
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
