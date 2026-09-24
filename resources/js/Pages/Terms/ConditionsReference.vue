<template>
  <BaseLayout>
    <!-- Termos e Condições de Referência do Play Flare Bet -->
    <div class="referral-terms">
      <h2>Termos e Condições de Referência do Play Flare Bet</h2>
      <p><strong>Elegibilidade:</strong></p>
      <ul>
        <li>O programa de referência está disponível para todos os jogadores registrados no Play Flare Bet.</li>
        <li>Os jogadores devem ter pelo menos 18 anos de idade para participar do programa de referência.</li>
      </ul>

      <p><strong>Como Funciona:</strong></p>
      <ul>
        <li>Os jogadores podem participar do programa de referência convidando novos jogadores para se registrarem no Play Flare Bet usando seu link de referência exclusivo.</li>
        <li>O jogador que se registra usando o link de referência receberá um bônus de boas-vindas de acordo com os termos e condições do cassino.</li>
        <li>O jogador que se refere receberá um bônus de referência quando o jogador referido cumprir os requisitos de elegibilidade e realizar um depósito qualificado.</li>
      </ul>

      <p><strong>Bônus de Referência:</strong></p>
      <ul>
        <li>O bônus de referência será creditado na conta do jogador que se refere após o jogador referido cumprir os requisitos de elegibilidade e realizar um depósito qualificado.</li>
        <li>O valor do bônus de referência pode variar e está sujeito aos termos e condições específicos do programa de referência.</li>
      </ul>

      <p><strong>Requisitos e Restrições:</strong></p>
      <ul>
        <li>Para ser elegível para o bônus de referência, o jogador referido deve se registrar usando o link de referência exclusivo e cumprir os requisitos de depósito e elegibilidade.</li>
        <li>Os jogadores não podem se referir a si mesmos ou criar múltiplas contas para se beneficiarem do programa de referência de forma inadequada.</li>
        <li>O Play Flare Bet reserva o direito de modificar, suspender ou encerrar o programa de referência a qualquer momento, a seu critério.</li>
      </ul>

      <p><strong>Responsabilidades do Jogador:</strong></p>
      <ul>
        <li>Os jogadores são responsáveis por cumprir todas as leis e regulamentos locais relacionados ao programa de referência e ao uso do link de referência.</li>
        <li>Os jogadores concordam em usar o programa de referência de forma ética e não fraudulenta.</li>
      </ul>

      <p><strong>Alterações nos Termos:</strong></p>
      <ul>
        <li>O Play Flare Bet se reserva o direito de alterar ou atualizar os Termos e Condições de Referência a qualquer momento, sem aviso prévio.</li>
        <li>Os jogadores serão notificados de quaisquer alterações significativas nos Termos e Condições de Referência através do site ou por outros meios apropriados.</li>
      </ul>

      <p>Ao participar do programa de referência do Play Flare Bet, você concorda com estes Termos e Condições de Referência. Se tiver dúvidas ou preocupações, entre em contato conosco.</p>
    </div>
  </BaseLayout>
</template>

<script>
import BaseLayout from "@/Layouts/BaseLayout.vue";

export default {
  props: [],
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
.referral-terms {
  margin: 20px auto;
  max-width: 800px;
  text-align: left;
}

.referral-terms h2 {
  font-size: 24px;
  margin-bottom: 10px;
}

.referral-terms p, .referral-terms ul, .referral-terms li {
  margin-bottom: 8px;
}
</style>
