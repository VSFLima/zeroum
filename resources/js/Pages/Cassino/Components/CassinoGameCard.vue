<template>
  <div v-if="shouldDisplayGame" class="item-game text-white w-full h-auto mr-4 rounded-[15px] overflow-hidden relative">
    <!-- Verificação do tipo de jogo para o link correto -->
    <RouterLink v-if="game.distribution === 'kagaming'" :to="{ name: 'casinoPlayPage', params: { id: game.id, slug: game.game_code }}">
      <img :src="game.cover" alt="" class="w-full rounded-lg">
    </RouterLink>
    <RouterLink v-else :to="{ name: 'casinoPlayPage', params: { id: game.id, slug: game.game_code }}">
      <img :src="`/storage/` + game.cover" alt="" class="w-full rounded-lg">
    </RouterLink>

    <!-- Botão de Favoritar com troca de imagem -->
    <button @click="toggleFavorite(game.id)" class="favorite-button absolute top-1 right-2">
      <img :src="isFavorited(game.id) ? '/assets/images/starenable.png' : '/assets/images/stardefault.png'" alt="favorite icon" class="w-6 h-6">
    </button>

    <!-- Nome do Jogo sobre a Imagem -->
    <!-- <div class="item-game-wrapper absolute bottom-0 left-0 w-full px-3 py-2">
      <div class="text-center w-full text-white">
        <span class="truncate">{{ game.game_name }}</span>
      </div>
    </div> -->
  </div>
</template>

<script>
import { RouterLink } from "vue-router";
import { useAuthStore } from "@/Stores/Auth.js";

export default {
  props: {
    index: Number,
    game: Object,
  },
  components: { RouterLink },
  setup() {
    const authStore = useAuthStore();

    // Funções para verificar autenticação e dados do usuário
    const isAuthenticated = () => {
      return authStore.isAuth;
    };

    const userData = () => {
      return authStore.user;
    };

    return {
      isAuthenticated,
      userData,
    };
  },
  computed: {
    // Verifica se o jogo deve ser exibido
    shouldDisplayGame() {
      const user = this.userData();
      
      // Se o usuário não estiver autenticado
      if (!this.isAuthenticated()) {
        return this.game.is_influencer_mode === 0; // Exibe apenas jogos com is_influencer_mode 0
      }

      // Se o usuário estiver autenticado
      if (this.game.is_influencer_mode === 0) {
        return true; // Exibe para todos
      } else if (this.game.is_influencer_mode === 1 && user && user.influencer_mode === 1) {
        return true; // Exibe apenas para usuários com influencer_mode 1
      }
      return false; // Não exibe para outros usuários
    },
  },
  data() {
    return {
      favorites: JSON.parse(localStorage.getItem('favorites')) || [], // Carrega os favoritos do localStorage
    };
  },
  methods: {
    // Verifica se o jogo está favoritado
    isFavorited(gameId) {
      return this.favorites.includes(gameId);
    },

    // Alterna o estado de favorito para o jogo
    toggleFavorite(gameId) {
      let updatedFavorites = [...this.favorites]; // Copia a lista atual de favoritos

      if (this.isFavorited(gameId)) {
        // Se estiver favoritado, remove da lista
        updatedFavorites = updatedFavorites.filter(id => id !== gameId);
      } else {
        // Se não estiver, adiciona à lista
        updatedFavorites.push(gameId);
      }

      // Atualiza o localStorage e o estado local
      localStorage.setItem('favorites', JSON.stringify(updatedFavorites));
      this.favorites = updatedFavorites;
    },
  },
};
</script>

<style scoped>
.item-game-wrapper {
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  padding: 5px;
  text-align: center;
}

.item-game-wrapper span {
  font-family: 'Helvetica', sans-serif;
  font-style: normal;
  line-height: normal;
  font-size: clamp(0.70rem, 1vw, 0.80rem); /* Responsivo */
  font-weight: 400;
}

.favorite-button {
  background: none;
  border: none;
  cursor: pointer;
}

.favorite-button img {
  width: 24px;
  height: 24px;
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
