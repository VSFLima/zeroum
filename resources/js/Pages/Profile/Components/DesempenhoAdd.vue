<template>
  <div class="back-sub-color rounded-lg">
          <div class="flex w-full justify-center py-2 items-center bordse">
            <p class=" text-[14px] custom-font-title"> Informações dos subordinados</p>
          </div>
        <div class="p-1">
        <div class="grid grid-cols-3 gap-2">
          <div class="flex flex-col items-center py-4 rounded-lg item-sub-color">
            <p class="text-[12px] custom-font-title">{{ $t('Ganhos - Percas') }}</p>
            <p class="text-[12px] custom-font-title">{{ $t('dos indicados') }}</p>
            <p class="text-2xl custom-font-text"> R$ {{ betsMinusWins || 0 }}</p>
          </div>
          <div class="flex flex-col items-center py-4 rounded-lg item-sub-color">
            <p class="text-[12px] custom-font-title">{{ $t('Total de ganhos') }}</p>
            <p class="text-[12px] custom-font-title">{{ $t('dos indicados') }}</p>
            <p class="text-2xl custom-font-text"> R$ {{ totalWinsaff }}</p>
          </div>
          <div class="flex flex-col items-center py-4 rounded-lg item-sub-color">
            <p class="text-[12px] custom-font-title">{{ $t('Total de percas') }}</p>
            <p class="text-[12px] custom-font-title">{{ $t('dos indicados') }}</p>
            <p class="text-2xl custom-font-text"> R$ {{ totalBetsaff }}</p>
          </div>
          </div>
          </div>

          <div class="flex w-full py-2 bordec">
            <p class="  ml-2 text-[14px] custom-font-title"> Informações dos Depósitos</p>
          </div>
        <div class="p-1">
          <div class="grid gap-2">
            <div class="flex justify-between items-center relative py-2 rounded-lg item-sub-color">
              <p class="text-[12px] custom-font-title ml-3">{{ $t('Total de Depósitos') }}</p>
              <p class="text-[16px] font-bold text-color mr-3"> R$ {{ totalDepositsAmount }}</p>
            </div>


            <div class="flex justify-between relative items-center py-2 rounded-lg item-sub-color">
              <p class="text-[10px] custom-font-title ml-3">{{ $t('Numero de Depósitos pagos') }}</p>
              <p class="text-[16px] font-bold text-color mr-3">{{ status1DepositsCount || 0 }}</p>
              </div>
            <div class="flex justify-between relative items-center py-2 rounded-lg item-sub-color">
              <p class="text-[10px] custom-font-title ml-3">{{ $t('Numero de Depósitos criados') }}</p>
              <p class="text-[16px]  font-bold text-color mr-3">{{ totalDepositsCount || 0 }}</p> 
            </div>



            <div class="flex justify-between relative items-center py-2 rounded-lg item-sub-color">
              <p class="text-[12px] custom-font-title ml-3">{{ $t('Maior Depósitos') }}</p>
              <p class="text-[16px]  font-bold  text-color mr-3"> R$ {{ highestDeposit || 0 }}</p>
            </div>

            <div class="flex  justify-between relative items-center py-2 rounded-lg item-sub-color">
              <p class="text-[12px] custom-font-title ml-3">{{ $t('Menor Depósitos') }}</p>
              <p class="text-[16px]  font-bold text-color mr-3"> R$ {{ lowestDeposit || 0 }}</p>
            </div>
          </div>
       </div>



 <div class="flex w-full py-2 bordec">
            <p class="  ml-2 text-[14px] custom-font-title"> Informações dos Saques</p>
          </div>
        <div class="p-1">
          <div class="grid gap-2">
            <div class="flex justify-between items-center relative py-2 rounded-lg item-sub-color">
              <p class="text-[12px] custom-font-title ml-3">{{ $t('Total de Saques') }}</p>
              <p class="text-[16px] font-bold text-color mr-3"> R$ {{ totalWithdrawals }}</p>
            </div>


            <div class="flex justify-between relative items-center py-2 rounded-lg item-sub-color">
              <p class="text-[10px] custom-font-title ml-3">{{ $t('Numero de Saques pagos') }}</p>
              <p class="text-[16px] font-bold text-color mr-3">{{ statusOneWithdrawalsCount || 0 }}</p>
              </div>
            <div class="flex justify-between relative items-center py-2 rounded-lg item-sub-color">
              <p class="text-[10px] custom-font-title ml-3">{{ $t('Numero de Saques criados') }}</p>
              <p class="text-[16px]  font-bold text-color mr-3">{{ totalWithdrawalsCount || 0 }}</p> 
            </div>



            <div class="flex justify-between relative items-center py-2 rounded-lg item-sub-color">
              <p class="text-[12px] custom-font-title ml-3">{{ $t('Maior Saque') }}</p>
              <p class="text-[16px]  font-bold  text-color mr-3"> R$ {{ maxWithdrawal || 0 }}</p>
            </div>

            <div class="flex  justify-between relative items-center py-2 rounded-lg item-sub-color">
              <p class="text-[12px] custom-font-title ml-3">{{ $t('Menor Saque') }}</p>
              <p class="text-[16px]  font-bold text-color mr-3"> R$  {{ minWithdrawal || 0 }}</p>
            </div>
          </div>
       </div>

        </div>
       
   
