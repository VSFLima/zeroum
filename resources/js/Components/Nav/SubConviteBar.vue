<template>
  <nav class="fixed background-bottom-navigation top-14 bordec z-50 pl-2 pr-2 w-full max-w-[450px] p-1 mb-4">
    <div class="container mx-auto flex overflow-x-auto whitespace-nowrap hide-scrollbar">
      <button @click="$router.push('/profile/linkconvite')" 
              :class="['btn-nav', { active: isActive('/profile/linkconvite') }]">
        {{ $t('Link de Convite') }}
      </button>
      <button @click="$router.push('/profile/desempenho')" 
              :class="['btn-nav', { active: isActive('/profile/desempenho') }]">
        {{ $t('Desempenho') }}
      </button>
     <!--  <button @click="$router.push('/profile/finance')" 
              :class="['btn-nav', { active: isActive('/profile/finance') }]">
        {{ $t('Finanças Dos Subordinados') }}
      </button>
      <button @click="$router.push('/profile/apostas')" 
              :class="['btn-nav', { active: isActive('/profile/apostas') }]">
        {{ $t('Apostas dos Subordinados') }}
      </button>
      <button @click="$router.push('/profile/pedidos')" 
              :class="['btn-nav', { active: isActive('/profile/pedidos') }]">
        {{ $t('Pedidos de subordinados') }}
      </button> -->
    </div>
  </nav>
</template>

<script>
import { useSettingStore } from "@/Stores/SettingStore.js";

export default {
  name: 'NavigationBar',
  components: {},
  data() {
    return {};
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
  transition: background-color 0.3s ease, color 0.3s ease, border-bottom 0.3s ease;
  display: inline-block; /* Alterado de flex para inline-block */
  white-space: nowrap; /* Garante que os botões não quebrem linha */
}

.icon-left {
  margin-right: 8px; /* Ajuste o valor conforme necessário */
  width: 20px; /* Ajuste o tamanho da imagem conforme necessário */
  height: 20px; /* Ajuste o tamanho da imagem conforme necessário */
}

.btn-nav.active {
  border-bottom: 2px solid var(--borders-and-dividers-colors); /* Borda inferior de 2px quando ativo */
  color: var(--borders-and-dividers-colors); /* Muda a cor do texto para a mesma cor da borda */
}


.hide-scrollbar {
  -ms-overflow-style: none; /* Para Internet Explorer e Edge */
  scrollbar-width: none; /* Para Firefox */
}
.bordec{
  border-top-width: 1px;
  border-top-width: solid;
  border-color: var(--borders-and-dividers-colors);
}
</style>
