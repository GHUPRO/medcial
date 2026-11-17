
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

// 急救方法数据
const methods = [
  {
    name: '心肺复苏（CPR）',
    en: 'CPR',
    desc: '针对心脏骤停的关键救命技术，黄金抢救时间只有 4 分钟。',
    points: ['判断意识和呼吸', '按压深度5-6厘米', '频率100-120次/分', '按压吹气比30:2'],
    care: '按压位置为两乳头连线中点；未经培训者可只做持续胸外按压，同时呼叫 120 并取AED。'
  },
  {
    name: '海姆立克急救法',
    en: 'Heimlich Maneuver',
    desc: '气道异物梗阻的现场急救手法，适用于进食时突然无法说话、咳嗽、呼吸的人。',
    points: ['站于患者背后', '冲击肚脐上方', '向内向上快速冲击', '1岁以下用拍背压胸法'],
    care: '梗阻解除后仍建议就医检查；孕妇和肥胖者改为胸部冲击；无效时立即呼叫120。'
  },
  {
    name: '止血与包扎',
    en: 'Bleeding Control',
    desc: '外伤出血的现场处理原则：先压迫止血，再清洁包扎，减少感染和失血。',
    points: ['直接压迫优先', '干净敷料加压', '抬高伤肢', '止血带记录时间'],
    care: '敷料被浸透不要揭开，叠加继续压；用止血带须每 40-60 分钟放松一次并记录时间。'
  },
  {
    name: '烧烫伤处理',
    en: 'Burn Care',
    desc: '热液、蒸汽、火焰导致的烧烫伤，正确早期处理能显著减轻损伤程度。',
    points: ['冷水冲15-20分钟', '小心脱除衣物', '清洁纱布覆盖', '不涂牙膏酱油'],
    care: '牢记"冲脱泡盖送"；不要挑破水泡，不要冰敷；面部、关节和大面积烧伤尽快送医。'
  },
  {
    name: '中暑急救',
    en: 'Heatstroke First Aid',
    desc: '高温环境下体温调节失衡，重症热射病死亡率极高，需快速降温处理。',
    points: ['移至阴凉通风处', '解开衣物散热', '冷水擦拭身体', '清醒者补充淡盐水'],
    care: '意识不清、体温超40°C、停止出汗属热射病先兆，边降温边立即送医，不可延误。'
  },
  {
    name: '骨折固定',
    en: 'Fracture Immobilization',
    desc: '外伤后疑似骨折时，正确固定可以避免二次损伤，为送医争取条件。',
    points: ['不随意搬动', '不复位不揉捏', '就地取材固定', '超过关节上下固定'],
    care: '用木板、杂志等临时固定伤肢；怀疑脊柱损伤时保持轴线翻身，等待专业救援。'
  }
]

// 急救通用原则
const warnings = [
  '任何急救的第一步都是确保现场安全，不要盲目施救',
  '第一时间拨打 120，说清地址、病情和人数，不要先挂电话',
  '急救不替代就医——处理完尽早送医院进一步检查',
  '不要给意识不清的人喂水喂药，防止误吸窒息',
  '建议每个家庭参加一次正规急救培训并熟悉附近AED位置'
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
        意外发生时，正确急救能为专业救援赢得宝贵时间。本板块收录
        {{ methods.length }} 种最常用的现场急救技术，图解要点便于记忆，
        但请记住：急救技能需要实操培训才能真正掌握。
      </p>
    </section>

    <section class="disease-grid">
      <article
        v-for="item in methods"
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
            v-for="s in item.points"
            :key="s"
            class="tag"
          >
            {{ s }}
          </span>
        </div>

        <div class="card-care">
          <span class="care-label">操作要点</span>
          <p>{{ item.care }}</p>
        </div>
      </article>
    </section>

    <section class="warning-card">
      <h2>急救通用原则</h2>
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
      共收录 {{ methods.length }} 项急救技术 · {{ warnings.length }} 条通用原则
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

/* 卡片网格 */
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

/* 要点标签 */
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

/* 操作要点 */
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

/* 通用原则卡 */
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
