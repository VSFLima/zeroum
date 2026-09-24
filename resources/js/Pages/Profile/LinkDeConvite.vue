<template>
  <ConviteLayout>
   <nav class="fixed top-10 background-bottom-navigation bordec z-40 pl-2 pr-2 w-full max-w-[450px] h-12">
        <div class="container mx-auto flex overflow-x-auto whitespace-nowrap hide-scrollbar custom-font-title h-12">
          <button @click="activateTab('convite')" :class="['btn-nav', { active: activeTab === 'convite' }]" ref="conviteBtn">
  {{ $t('Link de Convite') }}
</button>
<button @click="activateTab('meusdados')" :class="['btn-nav', { active: activeTab === 'meusdados' }]" ref="meusdadosBtn">
  {{ $t('Meus Dados') }}
</button>
<button @click="activateTab('desempenho')" :class="['btn-nav', { active: activeTab === 'desempenho' }]" ref="desempenhoBtn">
  {{ $t('Desempenho') }}
</button>
<button @click="activateTab('subordinados')" :class="['btn-nav', { active: activeTab === 'subordinados' }]" ref="subordinadosBtn">
  {{ $t('Subordinados') }}
</button>
<button @click="activateTab('meudesempenho')" :class="['btn-nav', { active: activeTab === 'meudesempenho' }]" ref="meudesempenhoBtn">
  {{ $t('Meu desempenho') }}
</button>

        </div>
      </nav>
    <div class="flex flex-col birusy"> 
     <!-- sessao UM --> 
      <div v-if="activeTab === 'convite'"  class="p-2">
      <div class="flex flex-col justify-between rounded-lg background-bottom-navigation p-2">
           <div class="promo-info">
      <div class="promo-content">
        <div class="promo-left">
          <div class="qr-save-container">
             <qrcode-vue ref="qrcode" :value="referencelink"  :size="85"></qrcode-vue>
            <button @click="downloadQRCode" class="save-btn">Salve</button>
          </div>
        </div>
        <div class="promo-right">
          <div class="link-section top-0">
            <div class="link-text">URL do convite</div>
            <div class="link-input">
              <div class="link-display text-color">
                <div class="link-content">
                  {{ referencelink }}
                </div>
                <button class="copy-btn" @click="copyToClipboard(referencelink)"><i class="far fa-copy"></i></button>
              </div>
            </div>
          </div>
          <div class="info-section flex flex-col">
    <span> Convidados diretos: <span class="number"> {{ indications }} </span></span>
    <span> Código de Convite: <span class="number"> {{ referencecode }} </span>
      <button class="copy-btn-id" @click="copyToClipboard(referencecode)"><i class="far fa-copy"></i></button>
    </span>
      <span> Convidados válidos: <span class="number"> {{ validIndications }} </span>
      </span>
  </div>
        </div>
      </div>
     <div class="share-icons scroll-container">
    <div class="share-item">
        <div class="icon-circle">
            <a :href="referencelink" target="_blank" rel="noopener noreferrer" class="">
                <i class="fa-regular fa-share-from-square"></i>
            </a>
        </div>
        <span  class="text-color">Compartilhe</span>
    </div>
    <div class="share-item">
        <a :href="'https://www.facebook.com/sharer/sharer.php?u=' + referencelink" target="_blank" rel="noopener noreferrer" class="">
            <i class="fab fa-facebook text-blue-500 text-4xl"></i>
        </a>
        <span class="text-color">Facebook</span>
    </div>
    <div class="share-item">
        <a :href="'https://www.instagram.com/direct/inbox/'" target="_blank" rel="noopener noreferrer" class="">
            <i class="fab fa-telegram text-blue-500 text-4xl"></i>
        </a>
        <span class="text-color">Telegram</span>
    </div>
    <div class="share-item">
        <a :href="'https://www.instagram.com/sharer.php?u=' + referencelink" target="_blank" rel="noopener noreferrer" class="">
            <i class="fab fa-instagram text-pink-500 text-4xl"></i>
        </a>
        <span class="text-color">Instagram</span>
    </div>
    <div class="share-item">
        <a :href="'https://api.whatsapp.com/send?text=' + referencelink" target="_blank" rel="noopener noreferrer" class="">
            <i class="fab fa-whatsapp text-green-500 text-4xl"></i>
        </a>
        <span class="text-color">Whatsapp</span>
    </div>
    <div class="share-item">
        <a :href="'https://twitter.com/intent/tweet?url=' + referencelink" target="_blank" rel="noopener noreferrer" class="">
            <i class="fab fa-twitter text-blue-400 text-4xl"></i>
        </a>
        <span class="text-color">Twitter</span>
    </div>
