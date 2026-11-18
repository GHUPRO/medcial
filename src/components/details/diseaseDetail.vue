
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

// 感染性疾病数据
const diseases = [
  {
    name: '流行性感冒',
    en: 'Influenza',
    desc: '流感病毒引起的急性呼吸道传染病，主要通过飞沫传播，人群普遍易感。',
    symptoms: ['突发高热', '全身酸痛', '乏力明显', '咳嗽咽痛'],
    care: '按呼吸道隔离至热退后 48 小时；每年秋季接种疫苗是有效的预防方式。'
  },
  {
    name: '新型冠状病毒感染',
    en: 'COVID-19',
    desc: '新冠病毒引起的呼吸道传染病，多数为轻症，老年人及基础病患者需重点关注。',
    symptoms: ['发热干咳', '咽干咽痛', '肌肉酸痛', '嗅觉味觉减退'],
    care: '对症治疗为主，保证休息和水分；高危人群发病早期可在医生指导下使用抗病毒药物。'
  },
  {
    name: '手足口病',
    en: 'Hand-Foot-Mouth Disease',
    desc: '肠道病毒引起的传染病，5 岁以下儿童高发，夏秋季为发病高峰。',
    symptoms: ['手口足皮疹', '口腔疱疹疼痛', '低热', '拒食流涎'],
    care: '隔离两周左右，衣物餐具分开消毒；如出现肢体抖动、高热不退需警惕重症。'
  },
  {
    name: '水痘',
    en: 'Varicella',
    desc: '水痘-带状疱疹病毒初次感染引起，皮疹分批出现，传染性极强。',
    symptoms: ['斑丘疹变疱疹', '瘙痒明显', '低热不适', '同批皮疹多种形态'],
    care: '隔离至全部疱疹结痂；剪短指甲避免抓挠，疱疹破溃处可涂抗菌药膏防感染。'
  },
  {
    name: '麻疹',
    en: 'Measles',
    desc: '麻疹病毒引起的急性出疹性传染病，传染性强，疫苗接种后发病率大幅下降。',
    symptoms: ['发热3-4天后出疹', '口腔黏膜斑', '结膜炎流涕', '红色斑丘疹'],
    care: '隔离至出疹后 5 天；保持眼鼻口腔清洁，补充维生素 A；接种麻腮风疫苗可预防。'
  },
  {
    name: '细菌性痢疾',
    en: 'Bacillary Dysentery',
    desc: '志贺菌引起的肠道传染病，经"手-口"途径传播，夏秋季多见。',
    symptoms: ['腹痛腹泻', '黏液脓血便', '里急后重', '发热'],
    care: '轻症口服补液盐防脱水，遵医嘱使用抗菌药物；饭前便后洗手是关键防线。'
  }
]

// 需要立即就医的危险信号
const warnings = [
  '持续高热超过 3 天，退烧药效果不佳',
  '出现意识改变、抽搐、肢体抖动或颈项强直',
  '皮肤出现瘀点、瘀斑或出血样皮疹',
  '腹泻严重导致眼窝凹陷、尿量明显减少等脱水表现',
  '婴幼儿、孕妇、老人出现上述任何一种情况'
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
        感染性疾病由细菌、病毒等病原体引起，具有传染性。了解传播途径和隔离要点，
        既能保护自己，也能避免传染家人。本板块收录 {{ diseases.length }} 种常见感染性疾病。
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
      共收录 {{ diseases.length }} 种感染性疾病 · {{ warnings.length }} 条就医警示
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
