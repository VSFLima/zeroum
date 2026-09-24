<template>
  <BauLayout>
    <nav class="fixed background-bottom-navigation top-0 z-50 pl-2 pr-2 custom-font bordas items-center w-full h-12 max-w-[450px]">
      <div class="container mx-auto flex h-12">
        <!-- Botão Home que redireciona para uma URL diferente -->
        <button @click="$router.push('/')" class="back-button ml-2 mr-1" style="width: 12px; height: auto;">
          <img :src="`/storage/` + setting.icon_wt_10" alt="Home" class="home-icon" style="width: 10px; height: auto;">
        </button>
        <div class="container mx-auto w-full flex overflow-x-auto whitespace-nowrap">
          <button @click="activateTab('affiliate')" 
                  :class="['btn-nav', { active: activeTab === 'affiliate' }]"
                  ref="affiliateBtn">
            {{ $t('Caixa de tesouro') }}
          </button>
          <button @click="activateTab('mission')" 
                  :class="['btn-nav', { active: activeTab === 'mission' }]"
                  ref="missionBtn">
            {{ $t('Mission') }}
          </button>
          <button @click="activateTab('affiliaterev')" 
                  :class="['btn-nav', { active: activeTab === 'affiliaterev' }]"
                  ref="affiliaterevBtn">
            {{ $t('Afiliado') }}
          </button>
          <button @click="activateTab('events')" 
                  :class="['btn-nav', { active: activeTab === 'events' }]"
                  ref="eventsBtn">
            {{ $t('Eventos') }}
          </button>
          <button @click="activateTab('vip')" 
                  :class="['btn-nav', { active: activeTab === 'vip' }]"
                  ref="vipBtn">
            {{ $t('VIP') }}
          </button>
        </div>
      </div>
    </nav>

    <div class="paginations">
    <!-- Conteúdo das Tabs -->
    <div v-if="activeTab === 'affiliate'">
      <AffiliateComponent />
    </div>
    <div v-if="activeTab === 'mission'">
      <MissionComponent />
    </div>
    <div v-if="activeTab === 'affiliaterev'">
      <AffiliateRevComponent />
    </div>
    <div v-if="activeTab === 'events'">
      <EventsComponent />
    </div>
    <div v-if="activeTab === 'vip'">
      <VipComponent />
    </div>
</div>
  </BauLayout>
</template>
<script>
import BauLayout from "@/Layouts/BauLayout.vue";
import { useSettingStore } from "@/Stores/SettingStore.js";

// Importando os componentes das páginas
import AffiliateComponent from '@/Pages/Profile/AffiliatePage.vue';
import MissionComponent from '@/Pages/Profile/MissionPage.vue';
import AffiliateRevComponent from '@/Pages/Profile/AffiliateP.vue';
import EventsComponent from '@/Pages/Profile/EventsPage.vue';
import VipComponent from '@/Pages/Profile/VipPage.vue';

export default {
  components: {
    BauLayout,
    AffiliateComponent,  // Caixa de tesouro
    MissionComponent,    // Missão
    AffiliateRevComponent, // Afiliado
    EventsComponent,     // Eventos
    VipComponent         // VIP
  },
  data() {
    return {
      activeTab: 'affiliate' // Define a aba inicial
    };
  },
   mounted() {
    this.updateActiveTabFromRoute();
  },
  watch: {
    '$route.query.tab': 'updateActiveTabFromRoute'
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
     updateActiveTabFromRoute() {
      const tab = this.$route.query.tab;
      if (tab) {
        this.activeTab = tab;
      }
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
.paginations {
  margin-top: 55px;
  margin-bottom: 60px;
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
  color: var(--text-color);
}
</style>
