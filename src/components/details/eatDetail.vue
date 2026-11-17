
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

// 饮食健康要点数据
const topics = [
  {
    name: '均衡膳食',
    en: 'Balanced Diet',
    desc: '没有单一食物能提供全部营养，食物多样化是健康饮食的基础原则。',
    points: ['食物多样谷类为主', '每天摄入12种以上食物', '每周达到25种以上', '粗细粮搭配'],
    care: '参照"中国居民膳食宝塔"安排餐盘：一半蔬菜水果，四分之一主食，四分之一蛋白质。'
  },
  {
    name: '控制盐摄入',
    en: 'Reduce Sodium',
    desc: '高盐饮食与高血压、胃癌、肾脏负担加重密切相关，多数中国人盐摄入超标。',
    points: ['每日食盐<5克', '警惕隐形盐', '少咸菜腌制品', '用香料替代部分盐'],
    care: '酱油、蚝油、咸菜、加工肉都含大量"隐形盐"；习惯重口味者可逐步减盐让味蕾适应。'
  },
  {
    name: '控油控糖',
    en: 'Less Oil & Sugar',
    desc: '过量油脂和添加糖是肥胖、脂肪肝、龋齿和代谢疾病的重要推手。',
    points: ['每日油25-30克', '添加糖<25克', '少油炸糕点', '不喝或少喝含糖饮料'],
    care: '多用蒸煮炖少煎炸；看配料表识别隐藏糖分，"无糖食品"不等于可以随便吃。'
  },
  {
    name: '膳食纤维',
    en: 'Dietary Fiber',
    desc: '膳食纤维促进肠道蠕动、平稳血糖血脂，但国人平均摄入量普遍不足。',
    points: ['蔬菜300-500克/天', '水果200-350克/天', '全谷物替代精米面', '薯类豆类常上桌'],
    care: '蔬果尽量吃够量，主食中三分一换成燕麦、糙米、玉米等全谷物和杂豆。'
  },
  {
    name: '充足饮水',
    en: 'Hydration',
    desc: '水参与体温调节、代谢运输等几乎所有生理活动，缺水直接影响精力与健康。',
    points: ['每天1500-1700毫升', '少量多次饮用', '晨起一杯温水', '运动后及时补水'],
    care: '不要等口渴才喝；观察尿液颜色，淡黄色说明水分摄入基本充足。'
  },
  {
    name: '规律三餐',
    en: 'Regular Meals',
    desc: '进食时间紊乱会影响消化节律和血糖稳定，暴饮暴食加重胃肠负担。',
    points: ['早餐吃好', '午餐吃饱', '晚餐七分饱', '细嚼慢咽'],
    care: '两餐间隔4-6小时，晚餐安排在睡前3小时前完成；吃饭时专心进食，放慢速度。'
  }
]

// 常见饮食误区提醒
const warnings = [
  '不吃主食减肥——易导致低血糖、脱发、月经紊乱，减的是水分和肌肉',
  '汤比肉更有营养——绝大部分蛋白质仍在肉里，喝汤弃肉得不偿失',
  '水果代替正餐——果糖过量照样长胖，且缺乏蛋白质和必需脂肪酸',
  '趁热吃更健康——长期吃超过65°C的食物会增加食管癌风险',
  '鲜榨果汁等于水果——损失膳食纤维，糖分浓缩升血糖更快'
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
        "病从口入"不仅是防细菌，更是防不良饮食习惯。本板块整理了
        {{ topics.length }} 项权威膳食指南的核心建议，以及 {{ warnings.length }} 个
        最常见的饮食误区，帮助你把每一餐吃得科学。
      </p>
    </section>

    <section class="disease-grid">
      <article
        v-for="item in topics"
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
          <span class="care-label">实践建议</span>
          <p>{{ item.care }}</p>
        </div>
      </article>
    </section>

    <section class="warning-card">
      <h2>这些饮食误区要避开</h2>
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
      共整理 {{ topics.length }} 项膳食建议 · {{ warnings.length }} 条误区提醒
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

/* 实践建议 */
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

/* 误区卡 */
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
