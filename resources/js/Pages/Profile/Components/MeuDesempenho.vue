<template>
  <div class="background-bottom-navigation rounded-lg">
    <div class="flex w-full justify-center py-2 items-center bordse">
      <p class="text-[14px] custom-font-title">Informações dos meus ganhos e perdas</p>
    </div>
    <div class="p-2">
<div class="grid grid-cols-3 gap-2">
  <div class="flex flex-col items-center py-4 rounded-lg item-sub-color">
    <p class="text-[12px] custom-font-title">{{ $t('Balanço Geral') }}</p>
    <p class="text-2xl custom-font-text">R$ {{ Number(betssMinusWins || 0).toFixed(2) }}</p>
  </div>
  <div class="flex flex-col items-center py-4 rounded-lg item-sub-color">
    <p class="text-[12px] custom-font-title">{{ $t('Ganhos') }}</p>
    <p class="text-2xl custom-font-text">R$ {{ Number(totalWinsAmount || 0).toFixed(2) }}</p>
  </div>
  <div class="flex flex-col items-center py-4 rounded-lg item-sub-color">
    <p class="text-[12px] custom-font-title">{{ $t('Perdas') }}</p>
    <p class="text-2xl custom-font-text">R$ {{ Number(totalBetsAmount || 0).toFixed(2) }}</p>
  </div>
</div>


    </div>

    
  </div>
  <div class="background-bottom-navigation rounded-lg">
<!-- Lista de Apostas -->
    <div class="mt-4">
     <div class="flex w-full justify-center py-2 items-center bordse">
      <p class="text-[14px] custom-font-title">Lista de apostas</p>
    </div>
      <div class="grid grid-cols-1 gap-4 p-2">
        <div v-for="bet in userBets" :key="bet.id" class="flex justify-between p-2 rounded-lg item-sub-color">
          <div class="flex flex-col">
           <p class="custom-font-text"><strong>Jogo </strong>{{ bet.game }}</p>
          <p class="custom-font-text"><strong>Provedor </strong> {{ bet.provider }}</p>
          </div>
          <div class="flex flex-col">
          <p class="custom-font-titles"><strong>Valor </strong> R$ {{ bet.amount }}</p>
          <p class="custom-font-text"><strong>Resultado </strong> {{ bet.result }}</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import HttpApi from "@/Services/HttpApi.js";
import { useSettingStore } from "@/Stores/SettingStore.js";
import { useAuthStore } from "@/Stores/Auth.js";

export default {
  data() {
    return {
      betssMinusWins: 0,
      totalWinsAmount: 0,
      totalBetsAmount: 0,
      userBets: [],
    };
  },
  computed: {
    isAuthenticated() {
      const authStore = useAuthStore();
      return authStore.isAuth;
    },
    userData() {
      const authStore = useAuthStore();
      return authStore.user;
    },
    setting() {
      const authStore = useSettingStore();
      return authStore.setting;
    }
  },
  async created() {
    this.fetchAllData();
  },
  methods: {
    fetchAuthenticatedUserBets() {
      this.loading = true;
      HttpApi.get('profile/infos/user-bets')
        .then(response => {
          this.userBets = response && response.data ? response.data : [];
        })
        .catch(error => {
          console.error("Error fetching user bets", error);
          this.userBets = [];
        })
        .finally(() => {
          this.loading = false;
        });
    },
    
    async fetchAuthenticatedUserBetsAndWins() {
      this.loading = true;
      try {
        const response = await HttpApi.get('profile/infos/bets-wins');
        this.totalBetsAmount = response.data.totalBetsAmount;
        this.totalWinsAmount = response.data.totalWinsAmount;
        this.betssMinusWins = response.data.betssMinusWins;
      } catch (error) {
        console.error("Error fetching bets and wins", error);
        this.totalBetsAmount = 0;
        this.totalWinsAmount = 0;
        this.betssMinusWins = 0;
      } finally {
        this.loading = false;
      }
    },
  
    fetchAllData() { 
      this.fetchAuthenticatedUserBetsAndWins();
      this.fetchAuthenticatedUserBets();
    },

    formatCurrency(value) {
      return typeof value === 'number' ? value.toFixed(2) : '0.00';
    }
  }
};
</script>

<style>
.bordse {
    border-bottom-width: solid;
    border-bottom-width: 1px;
    border-color: var(--borders-and-dividers-colors);
}
.item-sub-color {
  background-color: var(--item-sub-color);
}
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

body {
  font-family: 'Helvetica', sans-serif;
}
.custom-font-text {
    font-family: 'Helvetica';
    font-size: 15px;
    color: var(--text-sub-color);
    font-weight: 400;
}
.custom-font-title {
    font-family: 'Helvetica', sans-serif;
    font-size: 13px;
    color: var(--title-sub-color);
    font-weight: 400;
}
</style>
