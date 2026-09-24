<template>
<div class="flex w-full flex-col mt-2 p-2">
  <div class="grid grid-cols-3 gap-3">
    <div class="flex flex-col items-center specific-item rounded-lg py-3 justify-center">
      <span class="specific-text">Adicionar membros diretos</span>
      <span class="specific-text-3 mt-2">{{ totalMembrosDiretos }}</span>
    </div>
    <div class="flex flex-col items-center specific-item rounded-lg py-3 justify-center">
      <span class="specific-text">Primeiros Depósitos</span>
      <span class="specific-text-3 mt-2">{{ firstDepositCount }}</span>
    </div>
    <div class="flex flex-col items-center specific-item rounded-lg py-3 justify-center">
      <span class="specific-text">Depósitos</span>
      <span class="specific-text-3 mt-2">{{ status1DepositsCount }}</span>
    </div>
    <div class="flex flex-col items-center specific-item rounded-lg py-3 justify-center">
      <span class="specific-text">Depósito</span>
      <span class="specific-text-3 mt-2">{{ totalDepositsAmount }}</span>
    </div>
    <div class="flex flex-col items-center specific-item rounded-lg py-3 justify-center">
      <span class="specific-text">Desempenho</span>
      <span class="specific-text-3 mt-2">{{ totalDepositsAmount }}</span>
    </div>
    <div class="flex flex-col items-center specific-item rounded-lg py-3 justify-center">
      <span class="specific-text">Comissão</span>
      <span class="specific-text-6 mt-2">{{ totalCommissions.toFixed(2).replace('.', ',') }}</span>
    </div>
  </div>
</div>

<div class="flex flex-col item-sub-color rounded-lg main-containere">
  <div class="headders w-full p-2 bordse">
    <span class="custom-font">Visão Geral dos Dados</span>
  </div>
  
  
  <div class="flex w-full p-2 justify-center items-center my-team-container">
    <span class="custom-font">Meu Time</span>
  </div>
  <div class="flex w-full p-2 bordiseres justify-center items-center my-team-container">
   <div class="grid grid-cols-3 gap-3">
     <div class="flex flex-col items-center py-3 justify-center specific-item-2 bording-right">
          <span class="custom-font-3">Tamanho da equipe</span>
           <span class="specific-text-2 mt-2">{{ tamanhoEquipe }}</span>
     </div>
      <div class="flex flex-col items-center py-3 justify-center specific-item-2 bording-right">
          <span class="custom-font-3">Membros Diretos</span>
           <span class="specific-text-2 mt-2">{{ totalMembrosDiretos }}</span>
     </div>
      <div class="flex flex-col items-center py-3 justify-center specific-item-2">
          <span class="custom-font-3">Outros Membros</span>
          <span class="specific-text-2 mt-2">{{ totalOutrosMembros }}</span>
     </div>
   </div>
  </div>

  <!-- Adicionamos uma classe personalizada chamada "my-team-container" -->
  <div class="flex w-full p-2 justify-center items-center my-team-container">
    <span class="custom-font">Desempenho</span>
  </div>
  <div class="flex w-full bordiseres p-2 bordse justify-center items-center my-team-container">
   <div class="grid grid-cols-3 gap-3">
     <div class="flex flex-col items-center py-3 justify-center specific-item-2 bording-right">
          <span class="custom-font-3">Rendimento Total</span>
           <span class="specific-text-2 mt-2">{{ totalDepositsAmount }}</span>
     </div>
      <div class="flex flex-col items-center py-3 justify-center specific-item-2 bording-right">
          <span class="custom-font-3">D. Direto</span>
           <span class="specific-text-2 mt-2">{{ totalDepositsAmountLevel1 }}</span>
     </div>
      <div class="flex flex-col items-center py-3 justify-center specific-item-2">
          <span class="custom-font-3">D. dos Outros</span>
          <span class="specific-text-2 mt-2">{{ totalDepositsAmountLevel2And3 }}</span>
     </div>
   </div>
  </div>

  <!-- Adicionamos uma classe personalizada chamada "my-team-container" -->
  <div class="flex w-full p-2 justify-center items-center my-team-container">
    <span class="custom-font">Comissão</span>
  </div>
  <div class="flex w-full bordiseres-2 p-2 justify-center items-center my-team-container">
   <div class="grid grid-cols-3 gap-3">
     <div class="flex flex-col items-center py-3 justify-center specific-item-2 bording-right">
          <span class="custom-font-3">Comissões Totais</span>
           <span class="specific-text-4 mt-2">{{ (totalCommissions + totalCommissionss).toFixed(2).replace('.', ',')  }}</span>
     </div>
      <div class="flex flex-col items-center py-3 justify-center specific-item-2 bording-right">
          <span class="custom-font-3">Comissão Direta</span>
           <span class="specific-text-4 mt-2">{{ totalCommissions.toFixed(2).replace('.', ',') || 0 }}</span>
     </div>
      <div class="flex flex-col items-center py-3 justify-center specific-item-2">
          <span class="custom-font-3">Outras Comissão</span>
          <span class="specific-text-4 mt-2">{{ totalCommissionss.toFixed(2).replace('.', ',')  }}</span> <!-- Adicionar novas refers até 3 referido-->
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
      validIndications: 0,
      loading: false,
      totalCommissions: 0,
      totalDepositsAmount: 0,
      totalOutrosMembros: 0,
      status1DepositsCount: 0,
      totalMembrosDiretos: 0,
      tamanhoEquipe: 0,
      indications: 0,
      totalDepositsAmountLevel2And3: 0,
      totalCommissionss: 0,
      totalDepositsAmountLevel1: 0,
      firstDepositCount: 0,

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
    fetchReferredUsersDeposits() {
      this.loading = true;
      HttpApi.get('profile/infos/referred-users-deposits') // Certifique-se de que o endpoint está correto
        .then(response => {
          if (response && response.data) {
            this.totalDepositsAmount = response.data.totalDepositsAmount;
            this.totalDepositsCount = response.data.totalDepositsCount;
            this.firstDepositCount = response.data.firstDepositCount;
              this.status1DepositsCount = response.data.status1DepositsCount;
            this.totalDepositsAmountLevel2And3 = response.data.totalDepositsAmountLevel2And3;
             this.totalDepositsAmountLevel1 = response.data.totalDepositsAmountLevel1;
            
           
          } else {
            this.totalDepositsAmount = 0;
            this.totalDepositsCount = 0;
              this.firstDepositCount = 0;
              this.status1DepositsCount = 0;
            this.totalDepositsAmountLevel2And3 = 0;
              this.totalDepositsAmountLevel1 = 0;
             
           
          }
        })
        .catch(error => {
          console.error("Error fetching referred users deposits: ", error);
          this.totalDepositsAmount = 0;
          this.totalDepositsCount = 0;
            this.firstDepositCount = 0;
            this.status1DepositsCount = 0;
          this.totalDepositsAmountLevel2And3 = 0;
           this.totalDepositsAmountLevel1 = 0;
           
        })
        .finally(() => {
          this.loading = false;
        });
    },

