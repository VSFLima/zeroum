<template>
  <div class="page-container">
    <div v-if="!isLoading" class="content-wrapper">
      <!-- Conteúdo Principal com Jackpot -->
      <div v-if="filteredCategories.length > 0" class="content-container">
        <!-- JackpotComponent inserido aqui para rolar junto com os jogos -->
        <JackpotComponent /> 

        <FavoritesExpandComponent /> 

        <div class="relative pr-2 pl-2 w-full">
          <div v-for="(category, index) in sortedCategories" :key="index" :id="category.slug" class="category-section mb-6">
            <div class="flex items-center p-1 mb-2">
              <img :src="`/storage/${category.image_select}`" alt="Imagem da categoria" class="h-6 w-auto">
              <h2 class="text-color custom-font text-[18px] ml-1">{{ category.name }}</h2>
            </div>

            <div :class="['grid', `grid-cols-${setting.collum_games}`, 'gap-3', 'mb-2']">
              <CassinoGameCard 
                v-for="(game, gameIndex) in getDisplayedGames(category)" 
                :key="gameIndex" 
                :index="gameIndex" 
                :title="game.game_name" 
                :cover="game.cover" 
                :gamecode="game.game_code" 
                :type="game.distribution" 
                :game="game"/>
            </div>

            <!-- Quantidade de jogos ativos -->
            <div class="text-center mb-1 text-color" style="font-family: 'Helvetica', sans-serif;">
              <p> A exibir {{ category.displayedGames.length }} jogos entre {{ category.games.length }} jogos</p>
            </div>
            <!-- Botão Expandir -->
            <div class="flex justify-center items-center w-full">
              <button v-if="showExpandButton(category)" @click="loadMoreGames(category)" class="text-color px-4 rounded" style="font-family: 'Helvetica', sans-serif;">
                Carregar mais
              </button>
            </div>
          </div>
        </div>
      </div>

      <div v-else class="empty-data flex flex-col justify-center items-center text-center my-36">
        <img :src="`/assets/images/img_none_sj.webp`" alt="" class="w-auto h-auto max-h-[140px]">
        <h3 class="text-color custom-font">{{ $t('Sem jogos disponíveis') }}</h3>
      </div>
    </div>
  </div>
</template>

<script>
import HttpApi from "@/Services/HttpApi.js";
import CassinoGameCard from "@/Pages/Cassino/Components/CassinoGameCard.vue";
import JackpotComponent from "@/Pages/Home/Components/JackpotComponent.vue";
import FavoritesExpandComponent from "@/Pages/Home/Components/FavoritesExpandComponent.vue";
import { useSettingStore } from "@/Stores/SettingStore.js";

export default {
  components: {
    CassinoGameCard,
        JackpotComponent,
    FavoritesExpandComponent
  },
  data() {
    return {
      isLoading: false,
      categories: null,
      gamesPerPage: 12, // Número de jogos por página
    };
  },
  mounted() {
    this.getCasinoCategories();
  },
  methods: {
    async getCasinoCategories() {
      this.isLoading = true;
      try {
        const response = await HttpApi.get('categories');
        const categories = response.data.categories;
        const promises = categories.map(async (category) => {
          const gamesResponse = await HttpApi.get(`/casinos/games?category=${category.slug}`);
          category.games = gamesResponse.data.games.data;
          category.displayedGames = []; // Inicializa a lista de jogos exibidos
          return category;
        });
        this.categories = await Promise.all(promises);
        this.sortCategoriesById(); // Ordena as categorias por ID
        // Carrega os primeiros jogos para todas as categorias
        this.filteredCategories.forEach(category => this.loadMoreGames(category));
      } catch (error) {
        console.error(error);
      } finally {
        this.isLoading = false;
      }
    },
    sortCategoriesById() {
      if (this.categories) {
        this.categories.sort((a, b) => a.id - b.id); // Ordena as categorias por ID
      }
    },
    loadMoreGames(category) {
      const startIndex = category.displayedGames.length;
      const newGames = category.games.slice(startIndex, startIndex + this.gamesPerPage);
      category.displayedGames = [...category.displayedGames, ...newGames];
    },
    getDisplayedGames(category) {
      return category.displayedGames || [];
    },
    showExpandButton(category) {
      return category.displayedGames.length < category.games.length;
    },
    getSetting() {
            const settingStore = useSettingStore();
            this.setting = settingStore.setting;
        },
  },
  computed: {
    filteredCategories() {
      return this.categories?.filter(category => category.games && category.games.length > 0) || [];
    },
    sortedCategories() {
      return this.filteredCategories.sort((a, b) => a.id - b.id); // Ordena as categorias filtradas por ID
    },
     setting() {
            const authStore = useSettingStore();
            return authStore.setting;
        }
  },
};
</script>

<style scoped>
.page-container {
  display: flex;
  flex-direction: column;
  height: 100%;
  overflow: hidden; /* Impede a rolagem na página inteira */
}

.content-wrapper {
  flex: 1;
  display: flex;
  flex-direction: column;
  overflow-y: auto; /* Permite rolagem apenas no conteúdo principal */
  scrollbar-width: none; /* Firefox */
  -ms-overflow-style: none;  /* IE and Edge */
}

.content-wrapper::-webkit-scrollbar {
  display: none; /* Chrome, Safari, and Opera */
}

.content-container {
  flex: 1;
  padding-bottom: 5px; /* Espaço para o conteúdo fixo na parte inferior, como o botão expandir */
}

.category-section {
  margin-bottom: 1.5rem;
}

.empty-data {
  margin-top: 1.5rem;
  margin-bottom: 1.5rem;
}

.text-color {
  color: var(--text-color); /* Substitua pelo valor da cor do texto */
}

.relative {
  position: relative;
}

img {
  max-width: 10%; /* Faz com que a imagem não exceda o contêiner */
  height: auto; /* Mantém a proporção da imagem */
}
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

body {
  font-family: 'Helvetica', sans-serif;
}

.custom-font {
  font-family: 'Helvetica', sans-serif;
  font-style: normal;
  line-height: normal;
  font-weight: 400;
}
</style>
