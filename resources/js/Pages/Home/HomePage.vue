<template>
    <BaseLayout>
        <LoadingComponent :isLoading="isLoading">
            <div class="text-center">
                
            </div>
        </LoadingComponent>
         <div v-if="!isLoading" :style="{ backgroundImage: `url(/storage/${setting.img_bg_1})`, backgroundRepeat: 'repeat' }">
            <!-- Primeiro componente -->
            <div class="md:w-6/6 2xl:w-6/6 mx-auto px-4 pt-2 background-color-cassino">
              <!-- Banners carousel -->
                <div class="carousel-banners">
                    <div class="md:w-6/6 2xl:w-6/6">
                        <div class="mb-1">
                            <!-- Mobile version -->
                            <div class="">
                                <Carousel v-bind="settings" :breakpoints="breakpoints" ref="carouselBanner">
                                    <Slide v-for="(banner, index) in banners" :key="index">
                                        <div class="carousel__item rounded w-full">
                                            <a :href="banner.link" class="w-full h-70 rounded-lg">
                                                <img :src="`/storage/`+banner.image" alt="" class="h-full w-full object-cover rounded-lg">
                                            </a>
                                        </div>
                                    </Slide>
                                </Carousel>
                            </div>
                     </div>
                    <div class="">
                        <Carousel v-bind="settingsRecommended" :breakpoints="breakpointsRecommended" ref="carouselSubBanner">
                            <Slide v-for="(banner, index) in bannersHome" :key="index">
                                <div class="carousel__item  min-h-[60px] md:min-h-[150px] rounded w-full mr-4">
                                    <a :href="banner.link" class="w-full h-full rounded">
                                        <img :src="`/storage/`+banner.image" alt="" class="h-full w-full rounded">
                                    </a>
                                </div>
                            </Slide>
                        </Carousel>
                    </div>

            <!-- últimos ganhos -Caso eu for usar só descomentar -->

            <!--  <LastWinnersComponent /> -->
                </div>
            </div>
        </div> 
        <SliderTextComponent />

            <!-- Componente de categorias -->


            <CategoriesComponent class="fixed-top" />  

            <AllCategories />

           

             <!-- Componente de jackpot e mais -->

             <!--<JackpotComponent /> -->

            <!-- Paginas de favoritos pescaria e etc -->

            
             
             
                <!-- <div class="mt-0"> -->
                    <!-- <ShowProviders v-for="(provider, index) in sortedProviders" :provider="provider" :index="index" /> -->
                <!-- </div> -->

                <!-- Componentes flutuantes começa aqui -->
            <div v-if="isAuthenticated" class="floating-components">
                <div class="promotions-button mr-3">
                    <button @click="$router.push('/profile/promocoes')">
                        <img src="/public/assets/images/baus.gif" alt="Promotions Icon" class="w-16 h-16">
                    </button>
                    <button @click="closeButton" class="bordase">
                        <i class="fas fa-times text-color"></i>
                    </button>
                </div>
                <div class="support-button">
                    <a v-if="custom.bt_5_link" :href="custom.bt_5_link" target="_blank" rel="noopener noreferrer">
                        <button class="py-2 px-2 flex flex-col items-center space-y-1">
                            <img :src="`/storage/`+setting.icon_bt_5" alt="Ícone de suporte" class="w-[75px] h-auto">
                        </button>
                    </a>
                </div>
            </div>
            <!-- Componentes flutuantes termina aqui -->
         </div>
    </BaseLayout>
    <ModalPopUp v-if="setting.modal_active" ref="ModalPopUp"></ModalPopUp>

    <ResetPasswordModal v-if="isResetPasswordRoute" :token="token" />
</template>


<script>
import {Carousel, Navigation, Pagination, Slide} from 'vue3-carousel';
import {onMounted, ref} from "vue";

import BaseLayout from "@/Layouts/BaseLayout.vue";
import MakeDeposit from "@/Components/UI/MakeDeposit.vue";
import {RouterLink, useRoute} from "vue-router";
import {useAuthStore} from "@/Stores/Auth.js";
import HttpApi from "@/Services/HttpApi.js";
import ShowCarousel from "@/Pages/Home/Components/ShowCarousel.vue";
import {useSettingStore} from "@/Stores/SettingStore.js";
import LoadingComponent from "@/Components/UI/LoadingComponent.vue";
import ShowProviders from "@/Pages/Home/Components/ShowProviders.vue";
import LastWinnersComponent from "@/Pages/Home/Components/LastWinnersComponent.vue";

