<template>
  <div class="top-bar w-full max-w-[450px] background-bottom-navigation custom-font">
    <button @click="$router.push('/')" class="back-button" style="width: 12px; height: auto;">
      <img :src="`/storage/` + setting.icon_wt_10" alt="Home" class="home-icon" style="width: 10px; height: auto;">
    </button>
    <span class="category-name">{{ category }}</span>
  </div>

  <ListLayout>
    <div class="mobile-content mt-10 mb-16 w-full max-w-[450px] custom-font">
      <div v-if="isLoading" class="loading-container text-center">
        <div class="loading-spinner"></div>
      </div>


      <div v-if="!isLoading" class="w-full max-w-[450px]">
        <div class="px-2 py-3">
          <!-- Barra de Pesquisa -->
          <form class="mb-4">
            <label for="search" class="mb-2 text-sm font-medium text-color sr-only">
              {{ $t('Search') }}
            </label>
            <div class="relative">
              <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                <svg class="w-4 h-4 text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20">
                  <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z"/>
                </svg>
              </div>
              <input v-model="searchTerm" @input="searchGames" type="search" id="search" class="block w-full px-4 py-2 pl-10 text-sm text-white border-search" :placeholder="$t('Search')" required>
            </div>
          </form>

          <!-- Container da sidebar e conteúdo principal -->
          <div class="flex">
            <!-- Sidebar -->
<aside class="w-1/5 p-0 bg-transparent sticky top-0 max-h-screen overflow-auto scrollbar-hidden">
    <ul class="space-y-4">
        <div v-if="categories" class="category-list">
            <div class="flex flex-col mb-5">
                <RouterLink v-for="(category, index) in sortedCategories" 
                    :key="index" 
                    :to="{ name: 'casinosAll', params: { provider: 'all', category: category.slug }}" 
                    class="w-full text-center mb-4 rounded-lg site-menu-item border-1">
                    <div class="flex items-center justify-center mt-1">
                        <img :src="category.slug === route.params.category ? `/storage/` + category.image_select : `/storage/` + category.image" class="w-auto h-6">
                    </div>
                    <p class="mt-1 text-color p-1">{{ $t(category.name) }}</p>
                </RouterLink>
            </div>
        </div>
    </ul>
</aside>


            <!-- Conteúdo Principal -->
            <div class="main-content w-4/5 pl-4 right-0">
              
              <div v-if="games && games?.total > 0" class="games-container overflow-auto max-h-[80vh] md:max-h-[80vh] scrollbar-hidden" style="padding-bottom: 50px;">
                <div class="relative w-full">
                  <div class="grid grid-cols-3 gap-4 mb-2">
                    <CassinoGameCard v-for="(game, index) in games.data" :key="index" :index="index" :title="game.game_name" :cover="game.cover" :gamecode="game.game_code" :type="game.distribution" :game="game"/>
                  </div>
                </div>
              </div>
              <div v-else class="empty-data flex flex-col justify-center items-center text-center my-36">
                <img :src="`/assets/images/img_none_sj.webp`" alt="" class="w-auto h-auto max-h-[150px]">
                <h3 class="text-color">{{ $t('Sem jogos disponiveis') }}</h3>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="fixed flex justify-center w-full  max-w-[450px] items-center bottom-0 background-bottom-navigation">
        <CustomPagination :data="games" @pagination-change-page="getGameData"/>
      </div>
    </div>
  </ListLayout>
</template>

<script>

import ListLayout from "@/Layouts/ListLayout.vue";
import HttpApi from "@/Services/HttpApi.js";
import CassinoGameCard from "@/Pages/Cassino/Components/CassinoGameCard.vue";
import CustomPagination from "@/Components/UI/CustomPagination.vue";
import { useRoute } from "vue-router";
import { computed, ref, watch } from "vue";
import LoadingComponent from "@/Components/UI/LoadingComponent.vue";
import HeaderComponent from "@/Components/UI/HeaderComponent.vue";
import ShowProviders from "@/Pages/Home/Components/ShowProviders.vue";
import { searchGameStore } from "@/Stores/SearchGameStore.js";
import { useSettingStore } from "@/Stores/SettingStore.js";

