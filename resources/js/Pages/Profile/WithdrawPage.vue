<template>
    
        <div class="items-container md:w-6/6 2xl:w-6/6 mx-auto">
            <div class="flex background-bottom-navigation p-2">
                <p class="text-color mr-2"> Saldo </p>
                <strong class="textsss"> {{parseFloat(displayedBalance, wallet?.currency).toFixed(2).replace('.', ',')}} </strong>
                <button @click="refreshWallet" type="button" class="flex justify-center items-center mr-1 ml-2">
                    <img
                        :class="{'spin': isLoadingWallet}"
                        src="/public/assets/images/refresh.png"
                        alt="Refresh"
                        class="w-4 h-4"
                    />
                </button>
            </div>
           <div class="flex background-bottom-navigation p-2 borisg">
               <span class="text-[11px]">
  Você precisa apostar 
  <span class="textsss">
    {{
      (parseFloat(wallet.balance_deposit_rollover) + parseFloat(wallet.balance_bonus_rollover))
      .toFixed(2)
      .replace('.', ',')
    }}
  </span> 
  para sacar dinheiro
</span>
           </div>


            <div class="flex justify-center items-center background-bottom-navigation p-2 borisg">
                <button class="w-full p-2 borisgs text-color"> Retirada Normal </button>
            </div>

            <div class="grid grid-cols-1 gap-4">
                <div class="col-span-3 relative">
                    <div v-if="setting && wallet && !isLoading" class="flex flex-col w-full p-2 rounded">
                        <form v-if="wallet.currency === 'BRL'" @submit.prevent="submitWithdraw">
                            <!-- Seletor de contas -->
                            <div class="mt-1 flex justify relative w-full">
                                <div class="select-container w-full max-w-[85%]">
                                    <div class="select-trigger w-full flex justify-between relative" @click="toggleDropdown">
                                        <img src="/public/assets/images/icon_normal_pix.png" class="account-icon" />
                                        <p class="text-color text-[10px]">{{ getSelectedAccountLabel() }}</p>
                                        <i class="fa-solid fa-chevron-down text-color right-2 mr-1"></i>
                                    </div>
                                    <div v-if="dropdownOpen" class="select-dropdown">
                                        <div v-for="account in accountsDetails" :key="account.id" class="account-card" @click="selectAccount(account)">
                                            <img src="/public/assets/images/icon_normal_pix.png" class="account-icon" />
                                            <div class="account-details">
                                                <p class="account-pix-key">{{ account.pix_key }}</p>
                                                <p class="account-pix-type">({{ account.pix_type }})</p>
                                                <p class="account-pix-type">{{ account.name }}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <button @click="$router.push({ path: '/profile/financas', query: { tab: 'gerenciaraccount' } })" :class="['absolute w-10 h-10 right-2 items-center', { active: isActive('') }]">
                                    <i class="fa-light fa-id-card text-color text-2xl"></i>
                                </button>
                            </div>

                            <div class="mt-4 relative">
                                <div class="text-color mb-1">
                                   <input type="number"
    class="input text-color btn-border-transparent-yellow-1"
    v-model="withdraw.amount"
    :min="setting.min_withdrawal"
    :max="setting.max_withdrawal"
    :placeholder="`Mínimo: ${setting.min_withdrawal}, Máximo: ${setting.max_withdrawal}`"
    required>

                                </div>
                                <button @click="setMaxAmount" type="button" class="absolute right-2 top-1/2 transform -translate-y-1/2 text-white px-3 py-1 rounded-lg">
                                    Tudo
                                </button>
                            </div>

                            <hr class="dividers">

                           <section class="password-section mt-8">
                    <div class="password-input__label">
                      <span class="text-color">Verificar Senha de Saque</span>
                      <span class="password-icon" @click="togglePasswordVisibility">
                        <i class="icon-container" style="display: inline-flex; justify-content: center; align-items: center;">
                          <svg v-if="isPasswordVisible" width="1em" height="1em" fill="currentColor" aria-hidden="true" focusable="false">
                            <use xlink:href="#comm_icon_show--svgSprite:all"></use>
                          </svg>
                          <svg v-else width="1em" height="1em" fill="currentColor" aria-hidden="true" focusable="false">
                            <use xlink:href="#comm_icon_hide--svgSprite:all"></use>
                          </svg>
                        </i>
                      </span>
                    </div>
                    <div class="pin-container">
                      <input
                        v-for="(digit, index) in 6"
                        :key="index"
                        ref="pinInputs"
                        class="custom-pin-input"
                        :type="isPasswordVisible ? 'text' : 'password'"
                             inputmode="numeric"
                        maxlength="1"
                        :value="password[index] || ''"
                        @input="handleInput($event, index)"
                        @keydown="handleKeydown($event, index)"
                        :disabled="index > 0 && !password[index - 1]"
                        :autofocus="index === 0"
                      />
                    </div>
                  </section>

                            <div class="mt-4 w-full flex items-center justify-center">
                                <button type="submit" class="bordinha-1 w-full" :disabled="!canSubmit">
                                    <span class="textss">{{ $t('Confirmar retirada') }}</span>
                                </button>
                            </div>
                        </form>
                    </div>
                    <div v-if="isLoading" role="status" class="absolute -translate-x-1/2 -translate-y-1/2 top-2/4 left-1/2">
                        <svg aria-hidden="true" class="w-8 h-8 text-gray-200 animate-spin text-white fill-green-600" viewBox="0 0 100 101" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M100 50.5908C100 78.2051 77.6142 100.591 50 100.591C22.3858 100.591 0 78.2051 0 50.5908C0 22.9766 22.3858 0.59082 50 0.59082C77.6142 0.59082 100 22.9766 100 50.5908ZM9.08144 50.5908C9.08144 73.1895 27.4013 91.5094 50 91.5094C72.5987 91.5094 90.9186 73.1895 90.9186 50.5908C90.9186 27.9921 72.5987 9.67226 50 9.67226C27.4013 9.67226 9.08144 27.9921 9.08144 50.5908Z" fill="currentColor"/>
                            <path d="M93.9676 39.0409C96.393 38.4038 97.8624 35.9116 97.0079 33.5539C95.2932 28.8227 92.871 24.3692 89.8167 20.348C85.8452 15.1192 80.8826 10.7238 75.2124 7.41289C69.5422 4.10194 63.2754 1.94025 56.7698 1.05124C51.7666 0.367541 46.6976 0.446843 41.7345 1.27873C39.2613 1.69328 37.813 4.19778 38.4501 6.62326C39.0873 9.04874 41.5694 10.4717 44.0505 10.1071C47.8511 9.54855 51.7191 9.52689 55.5402 10.0491C60.8642 10.7766 65.9928 12.5457 70.6331 15.2552C75.2735 17.9648 79.3347 21.5619 82.5849 25.841C84.9175 28.9121 86.7997 32.2913 88.1811 35.8758C89.083 38.2158 91.5421 39.6781 93.9676 39.0409Z" fill="currentFill"/>
                        </svg>
                        <span class="sr-only">{{ $t('Loading') }}...</span>
                    </div>
                </div>
            </div>
        </div>
    
