<template>
  <div class="items-container custom-font">
    <!-- Botões de Período -->
    <div class="flex p-1 pl-2 mb-2 justify background-bottom-navigation bordas">
      <button
        class="btn-2"
        :class="{ 'actives': activePeriod === 'today' }"
        @click="setPeriod('today')"
      >
        {{ $t('Hoje') }}
      </button>
      <button
        class="btn-2 ml-2"
        :class="{ 'actives': activePeriod === 'week' }"
        @click="setPeriod('week')"
      >
        {{ $t('7 dias') }}
      </button>
      <button
        class="btn-2 ml-2"
        :class="{ 'actives': activePeriod === 'month' }"
        @click="setPeriod('month')"
      >
        {{ $t('30 dias') }}
      </button>
      <button
        class="btn-2 ml-2"
        :class="{ 'actives': activePeriod === 'year' }"
        @click="setPeriod('year')"
      >
        {{ $t('365 dias') }}
      </button>
    </div>

    <!-- Área de Rolagem para a Lista de Depósitos -->
    <div class="scroll-container">
      <!-- Mensagem de Nenhum Registro -->
      <div v-if="deposits.data.length === 0" class="flex flex-col items-center justify-center h-full w-full">
        <img :src="`/assets/images/img_none_sj.webp`" alt="" class="w-auto h-auto max-h-[140px]">
        <p class="text-color mt-1">Sem registro</p>
      </div>

      <!-- Lista de Depósitos (Deposits) -->
      <div v-if="!isLoading && deposits.data.length > 0" class="grid grid-cols-1 md:grid-cols-1 gap-2 w-full max-h-[60px]">
        <div v-for="(deposit, index) in deposits.data" :key="index" class="bordass rounded-lg p-2 ml-2 mr-2">
          <div class="flex items-center justify-between mb-1 mt-1">
            <p class="text-color flex justify items-center">
              <img src="/public/assets/images/pix_img.png" class="w-8 h-8 mr-2">
              <span class="uppercase font-bold text-[16px] text-color">{{ deposit.type }}</span>
            </p>
            <p class="text-color text-[16px] font-bold">
              {{ state.currencyFormat(parseFloat(deposit.amount), deposit.currency) }}
            </p>
          </div>
          <div class="flex items-center justify-between mb-2">
            <div>
              <p class="text-color">{{ formatDate(deposit.createdAt) }}</p>
            </div>
            <span v-if="deposit.status === 1" class="bg-green-500 text-yellow-300 text-xs font-medium px-2.5 py-0.5 rounded">
              {{ $t('Sucesso no depósito') }}
            </span>
            <span v-if="deposit.status === 0" class="bg-yellow-100 text-yellow-800 text-xs font-medium px-2.5 py-0.5 rounded">
              {{ $t('Aguardando Pagamento') }}
            </span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { format } from 'date-fns';
import { ptBR } from 'date-fns/locale'; // Importa o locale para o português
import HttpApi from "@/Services/HttpApi.js";

export default {
  data() {
    return {
      isLoading: false,
      deposits: { data: [] },
      activePeriod: 'today',    // Período ativo (hoje, semana, mês, ano)
    };
  },
  methods: {
    setPeriod(period) {
      this.activePeriod = period;
      this.fetchData();  // Recarrega os dados ao mudar o período de filtragem
    },
    fetchData() {
      this.getDeposits();
    },
    getDeposits() {
      this.isLoading = true;

      HttpApi.get(`wallet/deposit?filter=${this.activePeriod}`)
        .then((response) => {
          this.deposits = response.data.deposits;
          this.isLoading = false;
        })
        .catch((error) => {
          console.error('Error fetching deposits:', error);
          this.isLoading = false;
        });
    },
    formatDate(dateString) {
      const date = new Date(dateString);
      return format(date, "dd/MM HH:mm", { locale: ptBR });
    }
  },
  created() {
    this.fetchData(); // Carrega os dados inicialmente com o período padrão
  },
};
</script>

<style scoped>
.hide-overflow {
  overflow-y: auto;
  white-space: nowrap;
}

.active {
  border-bottom-width: 2px; 
  border-bottom-width: solid; 
  border-color: var(--background-itens-selected);
}



.btn {
  padding: 8px 8px;
  color: var(--text-color);
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease;
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
.actives {
  padding-left: 10px;
  padding-right: 10px;
  padding-top: 2px;
  padding-bottom: 2px;
  border-radius: 20px;
  border-width: 1px; 
  border-width: solid; 
  border-color: var(--background-itens-selected);
  transition: border-color 0.3s ease;
}


.btn-1 {
  padding: 4px 8px;
  color: var(--text-color);
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.btn-border-transparent-yellow {
  background-color: transparent;
  border: 1px solid #F9FD4E; /* Amarelo */
}

.btn-border-transparent-yellow:hover {
  background-color: #F9FD4E; /* Amarelo */
  color: #000; /* Cor do texto */
}

.btn-border-transparent-yellow-1 {
  border-radius: 5px;
  background-color: transparent;
  border: 1px solid #F9FD4E; /* Amarelo */
}

.btn-border-transparent-yellow-2 {
  margin-top: 4px;
  margin-bottom: 4px;
  background-color: transparent;
  border-bottom: 1px solid #F9FD4E; /* Amarelo */
}

.bordas {
  background-color: transparent;
  border-bottom-width: 1px; 
  border-bottom-width: solid; 
  border-color: var(--borders-and-dividers-colors);
}

.bordass {
  background-color: transparent;
  border-width: 1px; 
  border-width: solid; 
  border-color: var(--borders-and-dividers-colors);
  background-color: var(--card-transaction);
}

.items-container {
  margin-top: 48px;
  margin-bottom: 5px;
}

.fixed-buttons {
  position: sticky;
  top: 0;
  background: var(--background-bottom-navigation); /* Cor de fundo para destacar os botões */
  z-index: 40; /* Para garantir que os botões fiquem sobre outros conteúdos */
}

.scroll-container {
  height: calc(100vh - 90px); /* Ajuste de acordo com a altura dos botões */
  overflow-y: scroll; /* Habilita a rolagem vertical */
}

/* Esconde a barra de rolagem para navegadores WebKit */
.scroll-container::-webkit-scrollbar {
  width: 0;
  background: transparent;
}

/* Esconde a barra de rolagem para Firefox */
.scroll-container {
  scrollbar-width: none; /* Oculta a barra de rolagem */
}

/* Esconde a barra de rolagem para navegadores antigos do Edge e Internet Explorer */
.scroll-container {
  -ms-overflow-style: none; /* Oculta a barra de rolagem */
}
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

body {
  font-family: 'Helvetica', sans-serif; /* Define a fonte Helvetica para todo o documento */
}
.custom-font {
    font-family: 'Helvetica', sans-serif;
    font-size: 14px;
    color: var(--text-color);
}
</style>
