<template>
  <ProfileLayout>
   <div class="profile-container overflow-auto"> 




    <div class="user-profile justify-center items-center background-bottom-navigation" style="position: relative;">
    <img class="w-full" :src="`/storage/`+setting.background_perfil_top" style="position: relative; z-index: 1;">
    <img class="w-full" :src="`/storage/`+setting.sub_background_perfil_top" style="position: absolute; bottom: 0; left: 0; z-index: 2;">
    <div class="flex p-3" style="position: absolute; top: 0; right: 0; z-index: 3;">
    <button @click="$router.push({ path: '/profile/messages', query: { tab: 'support' } })" :class="['w-6 h-auto', { active: isActive('') }]"> <img  src="/public/assets/images/suportesh.png">  </button>
    <button @click="$router.push({ path: '/profile/messages', query: { tab: 'notification' } })" :class="['w-6 h-auto ml-4', { active: isActive('') }]"> <img  src="/public/assets/images/messagess.png">  </button>
    <button @click="$router.push('/profile/settings')" class="w-5 h-auto ml-4"> <img  src="/public/assets/images/icons/config.png">  </button>
    </div>
    <!-- Conteúdo informativo -->
    <div class="w-full" style="position: absolute; height: 100px; bottom: 0; left: 0; z-index: 10;">
        <div class="w-full relative">
            <div class="absolute h-16 w-18 left-6">
                <img :src="currentLevelImage" alt="" class="h-16">
            </div>
            <div class="absolute h-16 w-full max-w-[70%] right-6 custom-font">
                <div class="flex w-full justify">
                    <span class="text-[14px] text-[#d48c0b]">Restantes 
                        <span class="text-[14px] text-black">VIP{{ nextLevel?.bet_level }} 
                            <span class="text-[14px] text-[#d48c0b] ml-1">Valor restante para apostas 
                                <span class="text-[14px] text-black">{{ nextLevel?.bet_required }}</span> 
                            </span> 
                        </span>
                    </span> 
                    <button @click="$router.push({ path: '/profile/promocoes', query: { tab: 'vip' } })" 
                    :class="['w-10 h-10', { active: isActive('') }]"> 
                    <i class="fa-light text-black fa-chevron-right"></i></button>
                </div>
       <div class="flex w-full items-center mt-2">
    <!-- Texto à esquerda -->
    <span class="text-[14px] text-[#d48c0b]">
      Apostas para promoção
    </span>
    <!-- Contêiner da barra de progresso à direita -->
    <div class="relative flex-1 ml-4 h-3 bg-[#d2af63] rounded-full">
      <!-- Barra preenchida -->
      <div
        class="absolute inset-0 bg-[#5ce1e6] rounded-full h-full"
        :style="{ width: progressBarWidth }"
      ></div>
      <!-- Span dentro da barra -->
      <span class="absolute inset-0 flex items-center justify-center text-[12px] text-black">
        {{ difference.toFixed(2) }} / {{ nextLevel.bet_required }}
      </span>
    </div>
  </div>





            </div>
        </div>
    </div>
</div>





      <!-- Dados do usuário -->
      <div class="user-profile justify-center custom-font items-center p-2 background-bottom-navigation">
        
       <div class="w-full flex justify">
  <!-- Seção do Avatar -->
  <div class="avatar-section flex w-auto">
    <img 
      class="bordafoto w-12 h-12 cursor-pointer" 
      :src="avatarUrl || (userData?.avatar ? '/storage/' + userData.avatar : (setting && setting.image_user_nav ? '/storage/' + setting.image_user_nav : '/default-avatar.jpg'))" 
      alt="Avatar" 
      @click="openImagePicker"
    >
    <input 
      type="file" 
      ref="imageInput" 
      class="hidden" 
      @change="handleFileChange" 
      accept="image/*"
    >
  </div>

  <!-- Detalhes do Usuário -->
  <div class="user-details ml-2 flex items-center">
    <div class="flex flex-col">
      <div class="text-[13px] text-color" style="font-family: 'Helvetica', sans-serif;">
        <p>Conta: {{ userData?.name || 'Não disponível' }}</p>
      </div>
      <div class="flex custom-font text-color">
        <p>ID: {{ userData?.id || 'Não disponível' }} </p>
        <button 
          @click="copyToClipboard(userData?.id || '')" 
          class="copy-button ml-2" 
          :disabled="!userData?.id"
        >
          <i class="fas fa-copy"></i>
        </button>
      </div>
    </div>

    <!-- Seção do Saldo -->
    <div class="flex flex-col ml-2 custom-font">
      <div class="flex background-bottom-navigation p-2 borisg">
        <div class="flex mr-2 imghd">
        <img class="w-6 h-6 rounded-full ml-2 mr-2" src="/public/assets/images/br.png">
        </div>
        <button
      v-if="wallet?.total_balance !== undefined && !isLoadingWallet"
      @click="$router.push('/profile/wallet')"
      type="button"
      class="flex justify-center items-center mgd"
    >
      <div>
        <strong class="textsss">{{ formatBalance(displayedBalance || 0, 0) }}</strong>
      </div>
    </button>

    <button @click="refreshWallet" type="button" class="flex justify-center items-center ml-1">
      <img
        :class="{'spin': isLoadingWallet}"
        src="/public/assets/images/refresh.png"
        alt="Refresh"
        class="w-4 h-4"
      />
    </button>
      </div>
    </div>
  </div>
