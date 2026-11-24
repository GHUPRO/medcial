
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
</script>

<template>
  <div class="detail-content">

    <header>
      <span class="category">MEDICAL KNOWLEDGE</span>
      <h1>{{ title }}</h1>
      <p>{{ entitle }}</p>
    </header>

    <section>
      <h2>基本介绍</h2>
      <p>急救是在专业医护人员到达前，对突发伤病者采取的最初救助措施。心脏骤停、气道异物梗阻、严重外伤等危急情况，黄金抢救时间往往只有短短几分钟，正确及时的现场处理能显著提高存活率、减少伤残，为后续专业救治争取宝贵时间。</p>
    </section>

    <section>
      <h2>常见症状</h2>
      <p>心脏骤停、气道异物梗阻、大出血、严重烧烫伤、中暑、骨折、溺水等都是需要及时急救的常见危急情况，表现为意识丧失、呼吸心跳停止、持续出血、剧痛或高热等，出现这些情况应立即施救并拨打 120。</p>
    </section>

    <section>
      <h2>预防方式</h2>
      <p>积极参加正规急救培训，掌握心肺复苏（CPR）和海姆立克急救法，熟悉附近 AED 位置；家中备好常用急救箱，牢记 120 急救电话，日常注意用电、用火和交通安全，预防意外伤害发生。</p>
    </section>

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
</style>