</template>

<script>
import { RouterLink, useRouter } from "vue-router";
import WalletLayout from "@/Layouts/WalletLayout.vue";
import WalletSideMenu from "@/Pages/Profile/Components/WalletSideMenu.vue";
import HttpApi from "@/Services/HttpApi.js";
import { useAuthStore } from "@/Stores/Auth.js";
import { useToast } from "vue-toastification";
import { useSettingStore } from "@/Stores/SettingStore.js";

export default {
    props: [],
    components: { WalletSideMenu, WalletLayout, RouterLink },
    data() {
        return {
            dropdownOpen: false,
            accountsDetails: [],
            selectedAccount: null,
            password: ['', '', '', '', '', ''],
            isLoading: false,
            setting: null,
            wallet: null,
            displayedBalance: 0,
            isLoadingWallet: false, // Adicione isso
            withdraw: {
                name: '',
                pix_key: '',
                pix_type: 'document',
                amount: '',
                type: 'pix',
                currency: '',
                symbol: '',
                accept_terms: true
            },
        }
    },
     computed: {
    isPasswordComplete() {
      return this.password.every(digit => digit !== '');
    },
    userData() {
      const authStore = useAuthStore();
      return authStore.user;
    },
      setting() {
            const authStore = useSettingStore();
            return authStore.setting;
         },
        canSubmit() {
        const isAmountValid = parseFloat(this.withdraw.amount) >= parseFloat(this.setting.min_withdrawal);
        const isAccountSelected = this.selectedAccount !== null;
        return isAmountValid && isAccountSelected && this.isPasswordComplete;
    }
  },
    setup() {
        const router = useRouter();
        return {
            router
        };
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
               // _toast.error('Erro ao realizar as atualizações.');
            }
        },
        togglePasswordVisibility() {
      this.isPasswordVisible = !this.isPasswordVisible;
    },
    handleInput(event, index) {
      const value = event.target.value.replace(/\D/g, ''); // Remove caracteres não numéricos
      this.password[index] = value;

      if (value && index < 5) {
        this.$nextTick(() => {
          this.$refs.pinInputs[index + 1].focus();
        });
      }
    },
    handleKeydown(event, index) {
      if (event.key === 'Backspace' && !this.password[index]) {
        if (index > 0) {
          this.$refs.pinInputs[index - 1].focus();
        }
      }
    },
        toggleDropdown() {
            this.dropdownOpen = !this.dropdownOpen;
        },
        selectAccount(account) {
            this.selectedAccount = account;
            this.withdraw.name = account.name;
            this.withdraw.pix_key = account.pix_key;
            this.withdraw.pix_type = account.pix_type;
            this.dropdownOpen = false;
        },
        getSelectedAccountLabel() {
            return this.selectedAccount ? `${this.selectedAccount.pix_key} (${this.selectedAccount.pix_type}) ${this.selectedAccount.name}` : 'Selecione uma conta';
        },
        setFullOrMaxAmount() {
            const balance = parseFloat(this.wallet.balance_withdrawal);
            const maxWithdrawal = parseFloat(this.setting.max_withdrawal);

            if (balance > maxWithdrawal) {
                this.withdraw.amount = maxWithdrawal;
            } else {
                this.withdraw.amount = balance;
            }
        },
        setMinAmount() {
            this.withdraw.amount = this.setting.min_withdrawal;
        },
        setMaxAmount() {
            const balance = parseFloat(this.wallet.balance_withdrawal);
            const maxWithdrawal = parseFloat(this.setting.max_withdrawal);

            this.withdraw.amount = Math.min(balance, maxWithdrawal);
        },
        setPercentAmount(percent) {
            this.withdraw.amount = (percent / 100) * this.wallet.balance_withdrawal;
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
        getSetting() {
            const _this = this;
            const settingStore = useSettingStore();
            const settingData = settingStore.setting;

            if (settingData) {
                _this.setting = settingData;
                _this.withdraw.amount = settingData.min_withdrawal;
            }

            _this.isLoading = false;
        },
 async verifyPin() {
    try {
        console.log('Enviando solicitação para verificar PIN...');
        const response = await HttpApi.post('/verify-pin', {
            user_id: this.userData.id,
            pin: this.password.join('')
        });

        // Adicione log para depuração
        console.log('Resposta da API:', response.data);

        // Ajuste para verificar a mensagem
        if (response.data.message === 'PIN verificado com sucesso!') {
            return true;  // PIN verificado com sucesso
        } else {
            return false;  // PIN não verificado
        }
    } catch (error) {
        console.error("Erro ao verificar PIN:", error.response ? error.response.data : error.message);
        return false;  // Retorna false em caso de erro
    }
},

async submitWithdraw() {
    const _this = this;
    const _toast = useToast();
    _this.isLoading = true;

    // Verificar se o PIN está completo
    if (!_this.isPasswordComplete) {
        _toast.error('Por favor, complete o PIN de saque.');
        _this.isLoading = false;
        return;
    }

    console.log('Verificando PIN...');
    const isPinValid = await _this.verifyPin();
    console.log('PIN válido:', isPinValid);

    if (!isPinValid) {
        _toast.error('PIN de saque inválido.');
        _this.isLoading = false;
        return;
    }

    console.log('Enviando solicitação de saque...');
    try {
        const response = await HttpApi.post('wallet/withdraw/request', _this.withdraw);
        _this.isLoading = false;
        _this.withdraw = {
            name: '',
            pix_key: '',
            pix_type: '',
            amount: '',
            type: '',
            accept_terms: true
        };
        _this.router.push({ path: '/profile/financas', query: { tab: 'registrodesaques' } });
        //_toast.success(response.data.message);
    } catch (error) {
        console.error('Erro ao realizar saque:', error.response ? error.response.data : error.message);
        if (error.response && error.response.data) {
            const errorMessage = error.response.data.error || 'Erro desconhecido ao realizar saque.';
            _toast.error(errorMessage);
        } else {
            _toast.error('Erro desconhecido ao realizar saque.');
        }
        _this.isLoading = false;
    }
},
        fetchAccountWithdrawsDetails() {
            const _this = this;
            _this.isLoading = true;
            HttpApi.get('profile/infos/account-withdraws')
                .then(response => {
                    if (response && response.data) {
                        _this.accountsDetails = response.data.accountsDetails || [];
                    } else {
                        _this.accountsDetails = [];
                        _this.selectedAccount = null;
                    }
                })
                .catch(error => {
                    console.error("Erro ao buscar detalhes da conta:", error);
                    _this.accountsDetails = [];
                    _this.selectedAccount = null;
                })
                .finally(() => {
                    _this.isLoading = false;
                });
        },
       async refreshWallet() {
    this.isLoadingWallet = true;
    try {
        const response = await HttpApi.get('profile/wallet');
        const newBalance = response.data.wallet.total_balance;
        this.animateBalance(this.wallet?.total_balance || 0, newBalance);
        this.wallet = response.data.wallet;
    } catch (error) {
        console.error("Erro ao atualizar a carteira:", error);
    } finally {
        this.isLoadingWallet = false;
    }
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
     isActive(route) {
      return this.$route.path === route;
    },
    },
    created() {
        this.refreshWallet(); // Chama refreshWallet ao montar o componente
        this.getWallet();
        this.getSetting();
        this.fetchAccountWithdrawsDetails();
                this.performChecks(); // Adiciona a chamada para verificar e atualizar bônus e saldos

    },
};
</script>

