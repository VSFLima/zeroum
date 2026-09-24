<template>
    <div class="footer-color p-2 pb-12 md:pb-5 max-w-[450px]">

    

       <div class="md:w-6/6 2xl:w-6/6 m-auto flex justify-center flex-wrap">
    <div class="grid grid-cols-1 gap-4">
          <div class="flex grid grid-cols-3 p-2">
                <div class="footer-list"> <!-- Adicionei a classe 'items-center' para centralizar verticalmente -->
                    <h3 class="custom-font-2 title-color">{{ $t('Cassino') }}</h3>
                    <ul class="list-none mt-2">
                        <li class="transition duration-700 text-color custom-font" >
                        <a @click="copyToClipboard(referencelink)">{{ $t('Convidar') }}</a></li>
                        <li class="transition duration-700 text-color custom-font">
                        <a @click="$router.push({ path: '/profile/promocoes', query: { tab: 'events' } })" :class="['w-full text-center', { active: isActive('') }]"> 
                            <span >Eventos</span>
                            </a>
                        </li>
                         <li class="transition duration-700 text-color custom-font">
                        <a @click="$router.push({ path: '/profile/promocoes', query: { tab: 'mission' } })" :class="['w-full text-center', { active: isActive('') }]"> 
                            <span >Missão</span>
                            </a>
                        </li>
                         <li class="transition duration-700 text-color custom-font">
                        <a @click="$router.push({ path: '/profile/promocoes', query: { tab: 'vip' } })" :class="['w-full text-center', { active: isActive('') }]"> 
                            <span >VIP</span>
                            </a>
                        </li>
                         <li class="transition duration-700 text-color custom-font">
                        <a @click="$router.push({ path: '/profile/promocoes', query: { tab: 'affiliate' } })" :class="['w-full text-center', { active: isActive('') }]"> 
                            <span >Afiliado</span>
                            </a>
                        </li>

                    </ul>
                </div>
                <div class="footer-list"> <!-- Adicionei a classe 'items-center' para centralizar verticalmente -->
                    <h3 class="custom-font-2 title-color">{{ $t('Jogos') }}</h3>
                    <ul class="list-none mt-3">
                       <div v-if="categories" class="category-list">
                          <div class="flex flex-col mb-1 overflow-y-auto">
                             <RouterLink v-for="(category, index) in sortedCategories" 
                             :key="index" 
                             :to="{
                                name: 'casinosAll',
                                params: { provider: 'all', category: category.slug }
                                  }" class="w-full mb-1">

                                <p class="mt-1 custom-font text-color">{{ $t(category.name) }}</p>
                                </RouterLink>
                           </div>
                    </div>
                        
                    </ul>
                </div>
                <div class="footer-list">
                        <h3 class="custom-font-2 title-color">{{ $t('Suporte') }}</h3>
                        <ul class="list-none mt-2">
                         <li class="transition duration-700 text-color custom-font">
                          <a :href="custom.bt_5_link">{{ $t('Suporte online') }}</a>
                        </li>
                        <li class="transition duration-700 text-color custom-font">
                            <a @click="$router.push('/profile/messages')">{{ $t('Central de Ajuda') }}</a>
                        </li>

                        </ul>
                </div>
            </div>
            <hr class="dividers">
        <div class="col-span-1 md:col-span-1 flex flex-col items-center"> <!-- Adicionei a classe 'items-center' para centralizar verticalmente -->
            <div v-if="setting" class="text-center "> <!-- Adicionei a classe 'text-center' para centralizar o texto -->
                <div class="justified-text">
                    {{ setting.software_description }}
                </div>
               <div v-if="custom" class="flex mt-5 justify-center">
    <div v-if="custom.instagram" class="flex justify-center mr-1 ml-1 items-center ">
        <a :href="custom.instagram" target="_blank" class="text-color p-1 instagram-icon">
            <img src="/public/assets/images/instagram.png" alt="Instagram" class=" h-10">
        </a>
    </div>
    <div v-if="custom.telegram" class="flex justify-center  mr-1 ml-1 items-center ">
        <a :href="custom.telegram" target="_blank" class="text-color p-1 telegram-icon">
            <img src="/public/assets/images/telegram.png" alt="Telegram" class="h-10">
        </a>
    </div>
    <div v-if="custom.whastapp" class="flex justify-center  mr-1 ml-1 items-center ">
        <a :href="custom.whastapp" target="_blank" class="text-color p-1 whatsapp-icon">
            <img src="/public/assets/images/whatsapp.png" alt="WhatsApp" class="h-10">
        </a>
    </div>
    <div v-if="custom.facebook" class="flex justify-center mr-1 ml-1 items-center ">
        <a :href="custom.facebook" target="_blank" class="text-color p-1 facebook-icon">
            <img src="/public/assets/images/facebook.png" alt="Facebook" class=" h-10">
        </a>
    </div>
    <div v-if="custom.youtube" class="flex justify-center  mr-1 ml-1 items-center">
        <a :href="custom.youtube" target="_blank" class="text-color p-1 youtube-icon">
            <img src="/public/assets/images/youtube.png" alt="YouTube" class="h-10">
        </a>
    </div>