</div>

         <div class="w-full flex grid grid-cols-3 mt-3 gap-2 p-2 justify-center items-center custom-font">
          <button @click="$router.push({ path: '/profile/financas', query: { tab: 'saque' } })" 
                    :class="['items-center flex flex-col imghds', { active: isActive('') }]">
            <img :src="`/storage/`+setting.icon_wt_3" class="w-auto h-8 mb-1">
             {{ $t('Withdraw') }}
          </button>
           <button @click="$router.push('/profile/financas')" class="items-center flex flex-col imghds">
            <img :src="`/storage/`+setting.icon_wt_2" class="w-auto h-8 mb-1">
            {{ $t('Deposit') }}
          </button>
           <button @click="$router.push({ path: '/profile/financas', query: { tab: 'registrodedepositos' } })" 
                    :class="['items-center flex flex-col', { active: isActive('') }]">
            <img :src="`/storage/`+setting.icon_wt_4" class="w-auto h-8 mb-1">
            {{ $t('Transactions') }}
          </button>
         </div>

        <div class="w-full flex p-1 justify-center items-center custom-font">
    <button @click="toggleExpand" class="items-center flex text-color">
      {{ isExpanded ? 'Mostrar Menos' : 'Mostrar Mais' }}
      <img 
        src="/public/assets/images/maismi.png" 
        class="ml-3 w-4 h-4" 
        :style="{ transform: isExpanded ? 'rotate(180deg)' : 'rotate(0deg)', transition: 'transform 0.3s' }" 
        alt="Toggle Visibility"
      />
    </button>
  </div>

         <!-- Área a ser controlada pelo botão de Mostrar Mais -->
      <div class="w-full flex grid grid-cols-3 mt-3 gap-2 p-2 justify-center items-center custom-font" v-if="isExpanded">
        <div class="flex flex-col justify-center items-center">
          <h1 class="text-[14px] values-deposit">Saldo saque</h1>
          <h1 class="text-[14px] values-deposit">{{ state.currencyFormat(parseFloat(wallet.balance_withdrawal), wallet.currency) }}</h1>
        </div>

        <div class="flex flex-col justify-center items-center">
          <h1 class="text-[14px] values-deposit">Saldo Rollover</h1>
<h1 class="text-[14px] values-deposit">{{ state.currencyFormat(parseFloat(wallet.balance) + parseFloat(wallet.balance_bonus), wallet.currency) }}</h1>
        </div>
        <div class="flex flex-col justify-center items-center">
          <h1 class="text-[14px] values-deposit">Saldo Bonus</h1>
          <h1 class="text-[14px] values-deposit">{{ state.currencyFormat(parseFloat(wallet.balance_bonus), wallet.currency) }}</h1>
        </div>
      </div>
      <!-- fim da Área a ser controlada pelo botão de Mostrar Mais -->


      </div>
      
      <!-- Botões -->
      <div class="wallet-info p-2 rounded-lg grid grid-cols-1 custom-font-1">

        <button @click="$router.push({ path: '/profile/linkconvite', query: { tab: 'desempenho' } })" 
        :class="['btn-nav rounded-lg py-1 background-bottom-navigation custom-font-1', { active: isActive('') }]">
  <img :src="`/storage/`+setting.icon_wt_1" alt="Balance Icon" class="icon-left custom-font">
  {{ $t('Desempenho') }}
  <i class="fa-light fa-chevron-right text-color absolute right-2"></i>