<style scoped>
.input::-webkit-inner-spin-button,
.input::-webkit-outer-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

.input {
    -moz-appearance: textfield; /* Para Firefox */
}

.spin {
    animation: spin 1s linear infinite;
}

@keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}

/* Estilos CSS específicos para a página podem ser adicionados aqui */
.btn {
  padding: 8px 8px;
  color: var(--text-color);
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}
.select-container {
    position: relative;
    display: inline-block;
}
.dividers {
    border: none; /* Remove o estilo padrão da borda */
    height: 1px; /* Define a altura do divisor */
    background-color: var(--borders-and-dividers-colors); /* Define a cor do divisor */
    margin-top: 35px; /* Mantém a margem superior */
    transform-origin: center;
}
.select-trigger {
    display: flex;
    align-items: center;
    padding: 5px;
    border: 1px solid var(--borders-and-dividers-colors);
    border-radius: 10px;
    cursor: pointer;
    background-color:var(--background-bottom-navigation);
    transition: background-color 0.3s;
}

.select-trigger:hover {
    background-color: var(--background-bottom-navigation);
}

.select-dropdown {
    position: absolute;
    top: 100%;
    left: 0;
    width: 100%;
    background-color: var(--background-bottom-navigation);
    border: 1px solid var(--borders-and-dividers-colors);
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    z-index: 10;
    display: flex;
    flex-direction: column;
    gap: 5px;
    padding: 5px;
}

