
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
      <p>感染性疾病由细菌、病毒等病原体引起，可通过飞沫、接触、粪口、血液等途径传播，流感、新冠、手足口病、水痘、麻疹、细菌性痢疾等是常见类型；了解传播途径和隔离要点，既能保护自己也能避免传染家人。</p>
    </section>

    <section>
      <h2>常见症状</h2>
      <p>常见有发热、咳嗽、咽痛、皮疹、疱疹、口腔溃疡、腹泻、腹痛、呕吐、乏力、肌肉酸痛等；出现高热不退、呼吸困难、意识改变、皮肤瘀点瘀斑等需立即就医。</p>
    </section>

    <section>
      <h2>预防方式</h2>
      <p>勤洗手、常通风，按时接种疫苗；患者按医嘱隔离至痊愈，注意饮食和饮水卫生，饭前便后洗手；婴幼儿、孕妇、老人等高危人群加强防护，减少聚集。</p>
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