import CustomPagination from "@/Components/UI/CustomPagination.vue";
import CategoriesComponent from "@/Pages/Home/Components/CategoriesComponent.vue";
import SliderTextComponent from "@/Pages/Home/Components/SliderTextComponent.vue";
import JackpotComponent from "@/Pages/Home/Components/JackpotComponent.vue";
import ModalPopUp from "@/Components/UI/ModalPopUp.vue"; 
import ResetPasswordModal from '@/Pages/Auth/ResetPassword.vue';
import AllCategories from '../Cassino/AllCategories.vue';




export default {
  props: [],
    components: {
      ResetPasswordModal,
      ModalPopUp,
      JackpotComponent,
      SliderTextComponent,
      CategoriesComponent,
      LastWinnersComponent,
      CustomPagination,
      Pagination,
      ShowProviders,
      LoadingComponent,
      ShowCarousel,
      Carousel,
      Navigation,
      Slide,
      MakeDeposit,
      BaseLayout,
      RouterLink,
      AllCategories
      
  },
  data() {
      return { 
         isResetPasswordRoute: false,
            token: null,
          isLoading: true,
          setting: null,
          custom: null,

          /// banners settings
          settings: {
              itemsToShow: 1,
              snapAlign: 'center',
              autoplay: 6000,
              wrapAround: true
          },
          breakpoints: {
              700: {
                  itemsToShow: 1,
                  snapAlign: 'center',
              },
              1024: {
                  itemsToShow: 1,
                  snapAlign: 'center',
              },
          },

          settingsRecommended: {
              itemsToShow: 2,
              snapAlign: 'start',
          },
          breakpointsRecommended: {
              700: {
                  itemsToShow: 3,
                  snapAlign: 'center',
              },
              1024: {
                  itemsToShow: 3,
                  snapAlign: 'start',
              },
          },

          /// banners
          banners: null,
          bannersHome: null,

          settingsGames: {
              itemsToShow: 2.5,
              snapAlign: 'start',
          },
          breakpointsGames: {
              700: {
                  itemsToShow: 3.5,
                  snapAlign: 'center',
              },
              1024: {
                  itemsToShow: 6,
                  snapAlign: 'start',
              },
          },
           providers: [],
      gameCategoryId: 0 // Valor padrão para gameCategoryId
      };
  },

  setup(props) {
      const ckCarouselOriginals = ref(null)

      onMounted(() => {

      });

      return {
          ckCarouselOriginals
      };
  },
    computed: {
     sortedProviders() {
      return this.providers.sort((a, b) => a.name.localeCompare(b.name));
    },
      userData() {
          const authStore = useAuthStore();
          return authStore.user;
      },
      isAuthenticated() {
          const authStore = useAuthStore();
          return authStore.isAuth;
      },
      setting() {
          const settingStore = useSettingStore();
          return settingStore.setting;
      },
  },
    mounted() {
        const route = useRoute();
        // Verifica se a rota atual é a de reset de senha
        if (route.name === 'resetPassword') {
            this.isResetPasswordRoute = true;
            this.token = route.params.token;
        }
     // Acessa o gameCategoryId do query parameter
    const gameCategoryId = this.$route.query.gameCategoryId || 0;
    this.gameCategoryId = gameCategoryId;

    console.log(`Categoria do jogo: ${gameCategoryId}`);
  
 const scrollContainer = document.getElementById('scrollContainer');

    // Função para ajustar o scroll em incrementos de 20% da tela
    const adjustScroll = (direction) => {
        const screenHeight = window.innerHeight;
        const scrollIncrement = 0.2 * screenHeight; // 20% da tela
        scrollContainer.scrollBy({
            top: direction * scrollIncrement,
            behavior: 'smooth', // Adiciona um comportamento suave de scroll
        });
    };

    // Adiciona um evento de scroll ao contêiner
    scrollContainer.addEventListener('wheel', (event) => {
        if (event.deltaY > 0) {
            adjustScroll(1); // Scroll para baixo
        } else {
            adjustScroll(-1); // Scroll para cima
        }

        // Verifica se o scroll atingiu um determinado ponto e trava o scroll
        if (scrollContainer.scrollTop >= (0.2 * window.innerHeight)) {
            scrollContainer.style.overflowY = 'hidden';
        }
    });
  },
  methods: {
     closeButton() {
            const button = document.querySelector('.promotions-button');
            if (button) {
                button.style.display = 'none';
            }
        },
      getSetting: function() {
                const _this = this;
                const settingStore = useSettingStore();
                const settingData = settingStore.setting;

                if(settingData) {
                    _this.setting = settingData;
                }
            },
    
      getBanners: async function() {
          const _this = this;

          try {
              const response = await HttpApi.get('settings/banners');
              const allBanners = response.data.banners;

              _this.banners = allBanners.filter(banner => banner.type === 'carousel');
              _this.bannersHome = allBanners.filter(banner => banner.type === 'home');
          } catch (error) {
              console.error(error);
          } finally {

          }
      },
      getAllGames: async function() {
          const _this = this;
          return await HttpApi.get('games/all')
              .then(async response =>  {
                  if(response.data !== undefined) {
                      _this.providers = response.data.providers;
                      _this.isLoading = false;
                  }
              })
              .catch(error => {
                  Object.entries(JSON.parse(error.request.responseText)).forEach(([key, value]) => {
                      console.log(`${value}`);
                  });
                  _this.isLoading = false;
              });
      },
      initializeMethods: async function() {
          await this.getBanners();
          await this.getAllGames();
          this.isLoading = false;
      },
  },
  async created() {
      await this.initializeMethods();
      this.getSetting();
      this.custom = custom;
  },
  watch: {


  },
};
</script>


