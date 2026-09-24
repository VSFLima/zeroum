<template>
  <div v-if="isVisible" class="overlays"></div>
  <div v-if="isVisible" tabindex="-1" aria-hidden="true" class="fixed inset-0 modal-container flex flex-col items-center justify-center overflow-y-auto">
    <div class="relative w-[calc(100%-30px)] max-w-[420px] justify-center items-center">
      <div class="modal-content p-4 bg-white rounded shadow-lg">
        <!-- Início do header -->
        <div class="p-4 h-12 mb-2 flex justify-center items-center relative">
          <h2 class="text-[14px] font-bold absolute left-1/2 transform -translate-x-1/2">Crie sua senha de SAQUE</h2>
        </div>
        <!-- Fim do header -->

        <button @click="navigateToCreatePin" class="flex justify-center items-center vgdfd">Criar uma senha</button>
      </div>
    </div>
  </div>
</template>

<script>
import { useAuthStore } from "@/Stores/Auth.js";
import { useSettingStore } from "@/Stores/SettingStore.js";
import { useRouter } from 'vue-router';

export default {
  data() {
    return {
      isVisible: false, // Inicialmente invisível
    };
  },
  setup() {
    const router = useRouter();
    return { router };
  },
  computed: {
    userData() {
      const authStore = useAuthStore();
      return authStore.user;
    },
    setting() {
      const settingStore = useSettingStore();
      return settingStore.setting;
    },
  },
  methods: {
    open() {
      this.isVisible = true; // Abre o modal
    },
    navigateToCreatePin() {
      this.router.push('/profile/createpin');
    },
    getSetting() {
      const settingStore = useSettingStore();
      this.setting = settingStore.setting;
    }
  }
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
  padding: 16px;
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
