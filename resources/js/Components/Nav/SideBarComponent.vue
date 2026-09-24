<template>
    <div class="w-full max-w-[450px]">
  <div id="content-wrapper"  @click="closeSidebar">
  
 <aside v-if="sidebar" :class="['translate-x-0']" class="fixed top-[55px] z-50 bane h-screen transition-transform -translate-x-full sm:translate-x-0 sidebar-color custom-side-shadow" aria-label="Sidebar">
        <div class="h-full pb-4 overflow-auto sidebar-color p-2 scrollbar-hidden">
            <div class="">
                <div class="grid grid-cols-1 gap-2 mb-4" v-if="isLoading">
                  
                </div>

                <div v-else class="sidebar-color grid grid-cols-2 gap-1">
                 <RouterLink 
  v-for="(category, index) in sortedCategories" 
  :key="index" 
  :to="{ name: 'casinosAll', params: { provider: 'all', category: category.slug }}" 
  active-class="category-active" 
  class="w-full text-center rounded-lg site-menu-item"
>
  <div class="flex items-center justify-center mt-1">
    <img 
      :src="index === 0 ? `/storage/` + category.image_select : `/storage/` + category.image" 
      alt="" 
      width="20" 
      class="w-auto h-6"
    >
  </div>
  <p class="mt-1 mb-1 text-[9px] text-color">{{ $t(category.name) }}</p>
</RouterLink>


                </div>
            </div>

           <!-- Sistema De Musica-->
            <PlayerMusic class="mt-2 h-14"/>

            <ul class="w-full h-14 mt-1 flex items-center text-center mb-1 rounded-lg site-menu-item">
    <li class="px-3 w-full flex justify-center items-center">
    <a @click="$router.push('/profile/promocoes')" class="flex w-full justify-center items-center relative">
        <!-- Contêiner para centralizar a imagem à esquerda -->
        <div class="flex justify-start items-center w-1/2">
            <img :src="`/storage/` + setting.image_promotions_sidebar" alt="" width="20" class="w-auto h-6">
        </div>
        <!-- Contêiner para centralizar o texto à direita -->
        <div class="flex justify-start items-center w-1/2">
            <span class="text-[11px] text-color">{{ $t('Promoções') }}</span>
        </div>
    </a>
</li>

</ul>
<ul class="w-full h-14 flex items-center text-center mb-1 rounded-lg site-menu-item">
    <li class="px-3 w-full flex justify-center items-center">
        <a @click="$router.push('/profile/linkconvite')" class="flex w-full justify-center items-center relative">
<div class="flex justify-start items-center w-1/2">
            <img :src="`/storage/` + setting.icon_bt_8" alt="" width="20" class="w-auto h-6">
        </div>
        <div class="flex justify-start items-center w-1/2">
        <span class="text-[11px] text-color">{{ $t('Agente') }}</span>
        </div>
        </a>
    </li>
</ul>


<div class="w-full p-2 items-center mt-2 rounded-lg site-menu-item">
    <div class="flex justify-center text-center">
        <span class="items-center w-full text-[13px] text-color opacity-[80%]">{{ $t('Promoção') }}</span>
    </div>
    
    <div class="grid grid-cols-2 gap-1">
    <div class="flex items-center justify-center relative">
       <a @click="$router.push({ path: '/profile/financas', query: { tab: 'registrodedepositos' } })" :class="['w-full text-center rounded-lg site-menu-item', { active: isActive('') }]">
            <div class="flex items-center justify-center relative">
                <img src="/public/assets/images/icons/historic.png" alt="" width="20" class="w-20 max-w-[18] h-auto">
                <span class="absolute top-1 left-1 text-[9px] text-color">{{ $t('Transações') }}</span>
            </div>
        </a>
    </div>

    <div class="flex items-center justify-center relative">
        <a @click="$router.push({ path: '/profile/promocoes', query: { tab: 'affiliate' } })" :class="['w-full text-center rounded-lg site-menu-item', { active: isActive('') }]">
            <div class="flex items-center justify-center relative">
                <img src="/public/assets/images/icons/presentec.png" alt="" width="20" class="w-20 max-w-[18] h-auto">
                <span class="absolute top-1 left-1 text-[9px] text-color">{{ $t('affiliate') }}</span>
            </div>
        </a>
    </div>

    <div class="flex items-center justify-center relative">
        <a @click="$router.push({ path: '/profile/promocoes', query: { tab: 'mission' } })" :class="['w-full text-center rounded-lg site-menu-item', { active: isActive('') }]">
            <div class="flex items-center justify-center relative">
                <img src="/public/assets/images/icons/agendasc.png" alt="" width="20" class="w-20 max-w-[18] h-auto">
                <span class="absolute top-1 left-1 text-[9px] text-color">{{ $t('Missão') }}</span>
            </div>
        </a>
    </div>

    <div class="flex items-center justify-center relative">
        <a @click="$router.push({ path: '/profile/promocoes', query: { tab: 'vip' } })" :class="['w-full text-center rounded-lg site-menu-item', { active: isActive('') }]">
            <div class="flex items-center justify-center relative">
                <img src="/public/assets/images/icons/reyc.png" alt="" width="20" class="w-20 max-w-[18] h-auto">
                <span class="absolute top-1 left-1 text-[9px] text-color">{{ $t('VIP') }}</span>
            </div>
        </a>
    </div>
    <div class="flex items-center justify-center relative">
        <a @click="$router.push({ path: '/profile/promocoes', query: { tab: 'events' } })" :class="['w-full text-center rounded-lg site-menu-item', { active: isActive('') }]">
            <div class="flex items-center justify-center relative">
                <img src="/public/assets/images/icons/eventos.png" alt="" width="20" class="w-20 max-w-[18] h-auto">
                <span class="absolute top-1 left-1 text-[9px] text-color">{{ $t('Eventos') }}</span>
            </div>
        </a>
    </div>