</div>

    </div>
     </div>
     

      <div class="flex w-full flex-col mt-2">
        <span class="custom-font font-bold text-[20px] p-2"> Rede do Agente</span>
        <div class="flex w-full flex-col mt-2 p-3 background-bottom-navigation bordiasc rounded-lg">
          <div class="flex w-full flex-cols-2">
            <div class="flex items-center p-3">
              <img src="/public/assets/images/caa.png" class="p-2 w-[60px] h-[60px]">
          </div>
          <div class="flex flex-col">
            <span class="text-color text-[14px]">Desempenho total 28500 <span class="text-color text-[14px]">Comissões Totais </span><span class="custom-font-title text-[14px]">225</span></span>
            <span class="text-color text-[14px]">D. Direto 5500</span>
            <span class="text-color text-[14px]">Retorno de Comissão 3% Comissão Direta <span class="custom-font-title text-[14px]">165</span></span>
            <span class="text-color text-[14px]">D. dos Outros 3000</span>
            <span class="text-color text-[14px]">Comissão escalonada 2% outra comissão <span class="custom-font-title text-[14px]">60</span></span>
          </div>
          </div>
        </div>

        <div class="flex w-full flex-col mt-2 rounded-lg">
          <RolesComission />
        </div>

       <div class="custom-font-text flex w-full flex-col mt-2 p-3 background-bottom-navigation rounded-lg">
    <h2><strong>Exemplo de Cálculo de Comissões</strong></h2>

    <p>Suponha que as apostas efetivas atuais de 0 a 10.000 receberão uma comissão de 100 (ou seja, 1%) para cada 10.000, e as apostas efetivas acima de 10.000 receberão uma comissão de 300 para cada 10.000 (ou seja, 3%). A foi o primeiro a descobrir oportunidades de negócios neste site e imediatamente desenvolveu B1, B2 e B3. B1 desenvolveu ainda mais C1 e C2. B2 desenvolveu sem subordinados, e B3 desenvolveu o relativamente poderoso C3. No segundo dia, a aposta efetiva de B1 é 500, a aposta efetiva de B2 é 3.000, a aposta efetiva de B3 é 2.000, a aposta efetiva de C1 é 1.000, a aposta efetiva de C2 é 2.000 e a aposta efetiva de C3 é de até 20.000.</p>

    <h3>Método de Cálculo da Renda</h3>
    <p>O cálculo das comissões para cada indivíduo na hierarquia é o seguinte:</p>
    
    <ul>
        <li><strong>Comissão de B1</strong> (contribuições diretas de C1 e C2) = (1000 + 2000) * 1% = <span class="custom-font-title">30</span></li>
        <li><strong>Comissão de B2</strong> (sem subordinados) = (0 + 0) * 1% = <span class="custom-font-title">0</span></li>
        <li><strong>Comissão de B3</strong> (contribuição direta de C3) = 20.000 * 3% = <span class="custom-font-title">600</span></li>
    </ul>

    <p>Além das contribuições dos subordinados diretos B1, B2 e B3, a comissão de A também advém das contribuições dos demais subordinados C1, C2 e C3, conforme segue:</p>

    <ul>
        <li><strong>Comissão direta de A</strong> (contribuições diretas de B1, B2 e B3) = (500 + 3000 + 2000) * 3% = <span class="custom-font-title">165</span></li>
        <li><strong>Outras comissões de A</strong> (das contribuições de C1, C2) = (1000 + 2000) * 2% = <span class="custom-font-title">60</span></li>
        <li><strong>Comissão total de A</strong> (direto + outro) = 165 + 60 = <span class="custom-font-title">225</span></li>
    </ul>

    <h3>Resumo de Termos</h3>

    <h4>Equipe Direta</h4>
    <p>Refere-se aos subordinados desenvolvidos diretamente por A, ou seja, o primeiro nível de relacionamento com A, denominados coletivamente como equipe direta.</p>

    <h4>Outras Equipes</h4>
    <p>Refere-se àquelas que são desenvolvidas por subordinados de A. Possuem relacionamento de segundo nível com A ou superior, ou seja, subordinados de subordinados, e os subordinados dos subordinados, etc., coletivamente referidos como outras equipes. Como esse modelo de agência pode desenvolver subordinados ilimitados, para conveniência da explicação, este artigo toma apenas a estrutura de 2 níveis como exemplo.</p>

    <h3>Descrição de Desempenho</h3>

    <h4>Descrição de A</h4>
    <p>O desempenho direto de A é 5.500 e o outro desempenho é 20.000 (devido ao poder de C3). O desempenho total é 28.500 e a comissão correspondente à taxa é de 3%. Como B1 tem um desempenho total de 3.000 e desfruta de um desconto de apenas 1%, enquanto A tem um desempenho total de 28.500 e desfruta de uma taxa de desconto de 3%, haverá uma diferença de desconto entre A e B1. A diferença é: 3% - 1% = 2%. Essa diferença é a parte contribuída por C1 e C2 para A. Assim, C1 e C2 contribuem para A: (1000 + 2000) * 2% = 60. Não há diferença extrema entre A e B3, então C3 contribui para A, e a comissão de contribuição é 0.</p>

    <h4>Descrição de B1</h4>
    <p>B1 tem subordinados C1 e C2. Como o desempenho direto é 3.000, o índice de desconto correspondente é de 1%.</p>

    <h4>Explicação de B2</h4>
    <p>B2 pode ser preguiçoso e não se beneficiará se não desenvolver seus subordinados.</p>

    <h4>Explicação de B3</h4>
    <p>Embora B3 tenha aderido relativamente tarde e seja subordinado de A, seu subordinado C3 é muito poderoso e tem um desempenho direto de 20.000, permitindo que B3 diretamente desfrute de comissões mais elevadas. A proporção é de 3%.</p>

    <h3>Resumo das Regras</h3>
    <p>Não importa quando você ingressa, de quem você é subordinado, ou em que nível você está, sua renda nunca será afetada e você não sofrerá mais as perdas dos subordinados dos outros. O desenvolvimento não é restrito. Este é um modelo de agência absolutamente justo e imparcial, e ninguém estará sempre por baixo só porque entrou tarde.</p>