</button>

        <button @click="$router.push({ path: '/profile/financas', query: { tab: 'saque' } })" 
                    :class="['btn-nav rounded-lg py-1 background-bottom-navigation custom-font-1', { active: isActive('') }]">
          <img :src="`/storage/`+setting.icon_wt_3" alt="Withdraw Icon" class="icon-left">
          {{ $t('Withdraw') }}
          <i class="fa-light fa-chevron-right text-color absolute right-2"></i>
        </button>
        <button @click="$router.push('/profile/financas')" :class="['btn-nav rounded-lg py-1 background-bottom-navigation custom-font-1', { active: isActive('/profile/financas') }]">
          <img :src="`/storage/`+setting.icon_wt_2" alt="Deposit Icon" class="icon-left">
          {{ $t('Deposit') }}
          <i class="fa-light fa-chevron-right text-color absolute right-2"></i>
        </button>
        <button  @click="$router.push({ path: '/profile/financas', query: { tab: 'registrodedepositos' } })" 
                    :class="['btn-nav rounded-lg py-1 background-bottom-navigation custom-font-1', { active: isActive('') }]">
          <img :src="`/storage/`+setting.icon_wt_4" alt="Transactions Icon" class="icon-left">
          {{ $t('Transactions') }}
          <i class="fa-light fa-chevron-right text-color absolute right-2"></i>
        </button>
        <button @click="$router.push('/profile/linkconvite')" :class="['btn-nav rounded-lg py-1 background-bottom-navigation custom-font-1', { active: isActive('/profile/transactions') }]">
          <img :src="`/storage/`+setting.icon_wt_6" alt="linkconvite Icon" class="icon-left">
          {{ $t('Agente') }}
          <i class="fa-light fa-chevron-right text-color absolute right-2"></i>
        </button>
        <button @click="$router.push({ path: '/profile/financas', query: { tab: 'gerenciaraccount' } })" 
                    :class="['btn-nav rounded-lg py-1 background-bottom-navigation custom-font-1', { active: isActive('') }]">
          <img :src="`/storage/`+setting.icon_wt_7" alt="addaccount Icon" class="icon-left">
          {{ $t('Gestão de Retiradas') }}
          <i class="fa-light fa-chevron-right text-color absolute right-2"></i>
        </button>
         <button @click="$router.push('/profile/settings')" :class="['btn-nav rounded-lg py-1 background-bottom-navigation custom-font-1', { active: isActive('/profile/settings') }]">
          <img :src="`/storage/`+setting.icon_wt_9" alt="addaccount Icon" class="icon-left">
          {{ $t('Dados') }}
          <i class="fa-light fa-chevron-right text-color absolute right-2"></i>
        </button>
        <button @click="$router.push('/profile/createpin')" :class="['btn-nav rounded-lg py-1 background-bottom-navigation custom-font-1', { active: isActive('/profile/createpin') }]">
          <img :src="`/storage/`+setting.icon_wt_8" alt="addaccount Icon" class="icon-left">
          {{ $t('Senha de Retiradas') }}
          <i class="fa-light fa-chevron-right text-color absolute right-2"></i>
        </button>


        <a @click.prevent="logoutAccount" href="/" class="btn-nav px-4 py-2 rounded-lg background-bottom-navigation custom-font-1" role="menuitem">
          <span class="">
            <img :src="`/storage/`+setting.icon_wt_5" alt="Logout Icon" class="icon-left">
          </span>
          {{ $t('Sair') }}
          <i class="fa-light fa-chevron-right text-color absolute right-2"></i>
        </a>
      </div>
    </div>
  </ProfileLayout>
</template>

<script>
import HttpApi from "@/Services/HttpApi.js";
import { useToast } from "vue-toastification";
import { useAuthStore } from "@/Stores/Auth.js";
import { useRouter } from "vue-router";
import { useSettingStore } from "@/Stores/SettingStore.js";
import ProfileLayout from "@/Layouts/ProfileLayout.vue";

