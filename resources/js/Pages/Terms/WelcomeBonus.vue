<template>
  <BaseLayout>
    <!-- Termos e Condições do Bônus de Boas-Vindas -->
    <div class="bonus-terms">
      <h2>Termos e Condições do Bônus de Boas-Vindas</h2>
      <ul>
        <li><strong>Elegibilidade</strong></li>
        <ul>
          <li>O Bônus de Boas-Vindas está disponível apenas para novos jogadores que se registrarem no Play Flare Bet pela primeira vez.</li>
          <li>Os jogadores devem ter pelo menos 18 anos de idade para serem elegíveis para o bônus.</li>
        </ul>

        <li><strong>Requisitos de Depósito</strong></li>
        <ul>
          <li>Para receber o Bônus de Boas-Vindas, os jogadores devem fazer um depósito mínimo de R$ 10,00 em suas contas.</li>
        </ul>

        <li><strong>Valor do Bônus</strong></li>
        <ul>
          <li>O valor do bônus será de 200% do valor do primeiro depósito, sem um valor máximo especificado.</li>
          <li>O bônus será creditado automaticamente na conta do jogador após o depósito qualificado.</li>
        </ul>

        <li><strong>Requisitos de Apostas</strong></li>
        <ul>
          <li>Antes de sacar quaisquer ganhos associados ao bônus, os jogadores devem cumprir os requisitos de apostas apropriados.</li>
          <li>Alguns jogos podem contribuir mais do que outros para os requisitos de apostas. Consulte os termos completos para obter detalhes.</li>
        </ul>

        <li><strong>Termos Gerais</strong></li>
        <ul>
          <li>Os jogadores devem ler e concordar com os Termos e Condições completos do Play Flare Bet antes de participar do Bônus de Boas-Vindas.</li>
          <li>O cassino se reserva o direito de alterar, suspender ou encerrar a oferta de bônus a qualquer momento, a seu critério.</li>
        </ul>
      </ul>
    </div>
  </BaseLayout>
</template>

<script>
import BaseLayout from "@/Layouts/BaseLayout.vue";

export default {
  components: { BaseLayout },
  data() {
    return {
      isLoading: false,
    };
  },
  setup(props) {
    return {};
  },
  computed: {},
  methods: {},
};
</script>

<style scoped>
.bonus-terms {
  margin-top: 20px;
  text-align: center;
}

.bonus-terms h2 {
  font-size: 24px;
  margin-bottom: 10px;
  text-align: center;
}

.bonus-terms ul {
  list-style-type: disc;
  margin-left: 20px;
  text-align: left;
}

.bonus-terms ul li {
  margin-bottom: 8px;
}
</style>