</div>



      </div>
       </div>

      <div v-if="activeTab === 'meusdados'" class="w-full max-w-[450px] back-sub-color h-screen">

        <MeusDados />
      </div>
      

     <!-- sessao DOIS -->
      <div v-if="activeTab === 'desempenho'" class="w-full max-w-[450px] back-sub-color h-screen">
        <DesempenhoAdd />
         </div>
   
<div v-if="activeTab === 'meudesempenho'" class="w-full max-w-[450px] back-sub-color p-2 h-screen">
       <MeuDesempenho />
        </div>
       

        <!-- sessao TRES -->
      <div v-if="activeTab === 'subordinados'" class="w-full max-w-[450px] back-sub-color h-screen">

        <CardListSubordinados />
      </div>

    </div>
  </ConviteLayout>
</template>


<script>
import CardListSubordinados from './Components/CardListSubordinados.vue';
import ConviteLayout from '@/Layouts/ConviteLayout.vue';
import HttpApi from "@/Services/HttpApi.js";
import { useSettingStore } from "@/Stores/SettingStore.js";
import { useAuthStore } from "@/Stores/Auth.js";
import RolesComission from './Components/RolesComission.vue';
import MeusDados from './Components/MeusDados.vue';
import DesempenhoAdd from './Components/DesempenhoAdd.vue';
import MeuDesempenho from './Components/MeuDesempenho.vue';
import QrcodeVue from 'qrcode.vue';