export default {
    props: [],
    components: {
        ShowProviders,
        HeaderComponent,
        LoadingComponent,
        CustomPagination,
        CassinoGameCard,
        ListLayout
    },
    data() {
        return {
            isLoading: false,
            games: null,
            searchTerm: '',
            provider: null,
            providers: null,
            categories: null,
            pageSize: 30,
        }
    },
    setup(props) {
        const route = useRoute();

        watch(() => route.params.category, (newCategory, oldCategory) => {
            this.category = newCategory;
            this.getGameData();
        });

        return {
            route
        };
        const { setting } = useSettingStore();
        return {
            setting,
        };
    },
    mounted() {
        this.initializeMethods();
        this.forcePageSize();
},

    methods: {
        forcePageSize: async function () {
            this.getGameData(1, true, this.pageSize); // Força a chamada da API com pageSize fixo
        },
        getCasinoCategories: async function() {
          const _this = this;
          await HttpApi.get('categories')
              .then(response => {
                  _this.categories = response.data.categories;
              })
              .catch(error => {
                  Object.entries(JSON.parse(error.request.responseText)).forEach(([key, value]) => {

                  });
              });
      },
      initializeMethods: async function() {
          await this.getCasinoCategories();
          
      },
        searchGames: async function () {
            if (this.searchTerm.length > 2) {
                await this.getGameData(1, false);
            } else {
                await this.getGameData(1, false);
            }
        },
        getGameData: async function (page = 1, loading = true, pageSize = 30) {
    this.isLoading = loading;
    const provider = this.route.params.provider;
    const category = this.route.params.category;

    this.provider = provider;
    this.category = category;

    try {
        const response = await HttpApi.get(`/casinos/games?page=${page}&pageSize=${pageSize}&searchTerm=${this.searchTerm}&category=${category}&provider=${provider}`);
        this.games = response.data.games;
    } catch (error) {
        console.error(error);
    } finally {
        this.isLoading = false;
    }
},
        filterGames: async function (filterType) {
            this.searchTerm = ''; // Clear the search term when filtering by type
            this.category = filterType; // Update category based on the filter type
            await this.getGameData(1, true); // Fetch the games with the selected filter
        },
        filterByProvider: async function (provider) {
            this.provider = provider; // Update provider based on the selected provider
            await this.getGameData(1, true); // Fetch the games with the selected provider
        }
  },
    getSetting() {
            const settingStore = useSettingStore();
            this.setting = settingStore.setting;
        },
    async created() {
        this.category = this.route.params.category;
        await this.getGameData(1, false);
    },
    watch: {
        'route.params.category'(newCategory, oldCategory) {
            this.category = newCategory;
            this.getGameData(1, true);
        }
    },
    computed: {
    sortedCategories() {
        // Ordena as categorias pelo ID
        return this.categories.sort((a, b) => a.id - b.id);
      },
    setting() {
            const authStore = useSettingStore();
            return authStore.setting;
        }

  },
};
</script>

<style scoped>
:root {
  --input-primary-color: rgba(247, 250, 252, 0); /* Cor de fundo clara com 80% de opacidade */
}

aside {
  background-color: var(--input-primary-color);
   max-height: 80vh; /* Altura máxima da sidebar */
    overflow-y: auto; /* Habilita o scroll na sidebar */
  margin-bottom: 60px;
}

.mobile-content {
  position: fixed;
  height: 100vh; /* Altura total da viewport */
  display: flex;
  flex-direction: column;
  background-color: var(--background-color-cassino);
}
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

