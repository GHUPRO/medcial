
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
      <p>感冒、流感、高血压、2型糖尿病、急性胃肠炎、偏头痛等是日常门诊中最高发的一类健康问题，多数可通过早期识别、合理处理和健康生活方式有效控制，关键在于掌握基本常识、不拖延就医。</p>
    </section>

    <section>
      <h2>常见症状</h2>
      <p>症状因病而异，常见有发热、咳嗽、鼻塞流涕、头晕头胀、头痛、腹痛腹泻、恶心呕吐，以及多饮多尿、体重下降、心悸乏力等；出现高热不退、意识异常、剧烈胸痛等需立即就医。</p>
    </section>

    <section>
      <h2>预防方式</h2>
      <p>规律作息、均衡饮食、适度运动，戒烟限酒，接种流感等疫苗；定期体检并监测血压、血糖，出现不适及时就医，避免自行滥用药物。</p>
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