</div>

            </div>
        </div>
           
    </div>
</div>


        <hr class="dividers">

        <div v-if="setting" class="mt-5 flex flex-col justify-center ">
            <div class="flex w-full justify-center items-center relative">
                <div class="flex justify-start items-center w-1/2">
<p class="custom-font w-full text-color text-center bgh">{{ setting.software_name }}.com</p>
                </div>
            <div class="flex justify-start items-center w-1/2">
<p class="custom-font w-full text-color text-center">©{{ $t('Copyright') }} 2002-{{ year }}</p>
            </div>
            </div>
        </div>
    </div>
</template>

<script>
    import { useToast } from 'vue-toastification';
    import HttpApi from "@/Services/HttpApi.js";
import { useSettingStore } from "@/Stores/SettingStore.js";
    import { useRoute } from "vue-router";
import { computed, ref, watch } from "vue";
import LoadingComponent from "@/Components/UI/LoadingComponent.vue";
import HeaderComponent from "@/Components/UI/HeaderComponent.vue";
import ShowProviders from "@/Pages/Home/Components/ShowProviders.vue";
import CassinoGameCard from "@/Pages/Cassino/Components/CassinoGameCard.vue";
import CustomPagination from "@/Components/UI/CustomPagination.vue";

    export default {
        props: [],
        components: {
            ShowProviders,
        HeaderComponent,
        LoadingComponent,
        CustomPagination,
        CassinoGameCard
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
                referencecode: '',
                referencelink: '',
                isLoading: false,
                year: new Date().getFullYear(),
                setting: null,
                custom: null,
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
    },
        computed: {
 sortedCategories() {
        // Ordena as categorias pelo ID
        return this.categories.sort((a, b) => a.id - b.id);
    },
        },
        mounted() {
 this.initializeMethods();
        this.forcePageSize();
        },
    methods: {
        copyToClipboard(text) {
      const toast = useToast();

      navigator.clipboard.writeText(text).then(
        () => {
              toast.success("Texto copiado para a área de transferência", {
              position: 'top-center', // Posiciona no centro superior
              timeout: 3000, // Tempo de exibição
              className: 'custom-toast' // Classe customizada para estilização
               });
          
        },
        (err) => {
          toast.error("Não foi possível copiar o texto: " + err);
        }
      );
    },

    getCode() {
  if (this.authenticated) {
    HttpApi.get('profile/affiliates/')
      .then(response => {
        if (response.data.code !== '' && response.data.code !== undefined && response.data.code !== null) {
          this.referencecode = response.data.code;
          this.referencelink = response.data.url;
        }
      })
      .catch(error => {
        console.error("Error fetching code: ", error);
      });
  }
},
    getSetting: function() {
        const _this = this;
        const settingStore = useSettingStore();
        const settingData = settingStore.setting;

        if(settingData) {
            _this.setting = settingData;
            this.$emit('hide-footer'); // Emitindo o evento hide-footer
        }
        },
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
        },
                isActive(route) {
      return this.$route.path === route;
    },
},

       async created() {
  this.category = this.route.params.category;
  await this.getGameData(1, false);
  this.getSetting();
  this.custom = custom;

  if (this.authenticated) {
    this.getCode();
  }
    },

        watch: {
        'route.params.category'(newCategory, oldCategory) {
            this.category = newCategory;
            this.getGameData(1, true);
        }
    },
    };
</script>

<style scoped>
  
.dividers {
    border: none; /* Remove o estilo padrão da borda */
    height: 1px; /* Define a altura do divisor */
    background-color: var(--borders-and-dividers-colors); /* Define a cor do divisor */
    margin-top: 5px; /* Mantém a margem superior */
    transform: scaleY(0.5); /* Reduz a altura pela metade */
    transform-origin: center;
}
.bgh{
    border-right: 1px solid var(--borders-and-dividers-colors);
}

.justified-text {
    font-size: 12px;
    color: var(--text-color);
    opacity: var(--text-color-footer);
    margin: 10px;
    text-align: justify;
     font-style: normal;
    line-height: 19px;
    font-weight: 400;
    font-family: 'Helvetica', sans-serif;
}
.instagram-icon i {
    color: #E4405F;
}

.telegram-icon i {
    color: #0088CC;
}

.whatsapp-icon i {
    color: #25D366;
}

.facebook-icon i {
    color: #1877F2;
}

.youtube-icon i {
    color: #FF0000;
}
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

body {
  font-family: 'Helvetica', sans-serif; /* Define a fonte Helvetica para todo o documento */
}
.custom-font {
    font-family: 'Helvetica', sans-serif;
    font-size: 12px;
    font-style: normal;
    line-height: 17px;
    font-weight: 400;
}
.custom-font-2 {
    font-family: 'Helvetica', sans-serif;
    font-size: 14px;
    font: bold;
    opacity: var(--text-color-footer);
    font-style: normal;
    line-height: 19px;
    font-weight: 400;
}

</style>