<style scoped>
.fixed-top {
    position: -webkit-sticky; /* Para navegadores WebKit */
    position: sticky;
    top: 55px; /* Define o deslocamento a partir do topo */
    z-index: 20;
}

.container {
  display: flex;
  justify-content: center;
}  

.close-button {
  position: absolute;
  top: 5px;
  right: 5px;
  background-color: transparent;
  color: #fff;
  border: none;
  cursor: pointer;
  font-size: 16px;
}
.transparent-bg {
    /* Adicione o seguinte código CSS para tornar o fundo da imagem transparente */
    background-color: transparent;
}

 /* Estilo para a classe scare */
.carousel-banners {
    border-radius: 10px; /* Define o raio da borda para 4 pixels */
    overflow: hidden; /* Garante que o conteúdo não ultrapasse as bordas arredondadas */
}

.bordinhas {
  border-width: 1px; 
  border-width: solid; 
  border-color: var(--borders-and-dividers-colors);
  transition: background-color 0.3s ease;
  background-color: var(--search-back);
}
.bordase {
    position: absolute;
    top: 0;
    right: 2;
}
@media (max-width: 450px) {
    .floating-components {
        width: auto; /* Permita que a largura seja ajustável */
        right: 15px; /* Ajuste conforme necessário */
        position: fixed;
        bottom: 10px; /* Ajuste conforme necessário para telas menores */
        z-index: 50;
    }

    .promotions-button {
        position: fixed;
        bottom: 180px; /* Ajuste conforme necessário para telas menores */
        right: 15px; /* Ajuste conforme necessário */
    }

    .support-button {
        position: fixed;
        bottom: 65px; /* Ajuste conforme necessário para telas menores */
        right: 15px; /* Ajuste conforme necessário */
    }
}

@media (min-width: 451px) {
    .floating-components {
        position: fixed;
        right: calc(50% - 225px + 5px); /* Ajuste a posição em relação ao contêiner principal */
        width: 100%; /* Largura fixa para telas maiores que 450px */
        bottom: 10px; /* Ajuste conforme necessário para manter a distância do rodapé */
        z-index: 50;
    }

    .promotions-button {
        position: absolute;
        bottom: 160px; /* Ajuste conforme necessário para telas maiores */
        right: 10px; /* Ajuste conforme necessário */
    }

    .support-button {
        position: absolute;
        bottom: 70px; /* Ajuste conforme necessário para telas maiores */
        right: 10px; /* Ajuste conforme necessário */
    }
}

</style>