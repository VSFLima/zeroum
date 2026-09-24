<template>
  <nav class="fixed background-bottom-navigation top-0 z-50 pl-2 pr-2 custom-font bordas w-full max-w-[450px] p-2">
    <div class="container mx-auto flex">
      <button @click="$router.push('/')" class="back-button ml-2 mr-1" style="width: 12px; height: auto;">
      <img :src="`/storage/` + setting.icon_wt_10" alt="Home" class="home-icon" style="width: 10px; height: auto;">
    </button>
    <div class="container mx-auto w-full flex overflow-x-auto whitespace-nowrap">
      <button @click="$router.push('/profile/affiliate')" 
              :class="['btn-nav', { active: isActive('/profile/affiliate') }]">
        {{ $t('Caixa de tesouro') }}
      </button>
       <button @click="$router.push('/profile/mission')" 
              :class="['btn-nav', { active: isActive('/profile/mission') }]">
        {{ $t(  'Mission'  ) }}
      </button>
      <button @click="$router.push('/profile/affiliaterev')" 
              :class="['btn-nav', { active: isActive('/profile/affiliaterev') }]">
        {{ $t(  'Afiliado'  ) }}
      </button>

     <button @click="$router.push('/profile/events')" 
              :class="['btn-nav', { active: isActive('/profile/events') }]">
        {{ $t('Eventos') }}
      </button> 

      <button @click="$router.push('/profile/vip')" 
              :class="['btn-nav', { active: isActive('/profile/vip') }]">
        {{ $t(  'VIP'  ) }}
      </button>
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
  margin-left: 5px;
  padding: 4px 8px;
  color: #fff;
  cursor: pointer;
  transition: background-color 0.3s ease;
  display: flex;
  align-items: center;
  position: relative;
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
.btn-nav.active::after {
  margin-left: 5px;
  content: '';
  position: absolute;
  bottom: -1px;
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
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

body {
  font-family: 'Helvetica', sans-serif; /* Define a fonte Helvetica para todo o documento */
}
.custom-font {
    font-family: 'Helvetica', sans-serif;
    font-style: normal;
    line-height: 23px;
    font-weight: 400;
}
</style>
