<template>
    <div class="page">
        <p>常见病症列表</p>
        <img :src="imglist[listnum].img" :alt="imglist[listnum].name" />
        <button @click="listnum = (listnum + 1) % imglist.length">下一张</button>
    </div>

</template>
<script setup>
    import { ref } from 'vue'

    const imglist = [
        { id: 1, name: '疾病1', img: 'https://via.placeholder.com/150' },
        { id: 2, name: '疾病2', img: 'https://via.placeholder.com/150' },
        { id: 3, name: '疾病3', img: 'https://via.placeholder.com/150' },
        { id: 4, name: '疾病4', img: 'https://via.placeholder.com/150' },
        { id: 5, name: '疾病5', img: 'https://via.placeholder.com/150' },
    ]
    const listnum = ref(0)
</script>
<style scoped>
    .page {
        padding: 40px;
        color: #26394a;
        display: flex;
        flex-direction: column;
    }
    .page img {
        max-width: 100%;
        height: auto;
        margin-bottom: 20px;
    }
    .page button {
        padding: 10px 20px;
        background-color: #26394a;
        color: white;
        border: none;
        cursor: pointer;
    }
    .page button:hover {
        background-color: #1a2a3a;
    }
    .page p {
        margin-bottom: 20px;
        font-size: 18px;
        align-self: center;
    }

</style>