<template>
  <div class="card-container">
    <template v-if="sliderTexts.length > 0">
      <div
        class="card"
        v-for="text in sliderTexts"
        :key="text.id"
        @click="toggleExpand(text.id)"
      >
        <div class="card-content">
          <!-- Imagem à esquerda -->
          <div class="image-container">
            <img :src="`/storage/` + setting.image_favoritos_sidebar" class="image" />
          </div>
          <!-- Texto ao lado da imagem -->
          <div class="text-container">
            <p :class="{ 'expanded': expandedTextId === text.id }">
              {{ text.message }}
            </p>
          </div>
        </div>
      </div>
    </template>
    <template v-else>
      <div class="no-data w-full max-w-[450px] flex flex-col items-center justify-center">
        <img :src="`/assets/images/img_none_sj.webp`" alt="Nenhum registro" class="w-auto h-auto max-h-[140px]" />
        <h3 class="text-color">{{ $t('Sem registro') }}</h3>
      </div>
    </template>
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
      sliderTexts: [],
      expandedTextId: null,
    };
  },
  created() {
    this.fetchSliderTexts();
    this.getSetting();
  },
  methods: {
    async getSetting() {
      const settingStore = useSettingStore();
      this.setting = settingStore.setting;
    },
    async fetchSliderTexts() {
      try {
        const response = await HttpApi.get('/slider-text');
        this.sliderTexts = response.data;
      } catch (error) {
        console.error('Error fetching slider texts:', error);
      }
    },
    toggleExpand(textId) {
      // Alterna a expansão do item clicado, garantindo que apenas um item seja expandido por vez.
      this.expandedTextId = this.expandedTextId === textId ? null : textId;
    },
  },
};
</script>

<style scoped>
.card-container {
  display: flex;
  flex-wrap: wrap;
  gap: 16px; /* Espaçamento entre os cartões */
  padding: 0px; /* Padding ao redor dos cartões */
}

.card {
  background: var(--background-bottom-navigation);
  border: 1px solid var(--borders-and-dividers-colors);
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  width: 100%; /* Ocupa a largura completa do contêiner */
  max-width: 450px; /* Largura máxima do cartão */
  overflow: hidden;
  cursor: pointer; /* Adiciona um cursor de ponteiro para indicar que o card é clicável */
  display: flex; /* Alinha imagem e texto lado a lado */
}

.card-content {
  display: flex; /* Alinha imagem e texto lado a lado */
  padding: 16px;
  width: 100%;
}

.image-container {
  flex-shrink: 0;
  width: 2rem; /* Tamanho fixo para a imagem */
  height: 2rem; /* Tamanho fixo para a imagem */
  margin-right: 12px; /* Espaçamento entre a imagem e o texto */
}

.image {
  width: 20px;
  height: 20px;
  object-fit: cover; /* Mantém a proporção da imagem */
  border-radius: 4px; /* Adiciona bordas arredondadas, se desejado */
}

.text-container {
  flex-grow: 1;
}

.card-content p {
  margin: 0;
  font-size: 16px;
  color: var(--text-color);
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  transition: all 0.3s ease;
}

.card-content p.expanded {
  white-space: normal;
  overflow: visible;
  text-overflow: clip;
}

.no-data {
  height: 100vh; /* Ocupar toda a altura da tela */
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  text-align: center;
  color: var(--text-color);
  margin-top: 0; /* Remover margem superior para centralização perfeita */
}

.no-data img {
  height: auto;
  width: auto;
}
</style>
