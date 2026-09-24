<template>
  <div>
    <GameLayout>
      <!-- Tela de carregamento -->
      <div class="w-full h-full flex justify-center items-center bg-black max-w-[450px]" :isLoading="isLoading">
        <div class="text-center">
          <img src="/public/assets/images/loading.png" class="w-[50px] h-auto" alt="Carregando informações dos jogos" />
        </div>
      </div>

      <!-- Tela do jogo -->
      <div v-if="!isLoading && game" :class="{ 'w-full': modeMovie, 'lg:w-3/3': !modeMovie }" class="mx-auto relative">
        <div class="game-screen" id="game-screen">
          <fullscreen v-model="fullscreen" :page-only="pageOnly">
            <!-- Botão "Quitar" -->
            <div class="absolute top-4 left-4 z-10 flex flex-col items-center">
              <router-link to="/" class="mr-2">
                <img src="/public/storage/quitar.png" alt="Voltar para Home" class="w-12 h-12 cursor-pointer" />
              </router-link>

             <!-- Botão de ativar/desativar tela cheia -->
<button @click="toggleFullscreen" class="w-auto h-auto mr-2 mt-1">
  <i v-if="fullscreen" class="fa-light fa-arrows-minimize fa-xl" style="color: #ffffff;"></i>
  <i v-else class="fa-light fa-arrows-maximize fa-xl" style="color: #ffffff;"></i>
</button>

            </div>

            <!-- Exibir o conteúdo do iframe ou botão iniciar -->
            <div v-if="showButton && game.game_type === 'live' && game.distribution === 'evergame'"
              class="game-full fullscreen-wrapper flex items-center justify-center">
              <button @click.prevent="openModal(gameUrl)" type="button" class="text-sm font-medium text-color focus:outline-none bg-white">
                Clique para começar
              </button>
            </div>
            <iframe v-else :src="gameUrl" class="game-full fullscreen-wrapper"></iframe>
          </fullscreen>
        </div>
      </div>

      <!-- Mensagem de manutenção -->
      <div v-if="undermaintenance" class="flex flex-col max-h-[100vh] items-center justify-center text-center py-24">
        <h1 class="text-2xl text-color mb-4">Jogo Em Manutenção, volte mais tarde!</h1>
        <img :src="`/assets/images/manutencao.png`" alt="" width="400">
        <div class="fixed bottom-16 flex items-center justify-center w-full p-4 h-20 max-w-[400px]">
          <router-link to="/" class="absolute rounded-lg w-auto py-4 pr-4 pl-4 items-center background-bottom-navigation">
            Voltar para Tela inicial
          </router-link>
        </div>
      </div>
    </GameLayout>
  </div>
</template>

<script>
import { RouterLink, useRoute, useRouter } from "vue-router";
import { useAuthStore } from "@/Stores/Auth.js";
import { component } from 'vue-fullscreen';
import LoadingComponent from "@/Components/UI/LoadingComponent.vue";
import GameLayout from "@/Layouts/GameLayout.vue";
import HttpApi from "@/Services/HttpApi.js";
import {
  defineComponent,
  toRefs,
  reactive,
} from 'vue';

export default {
  components: {
    GameLayout,
    LoadingComponent,
    RouterLink,
    component
  },
  data() {
    return {
      isLoading: true,
      game: null,
      modeMovie: false,
      gameUrl: null,
      token: null,
      gameId: null,
      tabs: null,
      undermaintenance: false,
      showButton: false,
      showFullscreenButton: false, // Mostrar botão de fullscreen se for bloqueado
    };
  },
  setup() {
    const router = useRouter();
    const state = reactive({
      fullscreen: false,
      pageOnly: false,
    });

  // Função para ativar ou desativar a tela cheia
function toggleFullscreen() {
  const elem = document.getElementById("game-screen");

  if (!state.fullscreen) {
    if (elem.requestFullscreen) {
      elem.requestFullscreen().then(() => {
        state.fullscreen = true;
      }).catch(err => {
        console.log(`Erro ao tentar ativar o modo de tela cheia: ${err.message}`);
      });
    } else if (elem.mozRequestFullScreen) {
      elem.mozRequestFullScreen();
    } else if (elem.webkitRequestFullscreen) {
      elem.webkitRequestFullscreen();
    } else if (elem.msRequestFullscreen) {
      elem.msRequestFullscreen();
    } else {
      console.log("Fullscreen não suportado pelo navegador.");
    }
  } else {
    if (document.exitFullscreen) {
      document.exitFullscreen().then(() => {
        state.fullscreen = false;
      }).catch(err => {
        console.log(`Erro ao sair do modo de tela cheia: ${err.message}`);
      });
    } else if (document.mozCancelFullScreen) {
      document.mozCancelFullScreen();
    } else if (document.webkitExitFullscreen) {
      document.webkitExitFullscreen();
    } else if (document.msExitFullscreen) {
      document.msExitFullscreen();
    }
  }
}

   return {
  ...toRefs(state),
  toggleFullscreen, // Substitua pelo método atualizado
  router
};

  },
  mounted() {
    // Tentar ativar a tela cheia automaticamente
    setTimeout(() => {
      this.activateFullscreen();
    }, 500); // Espera 0,5 segundos após o carregamento

    const userAgent = navigator.userAgent.toLowerCase();
    const isSafari = userAgent.includes('safari') && !userAgent.includes('chrome');
    const isSamsungInternet = userAgent.includes('samsung') && userAgent.includes('safari') && !userAgent.includes('chrome');
    const isIOS = userAgent.includes('iphone') || userAgent.includes('ipad');

    if (isSafari || isSamsungInternet || isIOS) {
      this.showButton = true;
    }
  },
  computed: {
    userData() {
      const authStore = useAuthStore();
      return authStore.user;
    },
    isAuthenticated() {
      const authStore = useAuthStore();
      return authStore.isAuth;
    },
  },
  methods: {
    openModal(gameUrl) {
      window.open(gameUrl);
    },
    getGame: async function () {
      const _this = this;

      return await HttpApi.get('games/single/' + _this.gameId)
        .then(async response => {
          if (response.data?.action === 'deposit') {
            _this.$nextTick(() => {
              _this.router.push({ name: 'profileDeposit' });
            });
          }

          const game = response.data.game;
          _this.game = game;

          _this.gameUrl = response.data.gameUrl;
          _this.token = response.data.token;
          _this.isLoading = false;

          _this.$nextTick(() => {
            _this.loadingTab();
          });
        })
        .catch(error => {
          _this.isLoading = false;
          _this.undermaintenance = true;
        });
    },
    toggleFavorite: function () {
      const _this = this;
      return HttpApi.post('games/favorite/' + _this.game.id, {})
        .then(response => {
          _this.getGame();
          _this.isLoading = false;
        })
        .catch(error => {
          _this.isLoading = false;
        });
    },
    toggleLike: async function () {
      const _this = this;
      return await HttpApi.post('games/like/' + _this.game.id, {})
        .then(async response => {
          await _this.getGame();
          _this.isLoading = false;
        })
        .catch(error => {
          _this.isLoading = false;
        });
    }
  },
  async created() {
    if (this.isAuthenticated) {
      const route = useRoute();
      this.gameId = route.params.id;

      await this.getGame();
    } else {
      this.router.push({ name: 'login', params: { action: 'openlogin' } });
    }
  },
};
</script>

<style>
.game-screen {
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  position: fixed;
  width: 100%;
  min-height: 100vh;
}

.fullscreen-overlay {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: rgba(0, 0, 0, 0.8);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 1000;
}

.game-full {
  width: 100%;
  min-height: 100vh;
}
</style>
