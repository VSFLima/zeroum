<template>
  <nav class="fixed background-bottom-navigation top-0 z-50 p-2 bordas w-full max-w-[450px]">
    <div class="container mx-auto flex justify-between items-center">
      <button @click="$router.push('/')" class="back-button ml-2" style="width: 12px; height: auto;">
        <img :src="`/storage/` + setting.icon_wt_10" alt="Home" class="home-icon" style="width: 10px; height: auto;">
      </button>
      <div class="w-full flex justify-center items-center">
        <span class="name-page custom-font-title">{{ $t('Convidar') }}</span> 
      </div>
    </div>
  </nav>
</template>

<script>
import { useSettingStore } from "@/Stores/SettingStore.js";

export default {
  name: 'NavigationBar',
  components: {
  },
  data() {
    return {
    }
  },
  setup() {
    const { setting } = useSettingStore();
    return {
      setting,
    };
  },
  computed: {
    setting() {
      const authStore = useSettingStore();
      return authStore.setting;
    }
  },
  methods: {
    isActive(route) {
      return this.$route.path === route;
    },
    getSetting() {
      const settingStore = useSettingStore();
      this.setting = settingStore.setting;
    },
  }
};
</script>

<style scoped>
.btn-nav {
  padding: 4px 8px;
  color: #fff;
  cursor: pointer;
  transition: background-color 0.3s ease;
  display: flex;
  align-items: center;
  position: relative;
}

.btn-nav.active::after {
  content: '';
  position: absolute;
  bottom: -2px;
  left: 0;
  width: 100%;
  height: 2px;
  background-color: var(--background-itens-selected);
}

.icon-left {
  margin-right: 8px; /* Ajuste o valor conforme necessário */
  width: 20px; /* Ajuste o tamanho da imagem conforme necessário */
  height: 20px; /* Ajuste o tamanho da imagem conforme necessário */
}

.bordas {
  border-bottom-width: 1px; 
  border-bottom-width: solid; 
  border-color: var(--borders-and-dividers-colors);
}

.name-page {
  text-align: center;
}
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

body {
  font-family: 'Helvetica', sans-serif; /* Define a fonte Helvetica para todo o documento */
}
.custom-font-title {
    font-family: 'Helvetica', sans-serif;
    font-size: 16px;
    color: var(--title-sub-color);
}
</style>
