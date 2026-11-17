
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
const diseaseCards = [
  {
    "name": "卒中预警",
    "english": "Stroke Warning Signs",
    "description": "脑卒中发生时需要尽快识别并启动急救流程，时间非常重要。",
    "tags": [
      "面部突然不对称",
      "单侧肢体无力",
      "言语突然不清",
      "突发视力或平衡异常"
    ],
    "prevention": "立即联系当地急救服务，记下症状出现时间，不要自行驾车送医。"
  },
  {
    "name": "急性胸痛",
    "english": "Acute Chest Pain",
    "description": "胸部压迫、紧缩或疼痛可能与心脏等重要器官问题有关。",
    "tags": [
      "胸部压迫感",
      "气短",
      "冷汗",
      "不适放射至肩臂或下颌"
    ],
    "prevention": "新发、严重或持续胸痛应立即联系急救服务。"
  },
  {
    "name": "严重过敏反应",
    "english": "Anaphylaxis",
    "description": "严重过敏反应可能迅速影响呼吸或循环，属于医疗急症。",
    "tags": [
      "呼吸困难",
      "喉咙或舌头肿胀",
      "头晕虚弱",
      "全身反应迅速出现"
    ],
    "prevention": "立即联系急救服务；如患者有医生开具的急救药物，按既定医疗指导使用。"
  },
  {
    "name": "严重呼吸困难",
    "english": "Severe Breathing Difficulty",
    "description": "明显呼吸困难可能由多种急症导致，需要及时专业评估。",
    "tags": [
      "无法完整说话",
      "呼吸明显费力",
      "口唇颜色异常",
      "意识状态改变"
    ],
    "prevention": "立即联系当地急救服务，遵循调度人员指导。"
  }
]
</script>

<template>
  <div class="detail-content">

    <header>
      <span class="category">MEDICAL KNOWLEDGE</span>
      <h1>{{ title }}</h1>
      <p>{{ entitle }}</p>
    </header>

   <div class="card-grid">
      <article v-for="card in diseaseCards" :key="card.name" class="knowledge-card">
        <h2>{{ card.name }}</h2>
        <div class="english-name">{{ card.english }}</div>
        <p class="description">{{ card.description }}</p>

        <div class="tag-list">
          <span v-for="tag in card.tags" :key="tag" class="tag">{{ tag }}</span>
        </div>

        <div class="card-divider"></div>
        <h3>防护要点</h3>
        <p class="prevention">{{ card.prevention }}</p>
      </article>
    </div>

    <p class="disclaimer">健康科普内容仅供学习参考，不能替代医生诊断和治疗建议。出现紧急情况请联系当地急救服务。</p>
  </div>
</template>

<style scoped>
.detail-page {
  width: 100%;
  padding: 8px 4px 36px;
  color: #263f55;
  box-sizing: border-box;
}
.page-heading {
  margin: 0 0 22px;
  padding: 8px 10px 4px;
}
.eyebrow {
  color: #8ca3b4;
  font-size: 11px;
  font-weight: 700;
  letter-spacing: 2px;
}
.page-heading h1 {
  margin: 8px 0 5px;
  color: #243e55;
  font-size: 27px;
  font-weight: 700;
}
.page-heading p {
  margin: 0;
  color: #8ca0b2;
  font-size: 13px;
  letter-spacing: 1px;
}
.card-grid {
  display: grid;
  grid-template-columns: repeat(2, minmax(0, 1fr));
  gap: 16px;
  align-items: stretch;
}
.knowledge-card {
  min-width: 0;
  padding: 22px 20px 20px;
  background: #fff;
  border: 1px solid #edf1f3;
  border-radius: 14px;
  box-shadow: 0 3px 14px rgba(41, 70, 88, .035);
  box-sizing: border-box;
  transition: transform .2s ease, box-shadow .2s ease;
}
.knowledge-card:hover {
  transform: translateY(-3px);
  box-shadow: 0 8px 22px rgba(41, 70, 88, .08);
}
.knowledge-card h2 {
  margin: 0 0 7px;
  color: #243e55;
  font-size: 17px;
  line-height: 1.45;
  font-weight: 700;
}
.english-name {
  margin-bottom: 12px;
  color: #91a4b6;
  font-size: 12px;
  letter-spacing: 1px;
}
.description {
  min-height: 48px;
  margin: 0 0 12px;
  color: #617b91;
  font-size: 13px;
  line-height: 1.85;
}
.tag-list {
  display: flex;
  flex-wrap: wrap;
  gap: 7px;
  min-height: 28px;
}
.tag {
  display: inline-flex;
  align-items: center;
  padding: 4px 10px;
  border-radius: 16px;
  background: #eaf2f5;
  color: #5c8299;
  font-size: 11px;
  line-height: 1.4;
  white-space: nowrap;
}
.card-divider {
  margin: 14px 0 16px;
  border-top: 1px dashed #d9e4e9;
}
.knowledge-card h3 {
  margin: 0 0 7px;
  color: #4f83a1;
  font-size: 12px;
  font-weight: 700;
}
.prevention {
  margin: 0;
  color: #617b91;
  font-size: 12px;
  line-height: 1.85;
}
.disclaimer {
  margin: 20px 6px 0;
  color: #9aa8b1;
  font-size: 11px;
  line-height: 1.8;
}
@media (max-width: 680px) {
  .card-grid { grid-template-columns: 1fr; gap: 12px; }
  .page-heading h1 { font-size: 23px; }
  .knowledge-card { padding: 19px 17px; }
  .description { min-height: 0; }
}
</style>
