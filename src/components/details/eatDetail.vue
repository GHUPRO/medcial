
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
      <p>均衡膳食是健康的基础，没有单一食物能提供全部营养，食物多样化是健康饮食的第一原则；科学的饮食结构不仅能控制体重，还能显著降低高血压、糖尿病、心脑血管疾病等慢性病的风险。</p>
    </section>

    <section>
      <h2>常见症状</h2>
      <p>长期高盐、高糖、高油饮食易引发肥胖、高血压、糖尿病、高血脂等慢性病，营养不均衡还会导致贫血、免疫力下降、疲劳乏力等问题。</p>
    </section>

    <section>
      <h2>预防方式</h2>
      <p>控制每日食盐低于 5 克、烹调油 25-30 克、添加糖低于 25 克，保证蔬菜、水果、全谷物和优质蛋白摄入，规律三餐、充足饮水，避免暴饮暴食和经常熬夜吃夜宵。</p>
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
