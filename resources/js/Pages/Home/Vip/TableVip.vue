<template>
    <div class="relative overflow-x-autosm:rounded-lg w-full">
        <div class="text-xs uppercase justify-center items-center text-color p-4">
          <div class="grid grid-cols-3 gap-2 text-center">
    <div class="border-r border-gray-300 pr-2">Nível</div>
    <div class="border-r border-gray-300 pr-2">Aposta necessária</div>
    <div>Bônus</div>
</div>


        </div>
        <div class="grid grid-cols-1 md:grid-cols-1 lg:grid-cols-1">
            <div v-for="(vip, index) in sortedVips" :key="index" class="card p-2 mt-2 border rounded-lg shadow-md">
                <div class="flex w-full items-center custom-grid">
    <img :src="`/storage/`+vip.bet_symbol" alt="" width="40">
    <div class="custom-font font-medium text-color">
        {{ $t('Level') }} {{ vip.bet_level }}
    </div>
    <div class="custom-font text-color">
        <span class="mr-2">{{ $t('Aposta necessária') }}:</span> R$ {{ vip.bet_required }}
    </div>
    <div class="custom-font text-color">
        <span class="mr-2">{{ $t('Bônus') }}:</span> R$ {{ vip.bet_bonus }}
    </div>
</div>

            </div>
        </div>
    </div>
</template>

<script>
export default {
    props: ['vips', 'vipPoints'],
    data() {
        return {
            isLoading: false,
        }
    },
    computed: {
        sortedVips() {
            // Ordena o array vips pelo campo bet_level
            return this.vips.sort((a, b) => a.bet_level - b.bet_level);
        }
    },
    mounted() {

    },
    methods: {

    },
    async created() {

    },
    watch: {

    },
};
</script>

<style scoped>
.card {
    border: 1px solid var(--borders-and-dividers-colors);
}

.card img {
    border-radius: 50%;
}

.card .text-color {
    color: var(--text-color);
}
.custom-grid {
    display: grid;
    grid-template-columns: auto auto auto auto;
    gap: 10px; /* Opcional: ajusta o espaço entre as colunas */
}
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

body {
  font-family: 'Helvetica', sans-serif; /* Define a fonte Helvetica para todo o documento */
}
.custom-font {
    font-family: 'Helvetica', sans-serif;
    font-size: 12px;
}

</style>
