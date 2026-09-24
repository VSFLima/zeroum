<template>
    <!-- Fundo escuro transparente quando a sidebar estiver aberta -->
    <div v-if="isSidebarOpen" class="sidebar-overlay" @click="toggleSidebar"></div>

    <!-- Nav com background-imagens aplicadas à esquerda e à direita -->
    <nav class="fixed navbar top-0 z-50 w-full max-w-[450px] navtop-color"
         :style="{ 
            backgroundImage: `url(/storage/${setting.icon_nav_bottom_left}), url(/storage/${setting.icon_nav_bottom_right})`,
            backgroundRepeat: 'no-repeat, no-repeat',
            backgroundPosition: 'left, right',
            backgroundSize: 'contain, contain'
         }">

        <div class="px-2 pl-2 nav-menu">
            <div class="relative flex items-center justify-between w-full">
                
                <!-- div 1 (Esquerda) -->
                <div class="flex items-center justify-start py-3">
                    <button @click.prevent="toggleSidebar" :class="[rotateClass, { 'rotate-180': isSidebarOpen }]" type="button" class="inline-flex items-center p-0 text-sm text-gray-500 rounded-lg">
                        <span class="sr-only">Toggle sidebar</span>
                        <img class="w-8 h-8" :src="`/storage/` + setting.image_menu_nav" alt="Toggle sidebar">
                    </button>
                   <a v-if="setting" href="/" class="pointer-events-auto">
                        <div class="flex">
                            <img :src="`/storage/`+setting.software_logo_black" alt="" class="responsive-image" />
                        </div>
                    </a>
                </div>

                <!-- div 3 (Direita) -->
                <div v-if="!simple" class="flex items-center justify-end relative">
                      <div v-if="isAuthenticated" class="flex items-center">
                        <WalletBalance />
                    </div>
                    <div v-if="!isAuthenticated" class="flex items-center right-0">
                        <button @click="openModal('login')" class="btn-login mr-1">{{ $t('Log in') }}</button>
                        <button @click="openModal('register')" class="btn-register mr-1">{{ $t('Register') }}</button>
                    </div>
                    <div v-if="isAuthenticated" class="flex items-center right-0">
                        <MakeDeposit :showMobile="false" :title="$t('Deposit')" class="btn-deposit ml-1" />
                    </div>
                    <div class="flex items-center right-0">
                         <button @click="searchButtonClick" class="rounded ml-1">
                            <i class="fa-regular fa-magnifying-glass text-color w-4 h-auto"></i> 
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <transition name="fade"></transition>
    </nav>

    <ModalAuth ref="modalAuth" />
</template>

<script>
import { RouterLink, useRoute } from "vue-router";
import { sidebarStore } from "@/Stores/SideBarStore.js";
import { useAuthStore } from "@/Stores/Auth.js";
import { useRouter } from 'vue-router';
import WalletBalance from "@/Components/UI/WalletBalance.vue";
import HttpApi from "@/Services/HttpApi.js";
import MakeDeposit from "@/Components/UI/MakeDeposit.vue";
import { useSettingStore } from "@/Stores/SettingStore.js";
import CassinoGameCard from "@/Pages/Cassino/Components/CassinoGameCard.vue";
import ModalAuth from "@/Components/ModalAuth/ModalAuth.vue";

