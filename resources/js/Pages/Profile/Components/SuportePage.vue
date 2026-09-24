<template>
    <div class="flex flex-cols-2 justify-between items-center w-full p-2 background-bottom-navigation rounded-lg custom-font">
        <div class="w-20">
            <img class="h-12 w-12" src="/public/assets/images/suportepage.png">
        </div>
         <div class="flex flex-col ml-2">
            <span class="text-color text-[15px]">Apoio online 24/7</span>
            <span class="text-color text-[11px]">Converse com o serviço profissional de apoio ao cliente online para resolver os seus problemas</span>
            <div class="flex grid grid-cols-3">
                <a :href="custom.telegram" target="_blank" class="text-color text-[10px] bordial"> <span>Serviço Telegram</span></a>
            </div>
        </div>
    </div>

    <div class="flex flex-col p-2 background-bottom-navigation rounded-lg mt-2 w-full custom-font">
    <div class="flex flex-cols-2">
            <nav >
                <div class="container mx-auto flex h-12">
                <div class="container mx-auto w-full flex overflow-x-auto whitespace-nowrap">
                <button @click="activateTab('supporttg')" 
                        :class="['btn-nav text-color', { active: activeTab === 'supporttg' }]"
                        ref="supporttgBtn">
                    {{ $t('Suporte Telegram') }}
                </button>
                <button @click="activateTab('supportwp')" 
                        :class="['btn-nav text-color', { active: activeTab === 'supportwp' }]"
                        ref="supportwpBtn">
                    {{ $t('Suporte WhatsApp') }}
                </button>
                </div>
            </div>
            </nav>
            
            
    </div>
    <div v-if="activeTab === 'supporttg'">
             <div class="flex items-center mt-1 justify-between w-full bahs mb-1">
    <div class="flex items-center">
        <div class="w-14">
            <img class="h-8 w-8" src="/public/assets/images/suportepage.png">
        </div>

        <div class="flex flex-col ml-2">
            <span class="text-color text-[9px]">{{ setting.software_name }} | Canal Oficial®</span>
            <span class="text-color text-[9px]">a{{ setting.software_name }}</span>
        </div>
    </div>

    <div>
        <a :href="custom.telegram" target="_blank" class="text-color text-[12px] bordial py-1">
            <span >Contactar Agora</span>
       </a>
    </div>
</div>

            <div v-if="custom.telegram" class="flex items-center mt-1 bahs justify-between w-full mb-1">
    <div class="flex items-center">
        <div class="w-14">
            <img class="h-8 w-8" src="/public/assets/images/suportepage.png">
        </div>

        <div class="flex flex-col ml-2">
            <span class="text-color text-[9px]">{{ setting.software_name }} | Canal Oficial®</span>
            <span class="text-color text-[9px]">a{{ setting.software_name }}</span>
        </div>
    </div>

    <div>
       <a :href="custom.telegram" target="_blank" class="text-color text-[12px] bordial py-1">
            <span >Contactar Agora</span>
       </a>
    </div>
</div>

            
            </div>

            <div v-if="activeTab === 'supportwp'">
           <div v-if="custom.whastapp" class="flex items-center mt-1 bahs justify-between w-full mb-1">
    <div class="flex items-center">
        <div class="w-14">
            <img class="h-8 w-8" src="/public/assets/images/suportepage.png">
        </div>

        <div class="flex flex-col ml-2">
            <span class="text-color text-[9px]">Suporte Oficial | WhatsApp</span>
           <span class="text-color text-[9px]">{{ setting.software_name }}</span>

        </div>
    </div>

    <div>
       <a :href="custom.whastapp" target="_blank" class="text-color text-[12px] bordial py-1">
            <span >Contactar Agora</span>
       </a>
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
            activeTab: 'supporttg',
            custom: null,
            setting: null,
        }
  },
  computed: {

  },
    methods: {
        activateTab(tab) {
      this.activeTab = tab;
      this.$nextTick(() => {
        // Verifica se a referência ao botão ativo existe e rola para ele
        const activeButton = this.$refs[`${tab}Btn`];
        if (activeButton) {
          activeButton.scrollIntoView({ behavior: 'smooth', inline: 'center' });
        }
      });
        },
    getSetting: function() {
        const _this = this;
        const settingStore = useSettingStore();
        const settingData = settingStore.setting;

        if(settingData) {
            _this.setting = settingData;
        }
        },
    },
     async created() {
  this.getSetting();
  this.custom = custom;


},

}
</script>

<style scoped>
.bordial {
    padding: 8px;
    border: 1px solid var(--borders-and-dividers-colors);
    border-radius: 8px;
}

.bahs {
    background: var(--background-bottom-navigation);
    padding: 8px;
    border-radius: 8px;
    border: 1px solid var(--borders-and-dividers-colors)
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
.container::-webkit-scrollbar {
  display: none;
}

/* Oculta a barra de rolagem no Firefox e outros navegadores */
.container {
  scrollbar-width: none; /* Para Firefox */
  -ms-overflow-style: none; /* Para Internet Explorer e Edge */
  overflow-x: auto; /* Adiciona rolagem horizontal quando necessário */
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
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

body {
  font-family: 'Helvetica', sans-serif; /* Define a fonte Helvetica para todo o documento */
}
.custom-font {
    font-family: 'Helvetica', sans-serif;
    color: var(--text-color);
    font-style: normal;
    font-weight: 400;
}
</style>
