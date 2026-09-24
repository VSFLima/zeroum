<template>

<div class="w-full p-2 h-auto flex items-center max-w-[450px] mx-auto bgcategoria">
  <!-- Condição para exibir Jackpot Um ou Jackpot Dois -->
  <div v-if="isJackpotOneActive" class="flex w-full justify-center margin-jackpot relative">
    <!-- JACKPOT UM -->
    <div class="flex flex-col w-full relative justify-center items-center">
      <img :src="`/storage/` + setting.image_jackpot" class="max-h-28 w-auto p-2 object-contain">
      <div class="absolute bottom-2 left-0 w-full flex justify-center items-center p-2 text-jackpot">
        {{ formatNumber(currentJackpotValue.toFixed(2)) }}
      </div>
    </div>

    <!-- Botões do Jackpot Um (comentados para uso futuro) -->
    <!-- 
    <div class="grid grid-cols-2 gap-1 w-full justify-center items-center mt-2">
      <div v-if="custom.bt_1_link" class="h-12 w-full">
        <a :href="custom.bt_1_link" target="_blank" class="h-12 w-full bghj rounded flex justify-start items-center">
          <img :src="`/storage/`+setting.icon_bt_1" class="w-5 h-5 mr-1 ml-2" alt="Ícone">
          <span style="font-size: 10px; color: var(--text-color);">{{ setting.name_bt_1 }}</span>
        </a>
      </div>
      <div v-if="custom.bt_2_link" class="h-12 w-full">
        <a :href="custom.bt_2_link" target="_blank" class="h-12 w-full bghj-1 rounded flex justify-start items-center">
          <img :src="`/storage/`+setting.icon_bt_2" class="w-5 h-5 mr-1 ml-2" alt="Ícone">
          <span style="font-size: 10px; color: var(--text-color);">{{ setting.name_bt_2 }}</span>
        </a>
      </div>
      <div v-if="custom.bt_3_link" class="h-12 w-full">
        <a :href="custom.bt_3_link" target="_blank" class="h-12 w-full bghj-2 rounded flex justify-start items-center">
          <img :src="`/storage/`+setting.icon_bt_3" class="w-5 h-5 mr-1 ml-2" alt="Ícone">
          <span style="font-size: 10px; color: var(--text-color);">{{ setting.name_bt_3 }}</span>
        </a>
      </div>
      <div v-if="custom.bt_4_link" class="h-12 w-full">
        <a :href="custom.bt_4_link" target="_blank" class="h-12 w-full bghj-3 rounded flex justify-start items-center">
          <img :src="`/storage/`+setting.icon_bt_4" class="w-5 h-5 mr-1 ml-2" alt="Ícone">
          <span style="font-size: 10px; color: var(--text-color);">{{ setting.name_bt_4 }}</span>
        </a>
      </div>
    </div>
    -->
  </div>
  <!-- FIM DO JACKPOT UM -->
    
  <!-- JACKPOT DOIS -->
  <div v-else class="flex w-full justify-center relative">
    <div class="flex flex-col w-full relative justify-center items-center">
      <img src="/public/assets/images/jackpot2.png" class="max-h-28 w-auto p-2 object-contain">
      <div class="absolute bottom-2 left-0 w-full flex justify-center items-center p-2 text-jackpot">
        {{ formatNumber(currentJackpotValue.toFixed(2)) }}
      </div>
    </div>
  </div>
</div>

</template>

<script>
import { useSettingStore } from "@/Stores/SettingStore.js";
import { useRouter } from "vue-router";

export default {
  data() {
    return {
      isLoading: false,
      setting: null,
      custom: {},
      jackpotValue: 10714981, // valor inicial do jackpot
      currentJackpotValue: 10714981, // valor exibido do jackpot
    };
  },
  setup() {
    const router = useRouter();
    return { router };
  },
  computed: {
    isJackpotOneActive() {
      return !!this.custom.bt_1_link || !!this.custom.bt_2_link || !!this.custom.bt_3_link || !!this.custom.bt_4_link;
    }
  },
  methods: {
    getSetting() {
      const settingStore = useSettingStore();
      if (settingStore && settingStore.setting) {
        this.setting = settingStore.setting;
        this.custom = this.setting.custom || {}; // Certifique-se de que custom está definido
      }
    },
    incrementJackpot() {
      this.jackpotValue *= 1.001; // aumenta 0,10%
      this.animateJackpot();
    },
    animateJackpot() {
      const duration = 1000; // duração da animação em milissegundos
      const startValue = this.currentJackpotValue;
      const endValue = this.jackpotValue;
      const startTime = performance.now();

      const animate = (currentTime) => {
        const elapsedTime = currentTime - startTime;
        const progress = Math.min(elapsedTime / duration, 1);
        this.currentJackpotValue = startValue + (endValue - startValue) * progress;
        if (progress < 1) {
          requestAnimationFrame(animate);
        }
      };

      requestAnimationFrame(animate);
    },
    formatNumber(number) {
      return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }
  },
  created() {
    this.getSetting();
    this.custom = custom;
    setInterval(this.incrementJackpot, 2000); // chama incrementJackpot a cada 2 segundos
  }
};
</script>

<style scoped>

@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

.relative {
  position: relative;
}

.absolute {
  font-size: 24px; /* Tamanho atualizado para melhor visibilidade */
  color: var(--value-color-jackpot); /* Usa a variável já definida */
  position: absolute;
  display: flex;
  align-items: center; /* Centraliza verticalmente */
  justify-content: center; /* Centraliza horizontalmente */
  top: 55%; /* Centraliza verticalmente */
  left: 50%; /* Centraliza horizontalmente */
  transform: translate(-50%, -50%); /* Ajusta para o centro exato */
  font-family: 'Roboto', sans-serif; /* Substitui Shrikhand por Roboto */
  font-weight: 700; /* Adiciona peso maior para destacar */
  letter-spacing: 0.05em; /* Espaçamento entre letras */
  text-shadow: 
    -1px -1px 0 #ffffff, 
    1px -1px 0 #ffffff, 
    -1px 1px 0 #ffffff, 
    1px 1px 0 #ffffff; /* Contorno branco */
}

.absolute-2 {
  font-size: 24px; /* Maior para destacar */
  color: var(--value-color-jackpot);
  position: absolute;
  display: flex;
  align-items: center; /* Centraliza verticalmente */
  justify-content: center; /* Centraliza horizontalmente */
  top: 55%; /* Centraliza verticalmente */
  left: 50%; /* Centraliza horizontalmente */
  transform: translate(-50%, -50%); /* Ajusta para o centro exato */
  font-family: 'Roboto', sans-serif; /* Substitui Shrikhand por Roboto */
  font-weight: 700; /* Adiciona peso maior para destacar */
  letter-spacing: 0.05em; /* Espaçamento entre letras */
  text-shadow: 
  -1px -1px 0 #ffffff, 
    1px -1px 0 #ffffff, 
    -1px 1px 0 #ffffff, 
    1px 1px 0 #ffffff; /* Contorno branco */
}

.margin-jackpot {
  margin-top: 2px; /* Ajuste o valor conforme necessário */
  margin-bottom: 2px; /* Ajuste o valor conforme necessário */
}

.bghj {
  background-color: var(--color-bt-1);
  border-radius: 10px;
}
.bghj-1 {
  background-color: var(--color-bt-2);
  border-radius: 10px;
}
.bghj-2 {
  background-color: var(--color-bt-3);
  border-radius: 10px;
}
.bghj-3 {
  background-color: var(--color-bt-4);
  border-radius: 10px;
}
.bgcategoria{
  background-color: var(--background-color-jackpot);
}

</style>
