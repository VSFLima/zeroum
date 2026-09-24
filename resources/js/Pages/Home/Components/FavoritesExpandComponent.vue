<template>
  <!-- Quarto componente -->
  <div class="scroll-container w-full max-w-[450px] mx-auto scroll-hidden pr-2 pl-2">

    <!-- Influencer mode começa aqui -->
    <div v-if="isInfluencerMode && influencer_games && influencer_games.length > 0">
      <div class="w-full flex justify-between mb-1 items-center pl-2 pr-2 pt-2">
        <div class="flex items-center">
          <img src="/public/assets/images/populareshv.png" alt="Ícone" class="w-auto h-8 mr-1"/>
          <h2 class="text-[16px] title-color" style="font-family: 'Helvetica', sans-serif;">{{ $t('Favoritos') }}</h2>
        </div>
      </div>

      <div :class="['grid', `grid-cols-${setting.collum_games}`, 'gap-3', 'mb-2']">
        <CassinoGameCard
          v-for="(game, index) in displayedInfluencerGames"
          :key="game.game_code"
          :index="index"
          :title="game.game_name"
          :cover="game.cover"
          :gamecode="game.game_code"
          :type="game.distribution"
          :game="game"
        />
      </div>

      <!-- Quantidade de jogos ativos -->
      <div class="text-center text-color mb-1" style="font-family: 'Helvetica', sans-serif;">
        <p> A exibir {{ displayedInfluencerGames.length }} jogos entre {{ influencer_games.length }} HOT Games</p>
      </div>

      <!-- Botão Expandir -->
      <div class="flex justify-center items-center w-full">
        <button v-if="showExpandInfluencerButton" @click="expandInfluencerGames" class="text-color px-4 rounded" style="font-family: 'Helvetica', sans-serif;">
          Carregar mais
        </button>
      </div>
    </div>
    <!-- Influencer mode termina aqui-->

  </div>
</template>

<script>
import HttpApi from "@/Services/HttpApi.js";
import { useAuthStore } from "@/Stores/Auth.js";
import CassinoGameCard from "@/Pages/Cassino/Components/CassinoGameCard.vue";
import { useSettingStore } from "@/Stores/SettingStore.js";

export default {
  components: {
    CassinoGameCard
  },
  data() {
    return {
      currentInfluencerPage: 0,
      influencer_games: null,
      isLoading: true
    }
  },
  computed: {
    displayedInfluencerGames() {
      const endIndex = (this.currentInfluencerPage + 1) * 12;
      return this.influencer_games.slice(0, endIndex);
    },
    showExpandInfluencerButton() {
      return this.displayedInfluencerGames.length < this.influencer_games.length;
    },
    isInfluencerMode() {
      const authStore = useAuthStore();
      return authStore.user && authStore.user.influencer_mode;
    },
     setting() {
            const authStore = useSettingStore();
            return authStore.setting;
        },
  },
  methods: {
     getSetting() {
            const settingStore = useSettingStore();
            this.setting = settingStore.setting;
        },
    async getInfluencerGames() {
      try {
        const response = await HttpApi.get('influencer/games');
        this.influencer_games = response.data.influencer_games;
      } catch (error) {
        console.error("Erro ao obter jogos de influencer:", error);
      } finally {
        this.isLoading = false;
      }
    },
    async initializeMethods() {
      await this.getInfluencerGames();
    },
    expandInfluencerGames() {
      this.currentInfluencerPage++;
    }
  },
  async created() {
    await this.initializeMethods();
  }
};
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

body {
  font-family: 'Helvetica', sans-serif; /* Define a fonte Helvetica para todo o documento */
}
</style>