export default {
  props: ['simple'],
  components: { ProfileLayout },
  data() {
    return {
       nivelToday: null,
            nextLevel: null,
            vipPoints: 0,
            currentLevelImage: '/storage/001.png', // Imagem padrão
      isLoadingProfile: false,
      profileUser: null,
      isLoading: false,

      isLoadingWallet: true,
      wallet: null,
      displayedBalance: 0,
      processInterval: null,
      mywallets: null,
      referencecode: '',
      histories: null,
      isLoadingGenerate: false,
      commissionRewards: null,
      referenceRewards: null,
      avatarUrl: null,  // Adicionando a propriedade para armazenar a URL do avatar
      setting: null,    // Adicionando a propriedade para armazenar as configurações do usuário
      isExpanded: false, // Adiciona a propriedade isExpanded
        difference: 0, // Adiciona a propriedade para armazenar a diferença
      totalAmount: 0 // Adiciona a propriedade para armazenar o totalAmount
    };
  },
  setup() {
    const router = useRouter();
    return {
      router
    };
    
  },
  beforeUnmount() {
    clearInterval(this.processInterval);
  },
  computed: {
     progressBarWidth() {
      // Calcula a largura da barra de progresso como uma porcentagem
      const percentage = (this.difference / this.nextLevel.bet_required) * 100;
      // Garante que a porcentagem fique entre 0% e 100%
      return `${Math.min(Math.max(percentage, 0), 100)}%`;
    },
    userData() {
      const authStore = useAuthStore();
      return authStore.user;
    },
      setting() {
            const authStore = useSettingStore();
            return authStore.setting;
        },
    walletData() {
      // Lógica para obter os dados da carteira
      return {
        total_lose: 500, // Exemplo de total perdido
        total_bet: 1500, // Exemplo de total apostado
        total_won: 2000, // Exemplo de total ganho
      };
    },
  },
  mounted() {
    this.commissionRewards = new Modal(document.getElementById('commissionRewardsEl'), {
      placement: 'center',
      backdrop: 'dynamic',
      backdropClasses: 'bg-gray-900/50 dark:bg-gray-900/80 fixed inset-0 z-40',
      closable: true,
      onHide: () => {},
      onShow: () => {},
      onToggle: () => {},
    });

    this.referenceRewards = new Modal(document.getElementById('referenceRewardsEl'), {
      placement: 'center',
      backdrop: 'dynamic',
      backdropClasses: 'bg-gray-900/50 dark:bg-gray-900/80 fixed inset-0 z-40',
      closable: true,
      onHide: () => {},
      onShow: () => {},
      onToggle: () => {},
    });
     this.getWallet();
  },
  methods: {
 async performChecks() {
            const _this = this;
            const _toast = useToast();

            try {
                console.log('Verificando e atualizando bônus e saldos...');
                
                // Verificar e atualizar bônus
                await HttpApi.get('profile/wallet/update-bonus-if-needed');

                // Transferir saldo para saque se necessário
                await HttpApi.get('profile/wallet/transfer-balance-to-withdrawal-if-needed');

                // Transferir bônus para saque se necessário
                await HttpApi.get('profile/wallet/transfer-bonus-to-withdrawal-if-needed');

               // _toast.success('Atualizações realizadas com sucesso!');
            } catch (error) {
                console.error("Erro ao realizar as atualizações:", error);
              //  _toast.error('Erro ao realizar as atualizações.');
            }
        },
    getVips: async function () {
            const _this = this;
            await HttpApi.get(`/profile/vip/`)
                .then(response => {
                    _this.vipPoints = response.data.vipPoints;
                    _this.nextLevel = response.data.nextLevel;
                    _this.nivelToday = response.data.nivelToday;
                  _this.currentLevelImage = `/storage/${response.data.currentLevelImage}`;
                     _this.totalAmount = response.data.totalAmount;
          _this.difference = response.data.difference;
                    _this.$nextTick(() => {
                        _this.loadingVipTab();
                    });
                })
        },
    isActive(route) {
      return this.$route.path === route;
    },
    openImagePicker() {
      this.$refs.imageInput.click();
    },
    async handleFileChange(event) {
      const file = event.target.files[0];
      const formData = new FormData();
      formData.append('avatar', file);

      const reader = new FileReader();
      reader.onload = () => {
        this.avatarUrl = reader.result;
      };
      reader.readAsDataURL(file);

      await HttpApi.post('/profile/upload-avatar', formData, {
        headers: {
          'Content-Type': 'multipart/form-data',
        },
      }).then(response => {
        console.log('Avatar atualizado com sucesso', response.data, {
                  position: 'top-center', // Posiciona no centro superior
                  timeout: 3000, // Tempo de exibição
                  className: 'custom-toast' // Classe customizada para estilização
                });
        this.userData.avatar = response.data.avatar; // Atualize a imagem do usuário após o upload
      })
      .catch(error => {
        console.error('Erro ao atualizar avatar', error, {
                  position: 'top-center', // Posiciona no centro superior
                  timeout: 3000, // Tempo de exibição
                  className: 'custom-toast' // Classe customizada para estilização
                });
        const _toast = useToast();
        _toast.error("Erro ao atualizar a imagem do perfil", {
                  position: 'top-center', // Posiciona no centro superior
                  timeout: 3000, // Tempo de exibição
                  className: 'custom-toast' // Classe customizada para estilização
                });
      });
    },
    getCode() {
      const _this = this;
      const _toast = useToast();
      _this.isLoadingGenerate = true;

      // Exemplo de chamada HTTP para obter dados
      HttpApi.get('profile/affiliates/')
        .then(response => {
          // Lógica para processar a resposta e atualizar dados
          _this.isLoadingGenerate = false;
        })
        .catch(error => {
          _this.isLoadingGenerate = false;
        });
    },
    toggleCommissionRewards(event) {
      this.commissionRewards.toggle();
    },
    toggleReferenceRewards(event) {
      this.referenceRewards.toggle();
    },
    getWallet() {
            const _this = this;
            const _toast = useToast();
            _this.isLoadingWallet = true;

            HttpApi.get('profile/wallet')
                .then(response => {
                    _this.wallet = response.data.wallet;
                    _this.withdraw.currency = response.data.wallet.currency;
                    _this.withdraw.symbol = response.data.wallet.symbol;
                    _this.isLoadingWallet = false;
                })
                .catch(error => {
                    Object.entries(JSON.parse(error.request.responseText)).forEach(([key, value]) => {
                        _toast.error(`${value}`);
                    });
                    _this.isLoadingWallet = false;
                });
        },
    getMyWallet() {
      const _this = this;
      const _toast = useToast();

      HttpApi.get('profile/mywallet')
        .then(response => {
          _this.mywallets = response.data.wallets;
        })
        .catch(error => {
          Object.entries(JSON.parse(error.request.responseText)).forEach(([key, value]) => {
            _toast.error(`${value}`);
          });
        });
    },
    copyToClipboard(text) {
      navigator.clipboard.writeText(text).then(() => {
        const _toast = useToast();
        _toast.success("Copiado para a área de transferência", {
                  position: 'top-center', // Posiciona no centro superior
                  timeout: 3000, // Tempo de exibição
                  className: 'custom-toast' // Classe customizada para estilização
                });
      }).catch(err => {
        const _toast = useToast();
        _toast.error("Erro ao copiar");
      });
    },
    logoutAccount: function() {
      const authStore = useAuthStore();
      const _toast = useToast();

      HttpApi.post('auth/logout', {})
        .then(response => {
          authStore.logout();
          this.$router.push('/');

          _toast.success(this.$t('You have been successfully disconnected' , {
                  position: 'top-center', // Posiciona no centro superior
                  timeout: 3000, // Tempo de exibição
                  className: 'custom-toast' // Classe customizada para estilização
                }));
        })
        .catch(error => {
          Object.entries(JSON.parse(error.request.responseText)).forEach(([key, value]) => {
            console.log(value);
            //_toast.error(`${value}`);
          });
        });
    },
     getSetting() {
            const settingStore = useSettingStore();
            this.setting = settingStore.setting;
    },
     formatBalance(value) {
    return value.toFixed(2); // Formata o valor para 2 casas decimais
  },
    async getWallet() {
    try {
      const response = await HttpApi.get('profile/wallet');
      const newBalance = response.data.wallet.total_balance;
      this.animateBalance(this.wallet?.total_balance || 0, newBalance);
      this.wallet = response.data.wallet;
      this.isLoadingWallet = false;
    } catch (error) {
      console.error(error);
      this.isLoadingWallet = false;
    }
  },
  async refreshWallet() {
    this.isLoadingWallet = true;
    const response = await HttpApi.get('profile/wallet');
    const newBalance = response.data.wallet.total_balance;
    this.animateBalance(this.wallet?.total_balance || 0, newBalance);
    this.wallet = response.data.wallet;
    this.isLoadingWallet = false;
  },
  animateBalance(oldBalance, newBalance) {
    const duration = 1000; // duração da animação em ms
    const frameRate = 60; // frames por segundo
    const totalFrames = (duration / 1000) * frameRate;
    const increment = (newBalance - oldBalance) / totalFrames;
    let currentFrame = 0;

    const animate = () => {
      if (currentFrame < totalFrames) {
        this.displayedBalance = oldBalance + increment * currentFrame;
        currentFrame++;
        requestAnimationFrame(animate);
      } else {
        this.displayedBalance = newBalance;
      }
    };

      animate();
    },
    toggleExpand() {
      this.isExpanded = !this.isExpanded;
    }
  },
  
  created() {
    this.refreshWallet(); // Chama refreshWallet ao montar o componente
    this.getCode();
    this.getWallet();
    this.getMyWallet();
    this.getVips();
            this.performChecks(); // Adiciona a chamada para verificar e atualizar bônus e saldos

  },
};
</script>