.account-card {
    display: flex;
    align-items: center;
    padding: 5px;
    border: 1px solid var(--borders-and-dividers-colors);
    border-radius: 10px;
    cursor: pointer;
    transition: background-color 0.3s, transform 0.3s;
    background-color: var(--background-bottom-navigation);
}

.account-card:hover {
    background-color:var(--background-bottom-navigation);
    transform: scale(1.02);
}

.account-icon {
    width: 35px;
    height: 35px;
    margin-right: 10px;
}

.account-details {
    display: flex;
    flex-direction: column;
}

.account-pix-key {
    font-size: 10px;
    color: var(--text-color);
}

.account-pix-type {
    font-size: 10px;
    color: var(--text-color);
}

.hidden-select {
    display: none;
}

.borisg {
    border-bottom-width: solid;
    border-bottom-width: 1px;
    border-color: var(--borders-and-dividers-colors);
}
.textsss {
      font-family: 'Roboto', sans-serif;
font-weight: 300; /* Ajusta a espessura da fonte */
color: var(--value-color-navtop);
font-size: 12px;
text-decoration: underline;
text-decoration-color: var(--value-color-navtop);
text-decoration-thickness: 1px;
text-underline-offset: 2px;
}
.textssss {
    font-family: 'Roboto', sans-serif;
font-weight: 300; /* Ajusta a espessura da fonte */
color: var(--value-color-navtop);
font-size: 14px;
text-decoration: underline;
text-decoration-color: var(--value-color-navtop);
text-decoration-thickness: 1px;
text-underline-offset: 2px;
}
.inputs {
    border-width: solid;
    border-width: 1px;
    border-color: var(--borders-and-dividers-colors);
    border-radius: 10px;
}

