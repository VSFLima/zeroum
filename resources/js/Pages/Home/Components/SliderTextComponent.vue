<template>
  <div v-if="messages.length" class="w-full p-2 h-12 flex items-center max-w-[450px] mx-auto">
    <div class="w-8 h-8 left-5 ml-3">
      <img :src="`/storage/` + setting.image_favoritos_sidebar" class="h-auto w-auto">
    </div>
    <div class="slider-container w-full ml-2">
      <div class="slider-item text-color">
        {{ combinedMessages }}
      </div>
    </div>
    <div class="w-10 h-10 right-5 ml-3">
      <button @click="$router.push('/profile/messages')" class="flex">
        <img :src="`/storage/` + setting.image_wallet_sidebar" class="h-auto w-auto">
      </button>
    </div>
  </div>
</template>

<script>
import { useSettingStore } from "@/Stores/SettingStore.js";
import HttpApi from "@/Services/HttpApi.js";

export default {
  data() {
    return {
      isLoading: false,
      setting: null,
      messages: [],
      animationDuration: 10, // Ajuste inicial para a duração da animação
    };
  },
  created() {
    this.getSetting();
    this.getMessages();
  },
  computed: {
    combinedMessages() {
      return this.messages.join(' | '); // Concatena as mensagens com um separador
    }
  },
  methods: {
    async getSetting() {
      const settingStore = useSettingStore();
      this.setting = settingStore.setting;
    },
    async getMessages() {
      this.isLoading = true;
      try {
        const response = await HttpApi.get('/slider-text');
        if (Array.isArray(response.data)) {
          this.messages = response.data.map(item => item.message);
          this.$nextTick(() => {
            this.updateAnimationDuration();
          });
        } else {
          this.messages = [];
        }
      } catch (error) {
        this.messages = [];
      } finally {
        this.isLoading = false;
      }
    },
    updateAnimationDuration() {
      this.$nextTick(() => {
        const sliderContainer = this.$el.querySelector('.slider-container');
        const sliderItem = this.$el.querySelector('.slider-item');
        const containerWidth = sliderContainer.offsetWidth;
        const totalWidth = sliderItem.scrollWidth;

        // Duração da animação calculada com base na largura total dos itens e no contêiner
        const animationDuration = (totalWidth / containerWidth) * this.animationDuration;
        
        sliderItem.style.animationDuration = `${animationDuration}s`;
        sliderItem.style.animationPlayState = 'running'; // Garante que a animação comece imediatamente
      });
    }
  }
};
</script>

<style scoped>
.slider-container {
  display: flex; /* Alinha os itens horizontalmente */
  overflow: hidden; /* Esconde o excesso de conteúdo que sai do contêiner */
  white-space: nowrap; /* Impede a quebra de linha */
  position: relative;
  width: 100%; /* Garante que o contêiner ocupe toda a largura disponível */
}

.slider-item {
  display: inline-block;
  padding: 0 20px; /* Espaçamento entre itens */
  font-family: 'Helvetica', sans-serif;
  position: relative; /* Para garantir que o texto não saia do contêiner */
  white-space: nowrap; /* Impede a quebra de linha */
  margin-right: 5px; /* Margem de 5px entre itens */
  animation: slideRightToLeft linear infinite; /* Adiciona animação infinita */
  animation-play-state: paused; /* Pausa a animação até que a duração seja calculada */
}

/* Ajuste a animação para garantir uma rolagem contínua */
@keyframes slideRightToLeft {
  0% {
    transform: translateX(100%); /* Começa fora do contêiner */
  }
  100% {
    transform: translateX(-100%); /* Move-se completamente para fora do contêiner */
  }
}
</style>
