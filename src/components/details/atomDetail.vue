
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
      <p>消化系统承担食物消化、营养吸收和废物排出，与饮食关系最密切，慢性胃炎、消化性溃疡、胃食管反流病、病毒性肝炎、胆囊炎胆石症、肠易激综合征等是常见疾病，多数与不良饮食习惯和幽门螺杆菌感染密切相关。</p>
    </section>

    <section>
      <h2>常见症状</h2>
      <p>常见有上腹隐痛、餐后饱胀、反酸烧心、嗳气、恶心呕吐、食欲减退、腹泻便秘交替等；一旦出现黑便、呕血、黄疸加重、体重明显下降等警示信号，需立即就医。</p>
    </section>

    <section>
      <h2>预防方式</h2>
      <p>三餐规律、细嚼慢咽，戒烟限酒，少吃辛辣油腻、生冷和腌制食品；检测并规范根除幽门螺杆菌，避免长期滥用止痛药，定期体检并做胃肠镜筛查。</p>
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
