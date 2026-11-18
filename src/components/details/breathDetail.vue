
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
      <p>呼吸系统直接与外界相通，最易受到病原体、过敏原和空气污染影响，支气管哮喘、社区获得性肺炎、慢阻肺、慢性支气管炎、过敏性鼻炎、肺结核等是常见疾病，其中吸烟是最主要、最可控的危险因素。</p>
    </section>

    <section>
      <h2>常见症状</h2>
      <p>常见有咳嗽、咳痰、喘息、气促、胸闷、胸痛、发热、乏力，以及鼻塞、喷嚏、流涕等；出现咯血、口唇发绀、呼吸困难、持续高热等警示信号需立即就医。</p>
    </section>

    <section>
      <h2>预防方式</h2>
      <p>戒烟并远离二手烟，远离尘螨、花粉等过敏原，雾霾天减少外出并佩戴口罩；接种流感疫苗和肺炎疫苗，冬季注意保暖防感冒，慢阻肺、哮喘患者坚持规范用药并定期复查。</p>
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
