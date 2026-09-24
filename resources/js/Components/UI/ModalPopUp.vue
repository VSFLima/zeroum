<template>
  <div v-if="isVisible" class="over-modals"></div>
  <div v-if="isVisible" tabindex="-1" aria-hidden="true" class="fixed inset-0 mongos flex flex-col items-center justify-center overflow-y-auto">
    <div class="relative w-[calc(100%-30px)] max-w-[420px] justify-center items-center custom-font ">
      <div class="w-full h-auto background-bottom-navigation bunese">
        <!-- TAB DOS ITENS-->
        <div class="w-full h-auto p-2 nodes">
          <button v-if="hasPaigData" @click="showContent('paig')" :class="{ 'selected-tab': currentContent === 'paig' }"> <i class="fa-solid fa-envelope-dot"></i> PRIVILÉGIOS </button>
          <button v-if="hasPaihData" class="ml-5" @click="showContent('paih')" :class="{ 'selected-tab': currentContent === 'paih' }"><i class="fa-solid fa-volume"></i> CONVIDE 1 PESSOA</button>
        </div>
        <!-- FIM DO TAB DOS ITENS-->
        <div v-if="currentContent === 'paig'" class="paig p-2 w-full h-auto overflow-y-auto content-container">
          <!-- Use v-html para renderizar o conteúdo HTML -->
          <div v-html="formattedContent"></div>
        </div>
        <div v-if="currentContent === 'paih'" class="paih w-full">
          <img :src="`/storage/${setting.img_modal_pop}`" class="paih" />
        </div>
      </div>
      <div class="w-full flex justify-center mt-3 items-center">
        <button @click="closeModal" class="w-8 h-8 flex justify-center items-center binous">
          <i class="fa-solid fa-xmark text-color"></i>
        </button>
      </div>
    </div>
  </div>
</template>

<script>
import { useSettingStore } from "@/Stores/SettingStore.js";

export default {
  data() {
    return {
      setting: null,
      currentContent: '', 
      isVisible: false, 
    };
  },
  computed: {
    setting() {
      const settingStore = useSettingStore();
      return settingStore.setting;
    },
    hasPaigData() {
      return this.setting && this.setting.modal_pop_up;
    },
    hasPaihData() {
      return this.setting && this.setting.img_modal_pop;
    },
    formattedContent() {
      if (this.setting && this.setting.modal_pop_up) {
        return this.setting.modal_pop_up; // Preserva o HTML original
      }
      return '';
    }
  },
  methods: {
    async getSetting() {
      const settingStore = useSettingStore();
      this.setting = settingStore.setting;

      const hasData = this.hasPaigData || this.hasPaihData;
      this.isVisible = hasData;

      if (this.hasPaigData) {
        this.currentContent = 'paig';
      } else if (this.hasPaihData) {
        this.currentContent = 'paih';
      }
    },
    closeModal() {
      this.isVisible = false; 
    },
    showContent(content) {
      this.currentContent = content;
    },
  },
  async created() {
    await this.getSetting();
  },
};
</script>

<style scoped>
.over-modals {
  position: fixed;
  top: 0;
  width: 100%;
  height: 100%;
  max-width: 450px;
  z-index: 55;
  background-color: rgba(0, 0, 0, 0.616);
}
.mongos {
  z-index: 55;
}
.nodes {
  border-bottom: 1px solid var(--borders-and-dividers-colors);
}
.bunese {
  border-radius: 10px;
}
.paih {
  border-bottom-left-radius: 10px;
  border-bottom-right-radius: 10px;
}
.binous {
  border-radius: 50%;
  border: 2px solid var(--text-color)
}
.selected-tab {
  border-bottom: 2px solid var(--borders-and-dividers-colors);
}

.content-container {
  max-height: 300px; /* Ajuste conforme necessário */
  overflow-y: auto; /* Mantém a rolagem vertical */
}

.content-container::-webkit-scrollbar {
  width: 0px; /* Oculta a barra de rolagem no Chrome, Safari e Opera */
}

.content-container {
  -ms-overflow-style: none; /* Oculta a barra de rolagem no Internet Explorer e Edge */
  scrollbar-width: none; /* Oculta a barra de rolagem no Firefox */
}

@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

body {
  font-family: 'Helvetica', sans-serif; /* Define a fonte Helvetica para todo o documento */
}
.custom-font {
    font-family: 'Helvetica', sans-serif;
    color: var(--text-color);
}
</style>