<style scoped>
.imghd{
   border-right: 1px solid var(--borders-and-dividers-colors);
}
.imghds {
    position: relative;
    height: auto; /* Altura da div principal */
    /* Outros estilos */
}

.imghds::after {
    content: "";
    position: absolute;
    top: 25%;
    bottom: 25%;
    right: 0;
    height: 50%;
    width: 1px;
    background-color: var(--borders-and-dividers-colors);
}


.profile-container {
  margin-bottom: 100px;
  height: 100vh; /* Altura total da viewport */
}
.icon-left {
  margin-right: 25px; /* Ajuste o valor conforme necessário */
  width: 25px; /* Ajuste o tamanho da imagem conforme necessário */
  height: auto; /* Ajuste o tamanho da imagem conforme necessário */
}
.custom-color {
  filter: invert(var(--invert-config))
  sepia(var(--sepia-config))
  saturate(var(--saturate-config))
  hue-rotate(var(--hue-rotate-config))
  brightness(var(--brightness-config))
  contrast(var(--contrast-config));
}
.item-container {
  display: flex;
  justify-content: space-between;
  align-items: center;
  border-radius: 10px;
  padding: 6px 6px;
  margin: 5px;
  transition: background-color 0.3s ease;
  border-width: 1px; 
  border-width: solid; 
  border-color: var(--borders-and-dividers-colors);
}
.left-text {
  margin-right: auto;
}
.btn-nav {
  margin-top: 8px;
  padding: 8px 8px;
  color: #fff;
  cursor: pointer;
  transition: background-color 0.3s ease;
  display: flex;
  align-items: center;
  position: relative;
}
.scrollbar-hidden::-webkit-scrollbar {
  width: 0;
}
.custom-toast {
    max-width: 400px;
    margin: 0 auto;
}