body {
  font-family: 'Helvetica', sans-serif; /* Define a fonte Helvetica para todo o documento */
   overflow-x: hidden; /* Impede rolagem horizontal em todo o corpo */
}
.custom-font {
    font-family: 'Helvetica', sans-serif;
    font-size: 12px;
}

.top-bar {
  position: fixed;
  z-index: 40; /* Ajuste conforme necessário */
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 10px;
  border-bottom-width: 1px;
  border-bottom-width: solid;
  border-color: var(--borders-and-dividers-colors);
}
.loading-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  min-height: 400px; /* Altura mínima do carregamento */
}
.loading-spinner {
  border: 3px solid rgba(255, 255, 255, 0.2);
  border-top: 3px solid #ffffff; /* Cor do spinner */
  border-radius: 50%;
  width: 40px; /* Largura do spinner */
  height: 40px; /* Altura do spinner */
  animation: spin 1s linear infinite; /* Animação do spinner */
}

/* Adiciona animação de rotação */
@keyframes spin {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}
/* Estilo geral do input */
.border-search {
  border-radius: 8px;
  border-style: solid;
  border-width: 1px;
  border-color: var(--borders-and-dividers-colors);
  background-color: var(--search-back);
  color: var(--text-color);
}

/* Estilo do placeholder para navegadores que suportam a pseudo-classe ::placeholder */
.border-search::placeholder {
  color: var(--placeholder-color);
}

/* Estilo do placeholder para navegadores baseados no WebKit (Chrome, Safari, etc.) */
.border-search::-webkit-input-placeholder {
  color: var(--placeholder-color);
}

/* Estilo do placeholder para navegadores baseados no Mozilla (Firefox) */
.border-search:-moz-placeholder {
  color: var(--placeholder-color);
  opacity: 1; /* Opcional, para garantir a opacidade do placeholder */
}

/* Estilo do placeholder para navegadores baseados no Microsoft (Edge, Internet Explorer) */
.border-search:-ms-input-placeholder {
  color: var(--placeholder-color);
}
.main-content {
  flex-grow: 1; /* Crescerá para ocupar todo o espaço disponível */
  overflow-y: auto; /* Adiciona scroll apenas se necessário */
  overflow-x: hidden; /* Impede rolagem horizontal */
}

.category-name {
  color: var(--text-color);
  font-size: 1.1rem;
  text-align: center;
  flex-grow: 1;
}

.fixed {
  padding: 5px;
  width: 100%;
  position: fixed;
  z-index: 999; /* Ajuste conforme necessário */
  border-top-width: solid;
  border-top-width: 1px;
  border-color: var(--borders-and-dividers-colors);
}

.scrollbar-hidden::-webkit-scrollbar {
  width: 0;
}

.scrollbar-hidden {
  overflow: -moz-scrollbars-none;
  -ms-overflow-style: none;
  scrollbar-width: none;
}

.category-list {
    max-height: 75vh; /* Altura máxima do container */
    overflow: auto; /* Permite rolagem */
    scrollbar-width: none; /* Oculta a barra de rolagem */
    -ms-overflow-style: none; /* Para IE 10+ */
}

/* Para navegadores baseados em WebKit (Chrome, Safari, etc.) */
.category-list::-webkit-scrollbar {
    display: none; /* Oculta a barra de rolagem */
}

.category-list img {
    max-width: 40%; /* A imagem ocupa no máximo 100% do seu contêiner */
    height: auto; /* Mantém a proporção da imagem */
}

.category-list p {
    font-size: 0.90rem; /* Tamanho padrão do texto */
}

/* Ajustando o texto em telas menores */
@media (max-width: 450px) {
    .category-list p {
        font-size: 0.77rem; /* Reduzindo o tamanho do texto em telas menores */
    }
}
@media (max-width: 360px) {
    .category-list p {
        font-size: 0.60rem; /* Reduzindo o tamanho do texto em telas menores */
    }
}


</style>