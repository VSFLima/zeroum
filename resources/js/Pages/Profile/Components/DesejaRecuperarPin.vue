<template>
  <div v-if="isVisible" class="overlays"></div>
  <div v-if="isVisible" tabindex="-1" aria-hidden="true" class="fixed inset-0 modal-container flex flex-col items-center justify-center overflow-y-auto">
    <div class="relative w-[calc(100%-30px)] max-w-[420px] justify-center items-center">
      <div class="modal-content bg-white rounded shadow-lg">
        <!-- Início do header -->
        <div class="bajou h-12 flex justify-center items-center relative">
          <h2 class="text-[14px] font-bold absolute left-1/2 transform -translate-x-1/2 text-color">Você já possui um PIN</h2>
        </div>
        <div class="p-2 h-12 flex justify-center items-center relative">
          <h2 class="text-[14px] font-bold absolute left-1/2 transform -translate-x-1/2 text-color">Deseja Recuper seu PIN?</h2>
        </div>
        <!-- Fim do header -->

         <div class="p-2 h-12 flex justify-center items-center relative">
        <a :href="custom.bt_5_link" class="flex justify-center items-center text-color vgdfd">Recuperar PIN</a>
      </div>
      </div>
    </div>
  </div>
</template>

<script>
import { useAuthStore } from "@/Stores/Auth.js";
import { useSettingStore } from "@/Stores/SettingStore.js";

export default {
  data() {
    return {
      isVisible: false, // Inicialmente invisível
      custom: null,
    };
  },
  computed: {
    userData() {
      const authStore = useAuthStore();
      return authStore.user;
    },
    setting() {
      const settingStore = useSettingStore();
      return settingStore.setting;
    }
  },
  methods: {
    open() {
      this.isVisible = true; // Abre o modal
    },
    getSetting() {
      const settingStore = useSettingStore();
      this.setting = settingStore.setting;
    }
    },
  async created() {
      this.custom = custom;
  },
}
</script>

<style scoped>
.overlays {
  position: fixed;
  top: 0;
  width: 100%;
  height: 100%;
  max-width: 450px;
  z-index: 40;
  background-color: rgba(0, 0, 0, 0.5);
}
.modal-container {
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 50;
}
.modal-content {
  background: var(--background-bottom-navigation);
  border-radius: 8px;
  padding: 0px;
}
.bajou {
    border-bottom-width: 1px;
    border-bottom-width: solid;
    border-color: var(--borders-and-dividers-colors);
}
.vgdfd {
  margin: 5px;
  width: 100%;
  padding: 5px;
  border-width: 1px;
  border-style: solid;
  border-color: var(--borders-and-dividers-colors);
  border-radius: 10px;
}
</style>