</div>

</div>

            <ul class="font-medium mt-5 mb-[200px]">
               <li class="px-3">
                    <a @click="$router.push('/profile/messages')" href="" class="l-5 flex items-center w-full p-2 font-normal transition duration-700  group">
                        <div class="bottts site-menu-item">
                        <img :src="`/storage/` + setting.image_suporte_sidebar" alt="Support Icon" class="">
                        </div>
                        <span class="ml-3 text-[10px] text-color">{{ $t('Suporte') }}</span>
                    </a>
                </li>
                <li class="px-3">
                    <a @click="$router.push('/profile/promocoes')" href="/profile/promocoes" class="l-5 flex items-center w-full p-2 font-normal transition duration-700 group ">
                        <div class="bottts site-menu-item">
                        <img :src="`/storage/` + setting.image_promotions_sidebar" alt="Promotions Icon" class="">
                        </div>
                        <span class="ml-3 text-[10px] text-color">{{ $t('Promoções') }}</span>
                    </a>
                </li>
                <li class="px-3">
                    <a @click="$router.push('/profile/linkconvite')" href="/profile/linkconvite" class="l-5 flex items-center w-full p-2 font-normal transition duration-700 group ">
                        <div class="bottts site-menu-item">
                        <img :src="`/storage/` + setting.image_indique_sidebar" alt="Refer a Friend Icon" class="">
                        </div>
                        <span class="ml-3 text-[10px] text-color">{{ $t('Refer a friend') }}</span>
                    </a>
                </li>

            </ul>
        </div>

    </aside>
     </div>
    </div>
</template>

<script>
import { onMounted } from "vue";
import { sidebarStore } from "@/Stores/SideBarStore.js";
import { RouterLink } from "vue-router";
import HttpApi from "@/Services/HttpApi.js";
import {useToast} from "vue-toastification";
import {useAuthStore} from "@/Stores/Auth.js";
import {useSettingStore} from "@/Stores/SettingStore.js";
import { missionStore } from "@/Stores/MissionStore.js";
import NavTopComponent from './NavTopComponent.vue'; // Ajuste o caminho conforme necessário
import PlayerMusic from '../MusicPlayer/PlayerMusic.vue';

export default {
    props: [],
    components: { RouterLink, NavTopComponent, PlayerMusic  },
    data() {
        return {
            sidebar: false,
            isLoading: true,
            categories: [],
            sportsCategories: [],
            modalMission: null,
            setting: null,
    
        }
    },
    setup(props) {
        onMounted(() => {

        });

        return {};
    },
    computed: {
        sortedCategories() {
        // Ordena as categorias pelo ID
        return this.categories.sort((a, b) => a.id - b.id);
    },

        sidebarMenuStore() {
            return sidebarStore();
        },
        sidebarMenu() {
            const sidebar = sidebarStore();
            return sidebar.getSidebarStatus;
        },
        isAuthenticated() {
            const authStore = useAuthStore();
            return authStore.isAuth;
        },
    },
    mounted() {
    },
    methods: {
        toggleMenu() {
            this.sidebarMenuStore.setSidebarToogle();
        },
      
        toggleMissionModal: function() {
            const missionDataStore = missionStore();
            missionDataStore.setMissionToogle();
        },
        getCasinoCategories: function() {
            const _this = this;
            const _toast = useToast();
            _this.isLoading = true;

            HttpApi.get('categories')
                .then(response => {
                    _this.categories = response.data.categories;
                    _this.isLoading = false;
                })
                .catch(error => {
                    Object.entries(JSON.parse(error.request.responseText)).forEach(([key, value]) => {
                        _toast.error(`${value}`);
                    });
                    _this.isLoading = false;
                });
        },
        getSetting: function() {
            const _this = this;
            const settingStore = useSettingStore();
            const settingData = settingStore.setting;

            if(settingData) {
                _this.setting = settingData;
            }
        },
         isActive(route) {
      return this.$route.path === route;
    },
    },
    created() {
        this.getCasinoCategories();
        this.getSetting();
    },
    watch: {
        sidebarMenu(newVal, oldVal) {
            this.sidebar = newVal;
        }
    },
};
</script>

<style scoped>

/* Estilos para telas menores que 451px (mobile) */
@media only screen and (max-width: 450px) {
  .bane {
   width: 40%; /* Largura de 45% de 450px */
  max-width: 450px; /* Largura máxima de 450px */
  }
}
  
.scrollbar-hidden::-webkit-scrollbar {
        width: 0;
    }
    .scrollbar-hidden {
        overflow: -moz-scrollbars-none;
        -ms-overflow-style: none;
        scrollbar-width: none;
    }

.bottts {
    height: 26px;
    width: 26px;
    padding: 3px;
    border-radius: 50%;
}
</style>