export default {
  components: { ConviteLayout, CardListSubordinados, RolesComission, MeusDados, DesempenhoAdd, MeuDesempenho, QrcodeVue },
  data() {
    return {
      activeTab: 'convite', // Define a aba inicial como 'convite'
      referencecode: '',
      referencelink: '',
      validIndications: 0,
      loading: false,
  
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
   mounted() {
    this.updateActiveTabFromRoute();
  },
  async created() {
    this.getCode();
    if (this.isAuthenticated) {

    }
  },
   watch: {
    '$route.query.tab': 'updateActiveTabFromRoute'
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
    copyToClipboard(text) {
      navigator.clipboard.writeText(text).then(
        () => {
          console.log("Text copied to clipboard");
        },
        (err) => {
          console.error("Could not copy text: ", err);
        }
      );
    },
     downloadQRCode() {
    const qrCodeElement = this.$refs.qrcode.$el; // Obtém o elemento do QR code
    const qrCodeDataURL = qrCodeElement.toDataURL(); // Converte o QR code em uma URL de dados

    const downloadLink = document.createElement('a');
    downloadLink.href = qrCodeDataURL;
    downloadLink.download = 'qrcode.png'; // Nome do arquivo a ser salvo
    downloadLink.click();
   
    },
    getCode() {
      HttpApi.get('profile/affiliates/')
        .then(response => {
          if (response.data.code) {
            this.referencecode = response.data.code;
            this.referencelink = response.data.url;
          }
          this.indications = response.data.indications;
          this.validIndications = response.data.validIndications;
          this.totalBauValue = response.data.total_bau_value;
        })
        .catch(error => {
          console.error("Error fetching code: ", error);
        });
    },
  updateActiveTabFromRoute() {
      const tab = this.$route.query.tab;
      if (tab) {
        this.activeTab = tab;
      }
    },
   activateTab(tab) {
  this.activeTab = tab;
  this.$nextTick(() => {
    const activeButton = this.$refs[`${tab}Btn`];
    if (activeButton) {
      activeButton.scrollIntoView({ behavior: 'smooth', inline: 'center' });
    }
  });
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
.promo-content {
    display: flex;
    justify-content: space-between;
    align-items: center;
}
.promo-left {
    margin-left: 8px;
    display: flex;
    flex-direction: column;
    align-items: center;
    height: 100%;
}
.promo-left img {
    width: 75px;
    height: 75px;
    margin-bottom: 10px;
}
.qr-save-container {
    display: flex;
    flex-direction: column;
    align-items: center;
}
.qr-save-container img {
    width: 65px;
    height: 68px;
    display: block;
    margin-bottom: 0;
    border-radius: 7px 7px 0px 0px;
    border: 5px solid #ffffff;
}
.save-btn i {
    margin-right: 5px;
}
.save-btn {
    background-color: #a00bc6;
    color: var(--text-color);
    font-size: 12px;
    border: none;
    padding: 2px 0;
    border-radius: 0px 0px 8px 8px;
    cursor: pointer;
    width: 85px;
    height: 30px;
    text-align: center;
    display: block;
    margin-top: 0px;
}
.promo-info {
    display: flex;
    flex-direction: column;
}

.loading {
  text-align: center;
  font-size: 1.2em;
  color: var(--);
}
.container {
  scrollbar-width: none; /* Para Firefox */
  -ms-overflow-style: none; /* Para Internet Explorer e Edge */
  overflow-x: auto; /* Adiciona rolagem horizontal quando necessário */
}
.scroll-container {
    overflow-x: auto;
    display: flex;
    gap: 10px; /* Optional: adds some space between share items */
    padding: 10px 0;
}

/* Hide scrollbar for Chrome, Safari and Opera */
.scroll-container::-webkit-scrollbar {
    display: none;
}

/* Hide scrollbar for IE, Edge and Firefox */
.scroll-container {
    -ms-overflow-style: none;  /* IE and Edge */
    scrollbar-width: none;  /* Firefox */
}

.share-item {
    flex: 0 0 auto;
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-right: 10px;
    padding: 5px;
}

.icon-circle {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 40px;
    height: 40px;
    border-radius: 50%;
    border-color: var(--borders-and-dividers-colors);
    border-width: 1px;
    border-width: solid;
}

.icon-circle i {
    color: var(--borders-and-dividers-colors);
}

.share-item img {
    width: 40px;
    height: 40px;
    object-fit: cover;
}

.share-item span {
    font-size: 11px;
    margin-top: 5px;
}

.link-text {
    margin-left: 0px;
    color: var(--text-color);
    font-size: 12px;
}
.link-section {
    width: 100%;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
}

.link-input {
    display: flex;
    align-items: center;
    width: 100%;
    margin-top: 5px;
    margin-bottom: 15px;
    font-size: 12px;
}

.link-display {
    flex: 1;
    padding: 5px;
    border-color: var(--borders-and-dividers-colors);
    border-width: 1px;
    border-width: solid;
    border-radius: 5px;
    background-color: var(--background-color-cassino);
    box-sizing: border-box;
    height: auto;
    min-height: 50px;
    display: flex;
    align-items: center;
    position: relative;
    padding-right: 40px;
    padding-left: 5px;
    max-width: 100%;
    overflow-wrap: break-word;
}

.link-content {
    flex: 1;
    word-break: break-word;
}
.copy-btn {
    background: none;
    border: none;
    color: var(--text-color);
    cursor: pointer;
    position: absolute;
    right: 5px;
    font-size: 12px;
    padding: 5px;
}
.copy-btn-id {
    background: none;
    border: none;
    color: var(--text-color);
    cursor: pointer;
    font-size: 12px;
    margin-left: 7px;
    vertical-align: middle;
}

.info-section {
    flex-direction: column;
    margin-bottom: 5px;
    color: var(--borders-and-dividers-colors);
    font-size: 12px;
}

.info-section span {
    display: inline-block;
    margin-bottom: 5px;
}

.info-section .number {
    color: var(--text-color);
}
.blue-number {
    color: var(--borders-and-dividers-colors);
}
.promo-right {
  width: 100%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    margin-left: 10px;
    margin-top: -1px;
    margin-right: 8px;
}










.btn-nav {
  padding: 4px 8px;
  color: var(--text-color);
  cursor: pointer;
  transition: background-color 0.3s ease, color 0.3s ease, border-bottom 0.3s ease;
  display: inline-block; /* Alterado de flex para inline-block */
  white-space: nowrap; /* Garante que os botões não quebrem linha */
}

.btn-nav.active {
  margin-bottom: 2px;
  border-bottom: 2px solid var(--background-itens-selected); /* Borda inferior de 2px quando ativo */
  color: var(--background-itens-selected); /* Muda a cor do texto para a mesma cor da borda */
}

.hide-scrollbar {
  -ms-overflow-style: none; /* Para Internet Explorer e Edge */
  scrollbar-width: none; /* Para Firefox */
  
}
.bordiasc {
   border: 1px solid var(--borders-and-dividers-colors);
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
.birusy{
  min-height: 100%;
  height: 100%;
  background-color: var(--back-sub-color);
  margin-top: 85px;
}

.custom-font-3{
    font-family: 'Helvetica';
     font-style: normal;
       font-size: 11px;
    font-weight: 400;
    color: var(--text-color)
}

</style>