export default {
    props: ['simple'],
    components: {
        CassinoGameCard, MakeDeposit, ModalAuth, WalletBalance, RouterLink 
    },
    data() {
        return {
            isModalOpen: false,
            isLoading: false,
            games: null,
            searchTerm: '',
            isLoadingSearch: true,
            isLoadingSearch: true,
            isMenuOpen: false,
            rotateClass: '', // Adicione esta linha
            isSidebarOpen: false
        }
    },
    setup() {
       const router = useRouter();
        const sidebarMenuStore = sidebarStore();
        const { isAuthenticated } = useAuthStore();
        const { setting } = useSettingStore();

        const toggleSidebar = () => {
            this.isSidebarOpen = !this.isSidebarOpen;
            sidebarMenuStore.setSidebarToogle();

            if (this.isSidebarOpen) {
                this.rotateClass = 'rotate-left';
            } else {
                this.rotateClass = 'rotate-right';
            }
        };

        const closeSidebarOnClickOutside = (event) => {
            if (this.isSidebarOpen && !event.target.closest('.nav-menu')) {
                this.isSidebarOpen = false;
                sidebarMenuStore.setSidebarToogle();
                this.rotateClass = 'rotate-right';
            }
        };

        onMounted(() => {
            document.addEventListener('click', closeSidebarOnClickOutside);
        });

        onBeforeUnmount(() => {
            document.removeEventListener('click', closeSidebarOnClickOutside);
        });

        return {
            router,
            toggleSidebar,
            isAuthenticated,
            setting,
        };
    },
    computed: {
        sidebarMenuStore() {
            return sidebarStore();
        },
        isAuthenticated() {
            const authStore = useAuthStore();
            return authStore.isAuth;
        },
        userData() {
            const authStore = useAuthStore();
            return authStore.user;
        },
        setting() {
            const authStore = useSettingStore();
            return authStore.setting;
        }
    },
  mounted() {
   const routePath = this.$route.path;
    if (!this.isAuthenticated && (routePath === '/register/:code?' || routePath.startsWith('/home/game'))) {
        this.$refs.modalAuth.openModal('register');
    }
},

  methods: {
       openModal(type) {
        this.$refs.modalAuth.openModal(type);
    },
        getSetting() {
            const settingStore = useSettingStore();
            this.setting = settingStore.setting;
        },
         searchButtonClick() {
      // Implemente a lógica de redirecionamento aqui
      this.$router.push('/casino/provider/all/category/all');
    },
           // Método para abrir ou fechar a sidebar
        toggleSidebar() {
            this.isSidebarOpen = !this.isSidebarOpen;
            this.sidebarMenuStore.setSidebarToogle();

            if (this.isSidebarOpen) {
                this.rotateClass = 'rotate-left';
            } else {
                this.rotateClass = 'rotate-right';
            }

            setTimeout(() => {
                this.rotateClass = '';
            }, 300); // Ajuste conforme a duração da animação CSS
        },
    },
     async created() {
        // Verificar se o usuário está autenticado para carregar configurações
        if (this.isAuthenticated) {
            this.getSetting();
        }
    },
    destroyed() {
        // Remover o ouvinte de evento ao destruir o componente
        this.unregisterEventListeners();
    },
    watch: {
    },
};
</script>


<style scoped>
.bordas {
  border-bottom-width: 1px; 
  border-bottom-width: solid; 
  border-color: var(--borders-and-dividers-colors);}

.rounded {
  border-radius: 999px; /* Use um valor alto para garantir que a borda seja redonda */
}
.responsive-image {
    max-width: auto; /* Garante que a imagem nunca ultrapasse a largura do contêiner */
    height: 30px;    /* Mantém a proporção da imagem */
}

.navbar {
        width: 100%;
    }
.navbar::after {
        content: '';
        display: block;
        width: 100%;
        margin: 0 auto;
        border-bottom-width: solid;
        border-bottom-width: 1px;
        border-color: var(--borders-and-dividers-colors);
        transition: background-color 0.3s ease;
        transform: skewX(-30deg);
    }
  
/* Estilos CSS específicos para a página podem ser adicionados aqui */
.btn-login {
  padding-top: 3px;
  padding-bottom: 3px;
  padding-left: 8px;
  padding-right: 8px;
  color: var(--botao-login-text-nav);
  border-radius: 7px;
  cursor: pointer;
  transition: background-color 0.3s ease;
  font-size: 12px; /* Adicionando tamanho de texto */
  background: var(--botao-login-background-nav);
  border: 1px solid var(--border-login-nav);
}
.btn-register {
  border: 1px solid var(--border-registro-nav);
  padding-top: 3px;
  padding-bottom: 3px;
  padding-left: 8px;
  padding-right: 8px;
  color: var(--botao-registro-text-nav);
  border-radius: 7px;
  cursor: pointer;
  transition: background-color 0.3s ease;
  font-size: 12px; /* Adicionando tamanho de texto */
  background: var(--botao-registro-background-nav);
 
}

.btn-deposit {
  padding-top: 3px;
  padding-bottom: 3px;
  padding-left: 6px;
  padding-right: 6px;
  color: var(--botao-deposito-text-nav);
  border-radius: 7px;
  cursor: pointer;
  transition: background-color 0.3s ease;
  font-size: 12px; /* Adicionando tamanho de texto */
  background: var(--botao-deposito-background-nav);
}



.rotate-left {
    transform: rotate(-180deg);
    transition: transform 0.3s ease; /* Transição suave */
}

.rotate-right {
    transform: rotate(0deg);
    transition: transform 0.3s ease; /* Transição suave */
}


.sidebar-overlay {
    position: fixed;
  top: 0;
  width: 100%;
  height: 100%;
  max-width: 450px; /* Largura máxima de 450px */
  background-color: rgba(0, 0, 0, 0.5); /* Cor do overlay (preto com 50% de opacidade) */
  z-index: 49; /* Z-index menor que a sidebar (50), mas maior que o conteúdo normal */
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