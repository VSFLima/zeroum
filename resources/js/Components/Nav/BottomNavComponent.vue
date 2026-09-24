<template>
  <div class="flex">
    <div class="fixed btn z-40 w-full max-w-[450px] h-16 -translate-x-1/2 bottom-0 left-1/2 custom-border-top background-bottom-navigation"
         :style="{ 
            backgroundImage: `url(/storage/${setting.icon_bottom_left}), url(/storage/${setting.icon_bottom_right})`,
            backgroundRepeat: 'no-repeat, no-repeat',
            backgroundPosition: 'left, right',
            backgroundSize: 'contain, contain'
         }">
      <div class="grid h-full grid-cols-5 mx-auto flex-grow">
        <button @click="navigateTo('home', '/home/game?gameCategoryId=0')"
                type="button"
                class="flex-1 inline-flex flex-col items-center justify-center group">
          <img :src="getImagePath(selectedButton === 'home' ? setting.image_home_bottom_hover : setting.image_home_bottom)" alt="Home" class="icon" />
          <span class="text text-color opacity-bottom-nav">{{ $t('Home') }}</span>
        </button>

        <button @click="navigateTo('cassino', null); openModal('login')"
                type="button"
                class="flex-1 inline-flex flex-col items-center justify-center group">
          <img :src="getImagePath(selectedButton === 'cassino' ? setting.image_cassino_bottom_hover : setting.image_cassino_bottom)" :alt="authAltText" class="icon" />
          <span class="text text-color opacity-bottom-nav">{{ authButtonText }}</span>
        </button>

        
          <button @click="navigateTo('deposito', '/profile/financas')"
                  type="button"
                  class="flex-1 inline-flex flex-col items-center justify-center group">
            <img :src="getImagePath(selectedButton === 'deposito' ? setting.image_deposito_bottom_hover : setting.image_deposito_bottom)" alt="Deposit" class="icon" />
            <span class="text text-color opacity-bottom-nav">{{ $t('Depósito') }}</span>
          </button>
        

        <button @click="navigateTo('affiliate', '/profile/promocoes')"
                type="button"
                class="flex-1 inline-flex flex-col items-center justify-center group">
          <img :src="getImagePath(selectedButton === 'affiliate' ? setting.image_convidar_bottom_hover : setting.image_convidar_bottom)" alt="Convidar" class="icon" />
          <span class="text text-color opacity-bottom-nav">Promoções</span>
        </button>

        <button @click="navigateTo('wallet', null); openProfileModal()"
                type="button"
                class="flex-1 inline-flex flex-col items-center justify-center group">
          <img :src="getImagePath(selectedButton === 'wallet' ? setting.image_wallet_bottom_hover : setting.image_wallet_bottom)" alt="Wallet" class="icon" />
          <span class="text text-color opacity-bottom-nav">{{ $t('Perfil') }}</span>
        </button>
      </div>
    </div>
  </div>

  <ModalAuth ref="modalAuth" />
</template>



<script>
import { useSettingStore } from "@/Stores/SettingStore.js";
import { useAuthStore } from "@/Stores/Auth.js";
import { useRouter, watch } from 'vue-router';
import { useToast } from "vue-toastification";
import HttpApi from "@/Services/HttpApi.js";
import ModalAuth from "@/Components/ModalAuth/ModalAuth.vue";

export default {
  components: { ModalAuth },
  data() {
    return {
      setting: null,
      selectedButton: '', // Armazena o botão atualmente selecionado
    };
  },
  setup() {
    const router = useRouter();
    return {
      router,
    };
  },
  computed: {
    isAuthenticated() {
      const authStore = useAuthStore();
      return authStore.isAuth;
    },
    authButtonText() {
      return this.isAuthenticated ? this.$t('Sair') : this.$t('Login');
    },
    authAltText() {
      return this.isAuthenticated ? 'Logout' : 'Login';
    },
  },
  mounted() {
    this.getSetting();
    this.updateSelectedButton();
  },
  watch: {
    '$route': 'updateSelectedButton', // Observa a rota atual
  },
  methods: {
    selectButton(button) {
      this.selectedButton = button;
    },
    navigateTo(button, path) {
      this.selectButton(button); // Atualiza o botão selecionado
      if (path) {
        this.$router.push(path); // Navega para a nova rota
      }
    },
    openModal(type) {
      if (this.isAuthenticated) {
        this.logout();
      } else {
        this.$refs.modalAuth.openModal(type);
      }
    },
    openProfileModal() {
      if (this.isAuthenticated) {
        this.$router.push('/profile/profile');
      } else {
        this.$refs.modalAuth.openModal('register');
      }
    },
    getSetting() {
      const settingStore = useSettingStore();
      this.setting = settingStore.setting;
      this.$emit('hide-bottom-nav');
    },
    updateSelectedButton() {
      // Atualiza selectedButton com base na rota atual
      const path = this.$route.path;
      const query = this.$route.query;

      if (path === '/' || (path === '/home/game' && query.gameCategoryId === '0')) {
        this.selectedButton = 'home';
      } else if (path === '/profile/financas') {
        this.selectedButton = 'deposito';
      } else if (path === '/profile/promocoes') {
        this.selectedButton = 'affiliate';
      } else if (path === '/profile/profile') {
        this.selectedButton = 'wallet';
      } else {
        this.selectedButton = ''; // Reseta para padrão
      }
    },
    togglePassword() {
      this.typeInputPassword = this.typeInputPassword === 'password' ? 'text' : 'password';
    },
    logout() {
      const authStore = useAuthStore();
      const toast = useToast();
      
      HttpApi.post('auth/logout', {})
          .then(response => {
              authStore.logout();
              this.$router.push('/');
             // toast.success(this.$t('You have been successfully disconnected'), {
              //    position: 'top-center',
              //    timeout: 3000,
              //    className: 'logout-toast',
             // });
          })
          .catch(error => {
              console.error('Error logging out:', error);
          });
    },
    getImagePath(image) {
      return `/storage/${image}`;
    },
  },
  async created() {
    if (this.isAuthenticated) {
      await this.getSetting();
    }
  },
};
</script>

<style scoped>
.grid {
  display: flex; /* Adiciona flexbox ao contêiner */
}

button {
  flex: 1; /* Faz com que todos os botões cresçam igualmente */
  min-width: 0; /* Impede que o conteúdo ultrapasse o espaço disponível */
}
/* Estilos para telas maiores que 450px */
@media (min-width: 451px) {
  .icon {
    width: 30px; /* Tamanho fixo para a imagem */
    height: 30px; /* Tamanho fixo para a imagem */
  }

  .text {
    font-size: 0.80rem; /* Tamanho fixo do texto */
  }
}

/* Estilos para telas menores ou iguais a 450px */
@media (max-width: 450px) {
  .icon {
    width: 30px; /* Tamanho fixo para a imagem */
    height: 30px; /* Tamanho fixo para a imagem */
  }

  .text {
    font-size: 0.80rem; /* Tamanho fixo do texto */
  }
}
/* Estilos para telas menores ou iguais a 450px */
@media (max-width: 360px) {
  .icon {
    width: 25px; /* Tamanho fixo para a imagem */
    height: 25px; /* Tamanho fixo para a imagem */
  }

  .text {
    font-size: 0.70rem; /* Tamanho fixo do texto */
  }
}

.opacity-bottom-nav {
  opacity: var(--opacity-bottom-nav);
}

.btn {
  transition: background-color 0.3s ease;
  border-top-width: 1px; 
  border-top-width: solid; 
  border-top-color: var(--borders-and-dividers-colors);
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