<div v-if="activeTab === 'meudesempenho'" class="w-full max-w-[450px]">
        <div class="background-bottom-navigation rounded-lg">
          <div class="flex w-full justify-center py-2 items-center bordse">
            <p class=" text-[14px] custom-font-title"> Informações dos meus ganhos e percas</p>
          </div>
         <div class="p-1">
        <div class="grid grid-cols-3 gap-2">
          <div class="flex flex-col items-center py-4 rounded-lg item-sub-color">
            <p class="text-[12px] custom-font-title">{{ $t('Balanço Geral') }}</p>
            <p class="text-2xl custom-font-text"> R$ {{ betssMinusWins || 0 }}</p>
          </div>
          <div class="flex flex-col items-center py-4 rounded-lg item-sub-color">
            <p class="text-[12px] custom-font-title">{{ $t('Ganhos') }}</p>
            <p class="text-2xl custom-font-text"> R$ {{ totalWinsAmount || 0 }}</p>
          </div>
          <div class="flex flex-col items-center py-4 rounded-lg item-sub-color">
            <p class="text-[12px] custom-font-title">{{ $t('Percas') }}</p>
            <p class="text-2xl custom-font-text"> R$ {{ totalBetsAmount || 0 }}</p>
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
  components: { },
  data() {
    return {
      loading: false,
      totalBetsaff: 0,
      totalWinsaff: 0,
      totalDepositsAmount: 0,
      lowestDeposit: 0,
      highestDeposit: 0,
      betsMinusWins: 0,
      betssMinusWins: 0,
      totalWinsAmount: 0,
      totalBetsAmount: 0,
      minWithdrawal: 0,
      maxWithdrawal: 0,
      statusOneWithdrawalsCount: 0,
      totalWithdrawalsCount: 0,
      totalWithdrawals: 0,
      totalWithdrawalsCount: 0,
      totalDepositsCount: 0,
      status1DepositsCount: 0,

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
  async created() {
    this.fetchAllData();
    this.fetchIndividualGuestDepositsAndWithdrawals(); // Adicione esta linha
  if (this.isAuthenticated) {
    await this.getProfile();
    }
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
  methods: {
    isActive(route) {
      return this.$route.path === route;
    },
    fetchReferredUsersDeposits() {
      this.loading = true;
      HttpApi.get('profile/infos/referred-users-deposits') // Certifique-se de que o endpoint está correto
        .then(response => {
          if (response && response.data) {
            this.totalDepositsAmount = response.data.totalDepositsAmount;
            this.lowestDeposit = response.data.lowestDeposit;
            this.highestDeposit = response.data.highestDeposit;
            this.totalDepositsCount = response.data.totalDepositsCount;
            this.status1DepositsCount = response.data.status1DepositsCount;

          } else {
            this.totalDepositsAmount = 0;
             this.lowestDeposit = 0;
            this.highestDeposit = 0;
            this.totalDepositsCount = 0;
            this.status1DepositsCount = 0;
          }
        })
        .catch(error => {
          console.error("Error fetching referred users deposits: ", error);
          this.totalDepositsAmount = 0;
            this.lowestDeposit = 0;
          this.highestDeposit = 0;
          this.totalDepositsCount = 0;
           this.status1DepositsCount = 0;
           
        })
        .finally(() => {
          this.loading = false;
        });
    },
     async fetchIndividualGuestDepositsAndWithdrawals() {
      this.loading = true;
      try {
        const response = await HttpApi.get('profile/infos/individual-guest-deposits-withdrawals');
        const data = response.data;

        this.individualGuestDeposits = data.guests.map(guest => ({
          name: guest.name,
          id: guest.id,
          level: this.getLevelLabel(guest.level),
          deposits: {
            status1: guest.deposits.status1,
            status1Count: guest.deposits.status1Count
          },
          withdrawals: {
            status1: guest.withdrawals.status1,
          },
          orders: {
            totalBets: guest.orders.totalBets,
            totalWins: guest.orders.totalWins,
            betsMinuusWins: guest.orders.betsMinuusWins,
            betsAlls: guest.orders.betsAlls,
            numberBetsandWins: guest.orders.numberBetsandWins
          },
        }));
      } catch (error) {
        console.error("Error fetching individual guest deposits and withdrawals: ", error);
        this.individualGuestDeposits = [];
      } finally {
        this.loading = false;
      }
    },
    getLevelLabel(level) {
      switch (level) {
        case 'level1':
          return 'Convidado Direto';
        case 'level2':
          return 'Sub-Convidado';
        case 'level3':
          return 'Sub-Sub-Convidado';
        default:
          return 'Desconhecido';
      }
    },
    fetchReferredUsersBetsAndWins() {
      this.loading = true;
      HttpApi.get('profile/infos/referred-bets-wins') // Certifique-se de que o endpoint está correto
        .then(response => {
          if (response && response.data) {
            this.totalBetsaff = response.data.totalBetsaff;
            this.totalWinsaff = response.data.totalWinsaff;
             this.betsMinusWins = response.data.betsMinusWins;
          } else {
            this.totalBetsaff = 0;
            this.totalWinsaff = 0;
             this.betsMinusWins = 0;
          }
        })
        .catch(error => {
          console.error("Error fetching referred users bets ", error);
          this.totalBetsaff = 0;
          this.totalWinsaff = 0;
            this.betsMinusWins = 0;
        })
        .finally(() => {
          this.loading = false;
        });
    },

 fetchAffiliateCommissions() {
      this.loading = true;
      HttpApi.get('profile/infos/affiliate-commissions') // Certifique-se de que o endpoint está correto
        .then(response => {
          if (response && response.data) {
            this.totalCommissions = response.data.totalCommissions;
          } else {
            this.totalCommissions = 0;
          }
        })
        .catch(error => {
          console.error("Error fetching affiliate commissions: ", error);
          this.totalCommissions = 0;
        })
        .finally(() => {
          this.loading = false;
        });
    },


    fetchAuthenticatedUserBetsAndWins() {
      this.loading = true;
      HttpApi.get('profile/infos/bets-wins') // Certifique-se de que o endpoint está correto
        .then(response => {
          if (response && response.data) {
            this.totalBetsAmount = response.data.totalBetsAmount;
            this.totalWinsAmount = response.data.totalWinsAmount;
             this.betssMinusWins = response.data.betssMinusWins;
          } else {
            this.totalBetsAmount = 0;
            this.totalWinsAmount = 0;
             this.betssMinusWins = 0;
          }
        })
        .catch(error => {
          console.error("Error fetching referred users bets ", error);
          this.totalBetsAmount = 0;
          this.totalWinsAmount = 0;
            this.betssMinusWins = 0;
        })
        .finally(() => {
          this.loading = false;
        });
    },
    fetchReferredUsersWithdrawals() {
      this.loading = true;
      HttpApi.get('profile/infos/referred-withdrawals') // Certifique-se de que o endpoint está correto
        .then(response => {
          if (response && response.data) {
            this.totalWithdrawals = response.data.totalWithdrawals;
            this.totalWithdrawalsCount = response.data.totalWithdrawalsCount;
            this.statusOneWithdrawalsCount = response.data.statusOneWithdrawalsCount;
            this.maxWithdrawal = response.data.maxWithdrawal;
            this.minWithdrawal = response.data.minWithdrawal;
            
           
          } else {
            this.totalWithdrawals = 0;
            this.totalWithdrawalsCount = 0;
            this.statusOneWithdrawalsCount = 0;
             this.maxWithdrawal = 0;
            this.minWithdrawal = 0;
             
           
          }
        })
        .catch(error => {
          console.error("Error fetching referred users deposits: ", error);
          this.totalWithdrawals = 0;
           this.totalWithdrawalsCount = 0;
          this.statusOneWithdrawalsCount = 0;
            this.maxWithdrawal = 0;
          this.minWithdrawal = 0;
           
        })
        .finally(() => {
          this.loading = false;
        });
    },
    
    fetchAllData() {
      this.fetchAffiliateCommissions();
      this.fetchReferredUsersDeposits();
      this.fetchReferredUsersBetsAndWins();
      this.fetchAuthenticatedUserBetsAndWins();
      this.fetchReferredUsersWithdrawals();
    },
    formatCurrency(value) {
      if (typeof value === 'number') {
        return value.toFixed(2);
      } else {
        return '0.00';
      }
    }
  }
};
</script>

<style scoped>
.loading {
  text-align: center;
  font-size: 1.2em;
  color: var(--);
}

.bordse{
    border-bottom-width: solid;
    border-bottom-width: 1px;
    border-color: var(--borders-and-dividers-colors);
}

.bordec{
  border-bottom-width: solid;
  border-bottom-width: 1px;
  border-color: var(--borders-and-dividers-colors);
}
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

body {
  font-family: 'Helvetica', sans-serif; /* Define a fonte Helvetica para todo o documento */
}
.custom-font-text {
    font-family: 'Helvetica';
    font-size: 15px;
    color: var(--text-sub-color);
     font-style: normal;
    font-weight: 400;
}
.custom-font{
    font-family: 'Helvetica';
     font-style: normal;
    font-weight: 400;
    color: var(--text-color)
}
.custom-font-title {
    font-family: 'Helvetica', sans-serif;
    font-size: 13px;
    color: var(--title-sub-color);
     font-style: normal;
    font-weight: 400;
}
.back-sub-color{
  background-color: var(--back-sub-color);
}
.item-sub-color{
  background-color: var(--item-sub-color);
}
.specific-item {
 box-sizing: border-box;
  padding: 10px;
  width: 100%;
  text-align: center;
  min-height: 95px; /* Define uma altura mínima */
  display: flex;
  flex-direction: column;
  justify-content: center; /* Centraliza verticalmente */
  align-items: center; /* Centraliza horizontalmente */
  background: var(--item-sub-color)
}
.specific-item-2 {
 box-sizing: border-box;
  padding: 10px;
  width: 100%;
  text-align: center;
  min-height: 50px; /* Define uma altura mínima */
  display: flex;
  flex-direction: column;
  justify-content: center; /* Centraliza verticalmente */
  align-items: center; /* Centraliza horizontalmente */
}
.custom-font-3{
    font-family: 'Helvetica';
     font-style: normal;
       font-size: 11px;
    font-weight: 400;
    color: var(--text-color)
}

.specific-text {
  text-align: center;
  max-width: 100%;
  overflow-wrap: break-word;
  word-wrap: break-word;
  white-space: normal;
  font-size: 13px;
}
.specific-text-3 {
  text-align: center;
  max-width: 100%;
  overflow-wrap: break-word;
  word-wrap: break-word;
  white-space: normal;
  font-size: 20px;
  font-weight: 700;
  font: bold;
}
.specific-text-6 {
  text-align: center;
  max-width: 100%;
  overflow-wrap: break-word;
  word-wrap: break-word;
  white-space: normal;
  font-size: 20px;
  color: var(--value-color-navtop);
  font-weight: 700;
  font: bold;
}
.specific-text-2 {
  text-align: center;
  max-width: 100%;
  font-size: 16px;
  font-weight: 400;
  font: bold;
  overflow-wrap: break-word;
  word-wrap: break-word;
  white-space: normal;
}
.specific-text-4 {
  text-align: center;
  max-width: 100%;
  font-size: 16px;
  font-weight: 400;
  font: bold;
  color: var(--value-color-navtop);
  overflow-wrap: break-word;
  word-wrap: break-word;
  white-space: normal;
}
.my-team-container {
  margin-left: 10px; /* Espaçamento da borda esquerda */
  margin-right: 10px; /* Espaçamento da borda direita */
  width: auto; /* Garante que a largura seja ajustada automaticamente */
}
.bordas {
  background-color: transparent;
  border-bottom-width: 1px; 
  border-bottom-width: solid; 
  border-color: var(--borders-and-dividers-colors);
}
.main-containere {
  margin: 10px; /* Adiciona 20px de espaço ao redor do contêiner */
}
.overflow-containeres {
  overflow-x: auto; /* Permite rolagem horizontal */
  -ms-overflow-style: none;  /* Remove a barra de rolagem no IE e no Edge */
  scrollbar-width: none;  /* Remove a barra de rolagem no Firefox */
}

.overflow-containeres::-webkit-scrollbar {
  display: none; /* Remove a barra de rolagem no Chrome, Safari e Opera */
}

.scroll-buttons {
  display: flex;
  white-space: nowrap; /* Impede que os botões quebrem de linha */
}

</style>