.borisgs {
    border-width: solid;
    border-width: 1px;
    border-color: var(--borders-and-dividers-colors);
    border-radius: 10px;
}

.btn-border-transparent-yellow {
  border-width: 1px;
  border-width: solid;
  background-color: transparent;
  border-color: var(--borders-and-dividers-colors);
}

.bordinha-1 {
    height: 50px;
    border-radius: 10px;
    font-size: 16px;
    padding: 8px;
    border-width: solid;
    border-width: 1px;
    border-color: var(--botao-deposito-border-saq);
    background-color: var(--botao-deposito-background-saq);
}

.textss{
    font-size: 16px;
    color: var(--botao-deposito-text-saq);
}

.btn-border-transparent-yellow:hover {
  background-color: #F9FD4E; /* Amarelo */
  color: var(--text-color);
}

.btn-border-transparent-yellow-1 {
  background-color: transparent;
  border: 1px solid var(--borders-and-dividers-colors);
  border-radius: 10px;
  cursor: pointer;
  background-color:var(--background-bottom-navigation);
}  

.items-container {
  margin-top: 45px; 
}

.input::-webkit-input-placeholder {
  color: var(--placeholder-color);
}

.input:-moz-placeholder {
  color: var(--placeholder-color);
}

.input::-moz-placeholder {
  color: var(--placeholder-color);
}

.input:-ms-input-placeholder {
  color: var(--placeholder-color);
}

.input::placeholder {
  color: var(--placeholder-color);
}


.password-section {
  display: flex;
  flex-direction: column;
}
.password-input__label {
  display: flex;
  justify-content: space-between;
  margin-bottom: 10px;
}
.pin-container {
  display: flex;
  justify-content: space-between;
  background-color: var(--background-bottom-navigation);
  border: 1px solid var(--borders-and-dividers-colors);
  border-radius: 10px;
  height: 75px;
}


.custom-pin-input {
  flex: 1;
  height: 100%;
  width: 16%;
  text-align: center;
  font-size: 25px;
  color: var(--text-color);
  background: transparent;
  border-top: none;
  border-bottom: none;
  border-left: 1px solid var(--borders-and-dividers-colors); /* Aplica borda direita padrão */
  border-right: 1px solid var(--borders-and-dividers-colors); /* Aplica borda direita padrão */
  outline: none; /* Remove a borda de foco padrão */
  margin: 0;
}

.custom-pin-input:last-child {
  border-top: none;
  border-bottom: none;
  border-right: none; /* Remove a borda direita do último input */
}
.custom-pin-input:first-child {
  border-left: none; /* Adiciona borda esquerda ao primeiro input */
}

/* Remove efeitos de hover e foco na borda */
.custom-pin-input:focus,
.custom-pin-input:hover {
  border-top: none;
  border-bottom: none;
  border-left: 1px solid var(--borders-and-dividers-colors); /* Aplica borda direita padrão */
  border-right: 1px solid var(--borders-and-dividers-colors); /* Garante que a borda direita seja sempre aplicada */
  box-shadow: none; /* Remove qualquer sombra que possa aparecer */
}
</style>
