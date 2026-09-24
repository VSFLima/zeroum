<template>
  <WalletLayout>
    <div class="w-full items-center max-w-[450px] top-0 fixed background-bottom-navigation mx-auto custom-font bordas flex h-12 p-2">
      <button @click="$router.push('/')" class="absolute left-2 ml-2 mr-1">
        <img :src="`/storage/` + setting.icon_wt_10" alt="Home" class="h-5 w-auto">
      </button>
      <span class="custom-font text-color text-[16px] mx-auto">Centro de mensagens</span>
    </div>

    <nav class="fixed background-bottom-navigation top-12 z-50 pl-2 pr-2 custom-font bordas items-center w-full h-12 max-w-[450px]">
      <div class="container mx-auto flex h-12">
        <div class="container mx-auto w-full flex overflow-x-auto whitespace-nowrap">
          <button @click="activateTab('support')" 
                  :class="['btn-nav text-color', { active: activeTab === 'support' }]"
                  ref="supportBtn">
            {{ $t('Suporte') }}
          </button>
         <!--<button @click="activateTab('news')" 
                  :class="['btn-nav', { active: activeTab === 'news' }]"
                  ref="newsBtn">
            {{ $t('Notícia') }}
          </button>--> 
          <button @click="activateTab('notification')" 
                  :class="['btn-nav text-color', { active: activeTab === 'notification' }]"
                  ref="notificationBtn">
            {{ $t('Notificação') }}
          </button>
          <button @click="activateTab('scrollPanel')" 
                  :class="['btn-nav text-color', { active: activeTab === 'scrollPanel' }]"
                  ref="scrollPanelBtn">
            {{ $t('Painel Rolante') }}
          </button>
        </div>
      </div>
    </nav>
<div class="top-24 fixed p-2 w-full h-full max-w-[450px]">
    <!-- Conteúdo das Tabs -->
    <div v-if="activeTab === 'support'">
      <!-- Conteúdo da aba Suporte -->
       <SuportePage />
    </div>
    <!--<div v-if="activeTab === 'news'">
      
       <NoticiaPage />
    </div> -->
    <div v-if="activeTab === 'notification'">
      <!-- Conteúdo da aba Notificação -->
       <NotificacaoPage />
    </div>
    <div v-if="activeTab === 'scrollPanel'">
      <!-- Conteúdo da aba Painel Rolante -->
       <PainelRolantePage />
    </div>
    </div>
  </WalletLayout>
</template>

<script>

import { useSettingStore } from "@/Stores/SettingStore.js";
import SuportePage from "./Components/SuportePage.vue";
import NoticiaPage from "./Components/NoticiaPage.vue";
import NotificacaoPage from "./Components/NotificacaoPage.vue";
import PainelRolantePage from "./Components/PainelRolantePage.vue";
import WalletLayout from "@/Layouts/WalletLayout.vue";

export default {
  components: {
    WalletLayout, SuportePage, NoticiaPage, NotificacaoPage, PainelRolantePage
  },
  data() {
    return {
      activeTab: 'support' // Define a aba inicial
    };
  },
  beforeRouteEnter(to, from, next) {
    // Verifica se há um parâmetro de aba na URL e define a aba ativa
    next(vm => {
      const tab = to.query.tab;
      if (tab) {
        vm.activeTab = tab;
      }
    });
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
    getSetting() {
      const settingStore = useSettingStore();
      this.setting = settingStore.setting;
    },
    activateTab(tab) {
      this.activeTab = tab;
      this.$nextTick(() => {
        // Verifica se a referência ao botão ativo existe e rola para ele
        const activeButton = this.$refs[`${tab}Btn`];
        if (activeButton) {
          activeButton.scrollIntoView({ behavior: 'smooth', inline: 'center' });
        }
      });
    }
  }
};
</script>

<style scoped>
/* O estilo permanece o mesmo que no seu código original */

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

.btn-nav {
  margin-left: 5px;
  padding: 4px 8px;
  padding-bottom: 6px; /* Espaço extra abaixo do texto */
  color: var(--text-color);
  cursor: pointer;
  transition: color 0.3s ease; /* Transição da cor do texto */
  display: flex;
  align-items: center;
  position: relative;
}

.btn-nav::after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 0;
  width: 0;
  height: 2px;
  background-color: var(--background-itens-selected);
  transition: width 0.3s ease, left 0.3s ease; /* Transição suave para largura e posição */
}

.btn-nav.active::after {
  width: 50%; /* Largura da barrinha no botão ativo */
  left: 25%; /* Centraliza a barrinha abaixo do texto */
}

.btn-nav.active {
  color: var(--background-itens-selected); /* Cor do texto no botão ativo */
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