fetchEquipesInfosCompletas() {
      this.loading = true;
      HttpApi.get('profile/infos/equipes-infos') // Certifique-se de que o endpoint está correto
        .then(response => {
          if (response && response.data) {
            this.tamanhoEquipe = response.data.tamanhoEquipe;
            this.totalOutrosMembros = response.data.totalOutrosMembros;
            this.totalMembrosDiretos = response.data.totalMembrosDiretos;
            
          } else {
            this.tamanhoEquipe = 0;
            this.totalOutrosMembros = 0;
            this.totalMembrosDiretos = 0;
           
          }
        })
        .catch(error => {
          console.error("Error fetching equipes infos ", error);
          this.tamanhoEquipe = 0;
          this.totalOutrosMembros = 0;
          this.totalMembrosDiretos = 0;
          
        })
        .finally(() => {
          this.loading = false;
        });
      },

    
    fetchAllData() {
      this.fetchAffiliateCommissions();
      this.fetchReferredUsersDeposits();
      this.fetchEquipesInfosCompletas();
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

<style>
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
.bordiseres {
    border-top: 1px solid var(--borders-and-dividers-colors);
    border-bottom: 1px solid var(--borders-and-dividers-colors);
}
.bordiseres-2 {
    border-top: 1px solid var(--borders-and-dividers-colors);
   
}

.bording-right{
    border-right-width: solid;
    border-right-width: 1px;
    border-color: var(--borders-and-dividers-colors);
}
.btn-2 {
  padding-left: 10px;
  padding-right: 10px;
  padding-top: 2px;
  padding-bottom: 2px;
  color: var(--text-color);
  cursor: pointer;
  border: 1px solid var(--borders-and-dividers-colors);
  border-radius: 20px;
  transition: border-color 0.3s ease;
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
  font-size: 13px;
    color: var(--text-color)
}
.custom-font-title {
    font-family: 'Helvetica', sans-serif;
    font-size: 12px;
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
  font-family: 'Helvetica';
  font-style: normal;
  font-weight: 400;
  box-sizing: border-box;
  padding: 10px;
  width: 100%;
  text-align: center;
  min-height: 50px; /* Define uma altura mínima */
  display: flex;
  flex-direction: column;
  justify-content: center; /* Centraliza verticalmente */
  align-items: center; /* Centraliza horizontalmente */
  background: var(--item-sub-color)
}
  
.specific-item-2 {
  font-family: 'Helvetica';
     font-style: normal;
    font-weight: 400;
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
       font-size: 9px;
    font-weight: 400;
    color: var(--text-color);
    opacity: 70%;
}
.specific-text {
  font-family: 'Helvetica';
  font-style: normal;
  text-align: center;
  max-width: 100%;
  overflow-wrap: break-word;
  word-wrap: break-word;
  white-space: normal;
  font-size: 10px;
  font-weight: 700;
  font: bold;
  opacity: 85%;
}
.specific-text-3 {
   font-family: 'Helvetica';
     font-style: normal;
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
   font-family: 'Helvetica';
     font-style: normal;
  text-align: center;
  max-width: 100%;
  overflow-wrap: break-word;
  word-wrap: break-word;
  white-space: normal;
  font-size: 17px;
  color: var(--value-color-navtop);
  font-weight: 700;
  font: bold;
}
.specific-text-2 {
   font-family: 'Helvetica';
     font-style: normal;
  text-align: center;
  max-width: 100%;
  font-size: 13px;
  font-weight: 400;
  font: bold;
  overflow-wrap: break-word;
  word-wrap: break-word;
  white-space: normal;
}
.specific-text-4 {
   font-family: 'Helvetica';
     font-style: normal;
  text-align: center;
  max-width: 100%;
  font-size: 13px;
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