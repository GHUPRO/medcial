
<script setup>
defineProps({
  title: {
    type: String,
    default: '疾病介绍'
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
      <p>heartab</p>
    </header>

    <section>
      <h2>基本介绍</h2>
      <p>这里填写疾病的基本介绍。</p>
    </section>

    <section>
      <h2>常见症状</h2>
      <p>这里填写常见症状及相关注意事项。</p>
    </section>

    <section>
      <h2>预防方式</h2>
      <p>这里填写科学的预防建议。</p>
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