.bordafoto {
  border-color: var(--borders-and-dividers-colors);
  border-width: 1px;
  border-width: solid;
  border-radius: 10px;
}
.scrollbar-hidden {
  overflow: -moz-scrollbars-none;
  -ms-overflow-style: none;
  scrollbar-width: none;
}
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

body {
  font-family: 'Helvetica', sans-serif; /* Define a fonte Helvetica para todo o documento */
}
.custom-font {
    font-family: 'Helvetica', sans-serif;
    font-size: 15px;
    font-style: normal;
    font-weight: 400;
    color: var(--text-color);
}
.custom-font-1 {
    font-family: 'Helvetica', sans-serif;
    font-style: normal;
    font-weight: 400;
    color: var(--text-color);
}
.border-l {
    border: 1px solid var(--borders-and-dividers-colors);
    border-radius: 50px;
    padding: 1px;
}
.mgd{
  margin-left: 1px;
}
.spin {
    animation: spin 1s linear infinite;
}

@keyframes spin {
    0% {
      transform: rotate(0deg);
    }
    100% {
      transform: rotate(360deg);
    }
}
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

body {
  font-family: 'Helvetica', sans-serif; /* Define a fonte Helvetica para todo o documento */
}
.custom-font {
    font-family:'Helvetica', sans-serif;
    font-style: normal;
    line-height: normal;
    font-weight: 400;
}
</style>
