<template>
  <BaseLayout>
    <!-- Política de Privacidade do Play Flare Bet -->
    <div class="privacy-policy">
      <h2>Política de Privacidade do Play Flare Bet</h2>
      <p>
        Esta Política de Privacidade descreve como o Play Flare Bet coleta, usa e protege as informações que você fornece ao usar nosso site e serviços. Ao acessar ou usar o Play Flare Bet, você concorda com os termos desta política.
      </p>
      <h3>Informações Coletadas</h3>
      <ul>
        <li><strong>Informações Pessoais:</strong> Podemos coletar informações pessoais, como nome, endereço de e-mail, número de telefone e informações de pagamento ao se registrar em nossa plataforma ou ao fazer transações conosco.</li>
        <li><strong>Informações de Uso:</strong> Podemos coletar informações sobre o seu uso do site, como páginas visitadas, tempo de permanência, dispositivos utilizados e atividades de jogo.</li>
        <li><strong>Cookies:</strong> Podemos usar cookies e tecnologias semelhantes para melhorar sua experiência no site, personalizar conteúdos e anúncios, e analisar o desempenho do site.</li>
      </ul>

      <h3>Uso das Informações</h3>
      <p>
        Utilizamos as informações coletadas para fornecer e melhorar nossos serviços, processar transações, personalizar sua experiência, enviar comunicações relacionadas ao cassino e garantir a segurança e integridade do site.
      </p>
      <p>
        Podemos usar suas informações para fins de marketing, como o envio de promoções e ofertas especiais, mas você pode optar por não receber essas comunicações a qualquer momento.
      </p>

      <h3>Compartilhamento de Informações</h3>
      <p>
        Não compartilhamos suas informações pessoais com terceiros, exceto quando necessário para fornecer nossos serviços (por exemplo, processadores de pagamento) ou quando exigido por lei.
      </p>
      <p>
        Podemos compartilhar informações não pessoais de forma agregada e anônima para fins de análise e relatórios.
      </p>

      <h3>Segurança das Informações</h3>
      <p>
        Implementamos medidas de segurança para proteger suas informações contra acesso não autorizado, uso indevido, alteração ou destruição.
      </p>
      <p>
        No entanto, nenhum método de transmissão pela Internet ou armazenamento eletrônico é 100% seguro, e não podemos garantir a segurança absoluta das informações.
      </p>

      <h3>Acesso e Controle de Suas Informações</h3>
      <p>
        Você pode acessar, revisar e atualizar suas informações pessoais através da sua conta no Play Flare Bet.
      </p>
      <p>
        Você pode optar por não receber comunicações de marketing nossas ao entrar em contato conosco ou através das configurações da sua conta.
      </p>

      <h3>Alterações nesta Política</h3>
      <p>
        Esta Política de Privacidade pode ser atualizada periodicamente. Quaisquer alterações significativas serão notificadas através do site ou por outros meios apropriados.
      </p>
      <p>
        Ao continuar a usar o Play Flare Bet após as alterações nesta política, você concorda com as novas práticas de privacidade. Se tiver dúvidas sobre esta política ou sobre suas informações, entre em contato conosco.
      </p>
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
.privacy-policy {
  margin: 20px auto;
  max-width: 800px;
  text-align: left;
}

.privacy-policy h2 {
  font-size: 24px;
  margin-bottom: 10px;
}

.privacy-policy h3 {
  font-size: 20px;
  margin-top: 20px;
  margin-bottom: 10px;
}

.privacy-policy ul {
  list-style-type: disc;
  margin-left: 20px;
}

.privacy-policy p {
  margin-bottom: 8px;
}
</style>