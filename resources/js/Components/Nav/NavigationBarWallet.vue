<template>
  <nav class="fixed background-bottom-navigation flex top-0 z-50 pl-2 pr-2 bordas w-full max-w-[450px] p-2">
     <button @click="$router.push('/')">
        <i class="fa-light fa-chevron-left text-white ml-2"></i>
      </button>
    <div class="container mx-auto w-full flex overflow-x-auto whitespace-nowrap">
     
      <button @click="$router.push('/profile/deposit')" 
              :class="['btn-nav ml-3 custom-font', { active: isActive('/profile/deposit') }]">
        {{ $t('Deposit') }}
      </button>
      <button @click="$router.push('/profile/withdraw')" 
              :class="['btn-nav ml-3 custom-font', { active: isActive('/profile/withdraw') }]">
        {{ $t('Withdraw') }}
      </button>
      <button @click="$router.push('/profile/transactions')" 
              :class="['btn-nav ml-3 custom-font', { active: isActive('/profile/transactions') }]">
        {{ $t('Transactions') }}
      </button>
      <button @click="$router.push('/profile/addaccount')" 
              :class="['btn-nav ml-3 mr-3 custom-font', { active: isActive('/profile/addaccount') }]">
        {{ $t('Gerenciar Contas') }}
      </button>
    </div>
  </nav>
</template>

<script>
import { useSettingStore } from "@/Stores/SettingStore.js";

export default {
  name: 'NavigationBar',
  setup() {
    const { setting } = useSettingStore();
    return {
      setting,
    };
  },
  methods: {
    isActive(route) {
      return this.$route.path === route;
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
  white-space: nowrap; /* Evita quebra de linha dentro dos botões */
}

.btn-nav.active::after {
  content: '';
  position: absolute;
  bottom: 1px;
  left: 0;
  width: 100%;
  height: 2px;
  background-color: var(--background-itens-selected);
}

.bordas {
  border-bottom-width: 1px; 
  border-bottom-width: solid; 
  border-color: var(--borders-and-dividers-colors);
}

/* Oculta a barra de rolagem no Webkit (Chrome, Safari) */
.container::-webkit-scrollbar {
  display: none;
}

/* Oculta a barra de rolagem no Firefox e outros navegadores */
.container {
  scrollbar-width: none; /* Para Firefox */
  -ms-overflow-style: none; /* Para Internet Explorer e Edge */
  overflow-x: auto; /* Adiciona rolagem horizontal quando necessário */
}

@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

body {
  font-family: 'Helvetica', sans-serif; /* Define a fonte Helvetica para todo o documento */
}
.custom-font {
    font-family: 'Helvetica', sans-serif;
    font-size: 14px;
}
</style>
