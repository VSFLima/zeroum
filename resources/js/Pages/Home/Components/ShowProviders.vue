<template>
    <div :key="index" class="game-list flex flex-col mt-2 relative p-2">
        <div class="w-full flex justify-between mb-2">
            <h2 class="text-[16px] title-color ml-2" style="font-family: 'Helvetica', sans-serif;">{{ $t(provider.name) }}</h2>
            <div class="flex">
                <RouterLink
                    :to="{ name: 'casinosAll', params: { provider: provider.id, category: 'all' } }"
                    class="item-game text-[14px] px-3 py-1 text-color">
                    {{ $t('Tudo') }}
                </RouterLink>
            </div>
        </div>

         <div :class="['grid', `grid-cols-${setting.collum_games}`, 'gap-3', 'mb-2']">
            <CassinoGameCard
                v-for="(game, gameIndex) in displayedGames"
                :key="gameIndex"
                :index="gameIndex"
                :title="game.game_name"
                :cover="game.cover"
                :gamecode="game.game_code"
                :type="game.distribution"
                :game="game"
            />
        </div>

        <!-- Quantidade de jogos ativos -->
        <div class="text-center mb-1 text-color" style="font-family: 'Helvetica', sans-serif;">
            <p> A exibir {{ displayedGames.length }} jogos entre {{ provider.games.length }} jogos</p>
        </div>

        <!-- Botão Expandir -->
        <div class="flex justify-center items-center w-full">
            <button v-if="showExpandButton" @click="loadMoreGames" class="text-color px-4 rounded" style="font-family: 'Helvetica', sans-serif;">
                Carregar mais
            </button>
        </div>
    </div>
</template>

<script>
import { ref, computed } from 'vue';
import { RouterLink } from 'vue-router';
import CassinoGameCard from '@/Pages/Cassino/Components/CassinoGameCard.vue';
import { useSettingStore } from "@/Stores/SettingStore.js";

export default {
    props: ['provider', 'index'],
    components: { CassinoGameCard, RouterLink },
    data() {
        return {
            gamesPerPage: 12, // Número de jogos por página
            displayedGames: [],
            currentPage: 0,
        };
    },
    computed: {
        showExpandButton() {
            return this.displayedGames.length < this.provider.games.length;
        },
         setting() {
            const authStore = useSettingStore();
            return authStore.setting;
        }
    },
    methods: {
        loadMoreGames() {
            const startIndex = this.currentPage * this.gamesPerPage;
            const newGames = this.provider.games.slice(startIndex, startIndex + this.gamesPerPage);
            this.displayedGames = [...this.displayedGames, ...newGames];
            this.currentPage++;
        },
        getSetting() {
            const settingStore = useSettingStore();
            this.setting = settingStore.setting;
        },
    },
    mounted() {
        // Carrega os primeiros 12 jogos ao inicializar
        this.loadMoreGames();
    },
};
</script>

<style scoped>
/* Estilos específicos se necessário */
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

body {
  font-family: 'Helvetica', sans-serif; /* Define a fonte Helvetica para todo o documento */
  font-style: normal;
    font-weight: 400;
}
</style>
