<template>
  <div class="w-full">
    <div v-if="loading" class="loading custom-font-title-dados">
      Buscando dados...
    </div>

    <div v-if="!loading">
      <div v-if="individualGuestDeposits.length">
        <div class="card-container">
          <div 
              v-for="(guest, index) in individualGuestDeposits" 
              :key="guest.id" 
              class="card item-sub-color"
          >
            <div class="flex justify-between">
              <div class="left-column">
                <h3 class="custom-font-text">
                  <strong class="custom-font-title">ID </strong> {{ guest.id }}
                  <i class="fa-sharp fa-light fa-copy text-yellow-300" @click="copyToClipboard(guest.id)" style="cursor: pointer;"></i>
                </h3>
                <h3 class="custom-font-text">
                  <strong class="custom-font-title">Depósito</strong> {{ formatCurrency(guest.deposits.status1) }}
                </h3>
                <h3 class="custom-font-text">
                  <strong class="custom-font-title">Apostas Válidas</strong> {{ formatCurrency(guest.orders.betsAlls) }}
                </h3>
             
              </div>
              <div class="right-column">
                <h3 class="custom-font-text">
                  <strong class="custom-font-title">Nº Apostas</strong> {{ guest.orders.numberBetsandWins }}
                </h3>
                  <h3 class="custom-font-text">
                  <strong class="custom-font-title">Time</strong> {{ guest.level }}  
                </h3>
                <h3 class="custom-font-text">
                  <strong class="custom-font-title">Nº Depósitos</strong> {{ guest.deposits.status1Count }}
                </h3>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div v-if="!individualGuestDeposits.length" class="no-data bigdata flex items-center justify-center">
        <div class="flex flex-col items-center">
          <img :src="`/assets/images/img_none_sj.webp`" alt="" class="w-auto h-auto max-h-[140px]">
          <h3 class="text-color custom-font-text">{{ $t('Sem registro') }}</h3>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import HttpApi from "@/Services/HttpApi.js";

export default {
  data() {
    return {
      individualGuestDeposits: [],
      loading: false,
    };
  },
  created() {
    this.fetchIndividualGuestDepositsAndWithdrawals();
  },
  methods: {
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
    copyToClipboard(id) {
      navigator.clipboard.writeText(id)
        .then(() => {
          alert('ID copiado: ' + id);
        })
        .catch(err => {
          console.error('Erro ao copiar: ', err);
        });
    },
    formatCurrency(value) {
      return new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format(value);
    }
  }
}
</script>

<style scoped>
.loading {
  font-family: 'Helvetica';
  color: var(--text-sub-color);
  text-align: center;
  font-size: 1.5em;
}

.card-container {
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
  margin: 8px;
}

.card {
  border: 1px solid var(--borders-and-dividers-colors);
  border-radius: 8px;
  padding: 8px;
  width: 100%;
  max-width: 440px;
  background-color: var(--background-color-cassino);
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.left-column, .right-column {
  flex: 1;
  display: flex;
  flex-direction: column;
}

.no-data {
  text-align: center;
  font-size: 1.2em;
  color: var(--text-color);
}

.bigdata {
  width: 100%;
  height: 100vh;
}

.custom-font-text {
  font-family: 'Helvetica';
  font-size: 15px;
  color: var(--text-sub-color);
}

.custom-font-title {
  font-family: 'Helvetica', sans-serif;
  font-size: 13px;
  color: var(--title-sub-color);
}

.back-sub-color {
  background-color: var(--back-sub-color);
}

body {
  font-family: 'Helvetica', sans-serif; 
}
</style>
