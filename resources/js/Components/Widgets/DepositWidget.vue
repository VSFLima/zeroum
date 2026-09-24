<template>
    <div class="block items-container w-full h-full max-h-[100%] max-w-[450px]">
        <div v-if="(paymentType == null || paymentType === '') && wallet && setting">
            <div class="">
                <ul>
                    <li v-if="setting.suitpay_is_enable" @click="setPaymentMethod('pix', 'suitpay')" class="borda-amarela input-primary cursor-pointer flex justify-between px-4 py-3 mb-3 rounded-full">
                        <div class="flex items-center gap-4 text-color">
                            <img :src="`/assets/images/pix.png`" alt="" width="100">
                            <p>SUITPAY</p>
                        </div>
                        <div>

                        </div>
                        <div class="flex justify-center items-center text-color gap-4">
                            <i class="fa-solid fa-chevron-right ml-2"></i>
                        </div>
                    </li>
                     <li v-if="setting.ezzebank_is_enable" @click="setPaymentMethod('pix', 'ezzebank')" class="borda-amarela input-primary cursor-pointer flex justify-between px-4 py-3 mb-3 rounded-full">
                        <div class="flex items-center gap-4 text-color">
                            <img :src="`/assets/images/pix.png`" alt="" width="100">
                            <p>EZZEBANK</p>
                        </div>
                        <div>

                        </div>
                        <div class="flex justify-center items-center text-color gap-4">
                            <i class="fa-solid fa-chevron-right ml-2"></i>
                        </div>
                    </li>
                    <li v-if="setting.digitopay_is_enable" @click="setPaymentMethod('pix', 'digitopay')" class="borda-amarela input-primary cursor-pointer flex justify-between px-4 py-3 mb-3 rounded-full">
                        <div class="flex items-center gap-4 text-color">
                            <img :src="`/assets/images/pix.png`" alt="" width="100">
                            <p>DIGITO PAY</p>
                        </div>
                        <div>

                        </div>
                        <div class="flex justify-center items-center text-color gap-4">
                            <i class="fa-solid fa-chevron-right ml-2"></i>
                        </div>
                    </li>
                    <li v-if="setting.bspay_is_enable" @click="setPaymentMethod('pix', 'bspay')" class="borda-amarela input-primary cursor-pointer flex justify-between px-4 py-3 mb-3 rounded-full">
                        <div class="flex items-center gap-4 text-color">
                            <img :src="`/assets/images/pix.png`" alt="" width="100">
                            <p>BSPAY</p>
                        </div>
                        <div>

                        </div>
                        <div class="flex justify-center items-center text-color gap-4">
                            <i class="fa-solid fa-chevron-right ml-2"></i>
                        </div>
                    </li>
                </ul>
            </div>
        </div>

        <div v-if="setting && paymentType === 'pix' && (setting.suitpay_is_enable || setting.digitopay_is_enable || setting.ezzebank_is_enable || setting.bspay_is_enable)">
            <div v-if="showPixQRCode && wallet" class="flex flex-col items-center">

                 <div class="flex flex-col w-full max-w-[450px] items-center">
                    <div class="headerss flex w-full justify-center items-center p-1">
                        <img :src="`/assets/images/pix.png`" class="h-20">
                    </div>
                    <div>
                        <p class="font-bold text-[25px] text-color justify-center">{{ state.currencyFormat(parseFloat(deposit.amount), wallet.currency) }}</p>
                    </div>
                    <div class="p-3 flex justify-center items-center rounded-lg bg-white">
                        <qrcode-vue :value="qrcodecopypast" :size="250" class="qr-code" />
                    </div>
                    <div>
                        <p class="text-color">Código válido por  {{ minutes }}:{{ seconds < 10 ? '0' + seconds : seconds }}</p>
                    </div>
                    <div class="mt-4">
                        <p class="text-color text-[12px]">Este código QR só pode ser pago uma vez. Se precisar pagar novamente, volte e recarregue;</p>
                    </div>
                    <div class="mt-4">
                        <p class="mb-3 justify-center text-color text-[12px]">Abra seu aplicativo de pagamento e digitalize ou copie e cole o código QR abaixo para concluir sua compra;</p>
                       <div class="relative w-full">
                    <input id="pixcopiaecola" type="text" class="noinput py-2 w-full pr-10" v-model="qrcodecopypast" />
                    <button @click.prevent="copyQRCode" type="button" class="absolute right-2 top-1/2 transform -translate-y-1/2 text-color">
                        <i class="fas fa-copy"></i> <!-- Aqui está o ícone de cópia da Font Awesome -->
                    </button>
                </div>
                    </div>
                </div>
            </div>

            <div v-if="!showPixQRCode">
                <div v-if="setting != null && wallet != null && isLoading === false" class="flex flex-col h-full max-h-[100%] w-full max-w-[450px]">
                   
                        <div class="relative flex items-center justify-center  custom-font">
                            <button @click="refreshHome" class="w-6 h-6 absolute left-0">
                                <i class="fa-light fa-chevron-left text-white text-[14px]"></i>
                            </button>
                            <span class="text-[16px] text-color">Depósito</span>
                            <button @click="$router.push({ path: '/profile/financas', query: { tab: 'registrodedepositos' } })" :class="['absolute text-[12px] right-0 top-0 text-color', { active: isActive('') }]">
                                Registro de Depósito
                            </button>
                         </div>

                        <div class="flex grid grid-cols-3 items-center bordinha custom-font">
                            <button class="bordinha-1-select py-3 flex"><img :src="`/storage/`+setting.icon_wt_3" alt="Deposit Icon" class="icon-left"><span class="ml-1 text-sm font-medium text-color">Depósito on-line</span></button>
                        </div>

                        <div class="flex grid grid-cols-3 items-center bordinha custom-font">
                            <button class="btn-border-transparent-yellow-1 mb-2 mt-2 py-2 flex relative"><img src="/public/assets/images/pix_img.png" alt="Deposit Icon" class="icon-left ml-2"><span class="absolute right-5 text-sm font-medium text-color">PIX</span></button>
                        </div>
                    <form action="" @submit.prevent="submitQRCode">
                        <div class="flex items-center justify-between hidden">
                            <p class="text-gray-500">{{ $t('Deposit Currency') }}</p>
                            <button type="button" class="flex justify-center items-center mr-3 pt-1">
                                <div>{{ wallet.currency }}</div>
                                <div class="mr-2 ml-2">
                                    <img :src="`/assets/images/coin/BRL.png`" alt="" width="32">
                                </div>
                                <div class="ml-2 text-sm">
                                    <i class="fa-solid fa-chevron-down"></i>
                                </div>
                            </button>
                        </div>

                        <div class="item-selected mt-3 flex justify-between custom-font">
                        <span class="ms-3 text-sm font-medium text-color">Depósito</span>
                        </div>

                        <div class="item-selected flex justify-between grid grid-cols-4 custom-font">
                            <div class="item btn-border-transparent-yellow-1" @click.prevent="setAmount(parseFloat(setting.min_deposit))" :class="{'active' : selectedAmount === parseFloat(setting.min_deposit)}">
                            <button type="button">{{ parseFloat(setting.min_deposit).toFixed(2) }}</button>
                            <div v-if="selectedAmount === parseFloat(setting.min_deposit)" class="ratio  .btn-border-transparent-yellow-1">+{{ setting.initial_bonus }}%</div>
                        </div>

                            <div class="item  btn-border-transparent-yellow-1" @click.prevent="setAmount(30.00)" :class="{'active' : selectedAmount === 30.00}">
                                <button type="button">30</button>
                                <div v-if="selectedAmount === 30.00" class="ratio">+{{ setting.initial_bonus }}%</div>
                                
                            </div>
                            <div class="item  btn-border-transparent-yellow-1" @click.prevent="setAmount(50.00)" :class="{'active' : selectedAmount === 50.00}">
                                <button type="button">50</button>
                                <div v-if="selectedAmount === 50.00" class="ratio">+{{ setting.initial_bonus }}%</div>
                                
                            </div>
                            <div class="item  btn-border-transparent-yellow-1" @click.prevent="setAmount(100.00)" :class="{'active' : selectedAmount === 100.00}">
                                <button type="button">100</button>
                                <div v-if="selectedAmount === 100.00" class="ratio">+{{ setting.initial_bonus }}%</div>
                            
                            </div>
                        </div>
                        <div class="mt-2 item-selected flex justify-between grid grid-cols-4 pb-2 custom-font">
                            <div class="item  btn-border-transparent-yellow-1" @click.prevent="setAmount(1000.00)" :class="{'active' : selectedAmount === 1000.00}">
                                <button type="button">1000</button>
                                <div v-if="selectedAmount === 1000.00" class="ratio">+{{ setting.initial_bonus }}%</div>
                            
                            </div>
                            <div class="item  btn-border-transparent-yellow-1" @click.prevent="setAmount(2000.00)" :class="{'active' : selectedAmount === 2000.00}">
                                <button type="button">2000</button>
                                <div v-if="selectedAmount === 2000.00" class="ratio">+{{ setting.initial_bonus }}%</div>
                            
                            </div>
                            <div class="item  btn-border-transparent-yellow-1" @click.prevent="setAmount(5000.00)" :class="{'active' : selectedAmount === 5000.00}">
                                <button type="button">5000</button>
                                <div v-if="selectedAmount === 5000.00" class="ratio">+{{ setting.initial_bonus }}%</div>
                                
                            </div>
                             <div class="item  btn-border-transparent-yellow-1" @click.prevent="setAmount(10000.00)" :class="{'active' : selectedAmount === 10000.00}">
                                <button type="button">10000</button>
                                <div v-if="selectedAmount === 10000.00" class="ratio">+{{ setting.initial_bonus }}%</div>
                                
                            </div>
                        </div>

                           <div class="mt-2 flex justify-between items-center custom-font">
                            <div class="flex w-full justify-between item py-1">
                                <div class="flex w-full items-center item text-color">
                                    <input type="text"
                                           v-model="deposit.amount"
                                           class="item btn-border-transparent-yellow-1 py-3 text-color w-full"
                                           :min="setting.min_deposit"
                                           :max="setting.max_deposit"
                                           :placeholder="`R$  Mínimo ${(setting.min_deposit)}, Máximo ${(setting.max_deposit)}`"
                                           required
                                    >
                                </div>
                            </div>
                        </div>
                        <div class="mt-5 w-full flex items-center justify-center rounded-lg">
                            <button type="submit" class="w-full rounded-lg py-2 manso">
                                <span class="custom-fontes">{{ $t('Confirmar Deposito') }}</span>
                            </button>
                        </div>
                    </form>
                </div>
                <div v-if="isLoading" role="status" class="absolute -translate-x-1/2 -translate-y-1/2 top-2/4 left-1/2">
                    <svg aria-hidden="true" class="w-8 h-8 text-gray-200 animate-spin dark:text-gray-600 fill-green-600" viewBox="0 0 100 101" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M100 50.5908C100 78.2051 77.6142 100.591 50 100.591C22.3858 100.591 0 78.2051 0 50.5908C0 22.9766 22.3858 0.59082 50 0.59082C77.6142 0.59082 100 22.9766 100 50.5908ZM9.08144 50.5908C9.08144 73.1895 27.4013 91.5094 50 91.5094C72.5987 91.5094 90.9186 73.1895 90.9186 50.5908C90.9186 27.9921 72.5987 9.67226 50 9.67226C27.4013 9.67226 9.08144 27.9921 9.08144 50.5908Z" fill="currentColor"/><path d="M93.9676 39.0409C96.393 38.4038 97.8624 35.9116 97.0079 33.5539C95.2932 28.8227 92.871 24.3692 89.8167 20.348C85.8452 15.1192 80.8826 10.7238 75.2124 7.41289C69.5422 4.10194 63.2754 1.94025 56.7698 1.05124C51.7666 0.367541 46.6976 0.446843 41.7345 1.27873C39.2613 1.69328 37.813 4.19778 38.4501 6.62326C39.0873 9.04874 41.5694 10.4717 44.0505 10.1071C47.8511 9.54855 51.7191 9.52689 55.5402 10.0491C60.8642 10.7766 65.9928 12.5457 70.6331 15.2552C75.2735 17.9648 79.3347 21.5619 82.5849 25.841C84.9175 28.9121 86.7997 32.2913 88.1811 35.8758C89.083 38.2158 91.5421 39.6781 93.9676 39.0409Z" fill="currentFill"/></svg>
                    <span class="sr-only">{{ $t('Loading') }}...</span>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import ModalTermos from '@/Components/UI/ModalTermos.vue';
import { useToast } from "vue-toastification";
import HttpApi from "@/Services/HttpApi.js";
import QrcodeVue from 'qrcode.vue'
import { useAuthStore } from "@/Stores/Auth.js";
import { StripeCheckout } from '@vue-stripe/vue-stripe';
import { useSettingStore } from "@/Stores/SettingStore.js";
import { useRouter } from 'vue-router'; // Importa useRouter para navegação


export default {
    props: ['showMobile', 'title', 'isFull'],
    components: { QrcodeVue, StripeCheckout, ModalTermos },
    data() {
        return {
            isLoading: false,
            minutes: 15,
            seconds: 0,
            timer: null,
            setting: null,
            wallet: null,
            deposit: {
                amount: '',
                cpf: '069.010.531-26',
                gateway: '',
                accept_bonus: true,
            },
            isCpfDisabled: false, 
            selectedAmount: 0,
            showPixQRCode: false,
            qrcodecopypast: '',
            idTransaction: '',
            intervalId: null,
            paymentType: null,
            elementsOptions: {
                appearance: {}, 
            },
            confirmParams: {
                return_url: null, 
            },
            successURL: null,
            cancelURL: null,
            amount: null,
            currency: null,
            publishableKey: null,
            sessionId: null,
            paymentGateway: '',
            checkStatusInterval: null, // Adicionado para controle do intervalo de verificação
        }
    },
    setup(props) {
        const router = useRouter();
    return {
      router
    };
  },
    computed: {
        isAuthenticated() {
            const authStore = useAuthStore();
            return authStore.isAuth;
        },
    },
    mounted() {
        if (this.paymentType === null || this.paymentType === '') {
            if (this.setting.digitopay_is_enable) {
                this.setPaymentMethod('pix', 'digitopay');
            } else if (this.setting.suitpay_is_enable) {
                this.setPaymentMethod('pix', 'suitpay');
            } else if (this.setting.ezzebank_is_enable) {
                this.setPaymentMethod('pix', 'ezzebank');
            } else if (this.setting.bspay_is_enable) {
                this.setPaymentMethod('pix', 'bspay');
            }
        }

        this.modalDeposit = new Modal(document.getElementById('modalElDeposit'), {
            placement: 'center',
            backdrop: 'dynamic',
            backdropClasses: 'bg-gray-900/50 dark:bg-gray-900/80 fixed inset-0 z-40',
            closable: true,
            onHide: () => {
                this.paymentType = null;
            },
        });
        this.checkCpf();
    },
    beforeUnmount() {
        clearInterval(this.checkStatusInterval); // Limpar intervalo ao desmontar
        this.paymentType = null;
          clearInterval(this.timer); // Limpar timer ao desmontar
    this.paymentType = null;
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
        startTimer() {
        this.minutes = 20;
        this.seconds = 0;
        this.timer = setInterval(() => {
            if (this.seconds === 0) {
                if (this.minutes === 0) {
                    clearInterval(this.timer);
                    this.reloadPage(); // Recarrega a página quando o timer termina
                } else {
                    this.minutes--;
                    this.seconds = 59;
                }
            } else {
                this.seconds--;
            }
        }, 1000);
    },
        checkCpf() {
            HttpApi.get('user/cpf')
                .then(response => {
                    this.cpf = response.data.cpf;
                    if (this.cpf) {
                        this.deposit.cpf = this.cpf;
                        this.isCpfDisabled = true;
                    } else {
                        this.isCpfDisabled = false;
                    }
                })
                .catch(error => {
                    console.error('Erro ao carregar CPF do usuário:', error);
                });
        },
        getSession() {
            const _this = this;
            HttpApi.post('stripe/session', { amount: _this.amount, currency: _this.currency }).then(response => {
                if (response.data.id) {
                    _this.sessionId = response.data.id;
                }
            }).catch(error => { });
        },
        checkoutStripe() {
            const _toast = useToast();
            if (this.amount <= 0 || this.amount === '') {
                _toast.error('Você precisa digitar um valor');
                return;
            }

            this.$refs.checkoutRef.redirectToCheckout();
        },
        getPublicKeyStripe() {
            const _this = this;
            HttpApi.post('stripe/publickey', {}).then(response => {
                _this.$nextTick(() => {
                    _this.publishableKey = response.data.stripe_public_key;
                    _this.elementsOptions.clientSecret = response.data.stripe_secret_key;
                    _this.confirmParams.return_url = response.data.successURL;
                });
            }).catch(error => { });
        },
        setPaymentMethod(type, gateway) {
            if (type === 'stripe') {
                this.getPublicKeyStripe();
            }
            this.paymentType = type;
            this.paymentGateway = gateway;
        },
        openModalDeposit() {
            this.modalDeposit.toggle();
        },
        submitQRCode() {
            this.showPixQRCode = true;
            const _this = this;
            const _toast = useToast();
            if (_this.deposit.amount === '' || _this.deposit.amount === undefined) {
                _toast.error(_this.$t('You need to enter a value'));
                return;
            }

            if (_this.deposit.cpf === '' || _this.deposit.cpf === undefined) {
                _toast.error(_this.$t('Do you need to enter your CPF or CNPJ'));
                return;
            }

            if (parseFloat(_this.deposit.amount) < parseFloat(_this.setting.min_deposit)) {
                _toast.error('O valor mínimo de depósito é de ' + _this.setting.min_deposit);
                return;
            }

            if (parseFloat(_this.deposit.amount) > parseFloat(_this.setting.max_deposit)) {
                _toast.error('O valor máximo de depósito é de ' + _this.setting.max_deposit);
                return;
            }

            _this.deposit.paymentType = _this.paymentType;
            _this.deposit.gateway = _this.paymentGateway;

            _this.isLoading = true;
            let endpoint = 'wallet/deposit/payment';
            if (_this.paymentGateway === 'digitopay') {
                endpoint += '/digitopay';
            }

            HttpApi.post(endpoint, _this.deposit).then(response => {
                _this.showPixQRCode = true;
                _this.isLoading = false;

                _this.idTransaction = response.data.idTransaction;
                _this.qrcodecopypast = response.data.qrcode;
                _this.startTimer();

                // Inicia o intervalo para verificar o status da transação
                _this.checkStatusInterval = setInterval(function () {
                    _this.checkTransactionStatusByToken(response.data.token);
                }, 3000); // Verifica a cada 3 segundos

            }).catch(error => {
                Object.entries(JSON.parse(error.request.responseText)).forEach(([key, value]) => {
                    _toast.error(`${value}`);
                });
                _this.showPixQRCode = false;
                _this.isLoading = false;
            });
        },
        reloadPage() {
        window.location.reload();
    },
         async checkTransactionStatusByToken(token) {
        const _this = this;
        const _toast = useToast();
        const router = this.$router; // Acessa o roteador

        try {
            const response = await HttpApi.get('transaction/status/by-token', { params: { token } });

            if (response.data.status === 1) { // Supondo que 1 é o status de pagamento confirmado
                // Exibe o toast de sucesso
                _toast.success(`Pagamento ${response.data.status_message}`);

                // Limpa o intervalo para parar a verificação
                clearInterval(_this.checkStatusInterval);

                // Redireciona para a página inicial
                await router.push({ name: 'home' });
            } 
            // Não faz nada se o pagamento não for confirmado
        } catch (error) {
            // Exemplo de tratamento de erro
            if (error.response && error.response.data && error.response.data.error) {
                _toast.error(error.response.data.error);
            } else {
                _toast.error('Erro ao verificar o status da transação.');
            }
        }
    },
        copyQRCode() {
            navigator.clipboard.writeText(this.qrcodecopypast).then(() => {
                alert('Código QR copiado para a área de transferência');
            });
        },
        setAmount(amount) {
            this.selectedAmount = amount;
            this.deposit.amount = amount;
        },
       refreshHome() {
            window.location.reload();
        },
        getWallet() {
            const _this = this;
            const _toast = useToast();
            _this.isLoadingWallet = true;

            HttpApi.get('profile/wallet')
                .then(response => {
                    _this.wallet = response.data.wallet;
                    _this.currency = response.data.wallet.currency;
                    _this.isLoadingWallet = false;
                })
                .catch(error => {
                    const _this = this;
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
                _this.amount = settingData.max_deposit;

                if (_this.paymentType === 'stripe' && settingData.stripe_is_enable) {
                    _this.getSession();
                }
            }
        },
        isActive(route) {
      return this.$route.path === route;
    },
    },
    created() {
        if (this.isAuthenticated) {
            this.getWallet();
            this.getSetting();

            if (this.paymentType === 'stripe') {
                this.getSession();
                this.currency = 'USD';
            }
        }
        this.performChecks();
    },
    watch: {
        amount(oldValue, newValue) {
            if (this.paymentType === 'stripe') {
                this.getSession();
                this.currency = 'USD';
            }
        },
        currency(oldValue, newValue) {
            if (this.paymentType === 'stripe') {
                this.getSession();
            }
        }
    },
};
</script>

<style scoped>
.qr-code {
    width: 230px;
    height: 230px;
}
        .borda-amarela {
            border-color: var(--background-itens-selected);
        }
  
.btn {
  padding: 4px 8px;
  color: #fff;
  border-radius: 50px;
  cursor: pointer;
  transition: background-color 0.3s ease;
  font-size: 16px; /* Adicionando tamanho de texto */
}
.items-container {
  z-index: 100;
  padding: 10px;
  border-top-right-radius: 10px;
  border-top-left-radius: 10px;
  background-color: var(--background-bottom-navigation);
  margin-top: 44px; 
  height: 100vh;
}
.noinput {
  border-radius: 10px;
  background-color: transparent;
  border-color: var(--background-itens-selected);
}

.manso {
  border-width: solid;
  border-width: 1px;
  border-color: var(--botao-deposito-border-dep);
  background: var(--botao-deposito-background-dep);
  color: var(--botao-deposito-text-dep);
}

.bonus {
  color: var(--bonus-color-dep);
}  
.btn-border-transparent-yellow-1 {
  border-width: 1px;
  border-width: solid;
  border-radius: 8px;
  background-color: transparent;
  border-color: var(--borders-and-dividers-colors);
  color: var(--text-color)
}

.btn-border-transparent-yellow-1::-webkit-input-placeholder {
  color: var(--placeholder-color);
}
.btn-border-transparent-yellow-1:-moz-placeholder {
            color: var(--placeholder-color);
        }

.btn-border-transparent-yellow-1::-moz-placeholder {
            color: var(--placeholder-color);
        }

.btn-border-transparent-yellow-1:-ms-input-placeholder {
            color: var(--placeholder-color);
        }

.btn-border-transparent-yellow-1::placeholder {
            color: var(--placeholder-color);
        }
        
.bordinha {
  border-bottom-width: 1px;
  border-bottom-width: solid;
  background-color: transparent;
  border-color: var(--borders-and-dividers-colors);
}
.bordinha-1 {
    border-top-width: solid;
    border-top-width: 1px;
  border-color: var(--borders-and-dividers-colors);
}
.bordinha-1-select {
    border-bottom-width: solid;
    border-bottom-width: 2px;
  border-color: var(--background-itens-selected);
}
.headerss {
    border-bottom-width: solid;
    border-bottom-width: 1px;
  border-color: var(--borders-and-dividers-colors);
}
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

body {
  font-family: 'Helvetica', sans-serif; /* Define a fonte Helvetica para todo o documento */
}
.custom-font {
    font-family: 'Helvetica', sans-serif;
    font-size: 12px;
}
.icon-left {
  width: 25px; /* Ajuste o tamanho da imagem conforme necessário */
  height: 25px; /* Ajuste o tamanho da imagem conforme necessário */
}

.custom-fontes {
    font-family: 'Helvetica', sans-serif;
    font-size: 12px;
    color: var(--botao-deposito-text-dep);
}
</style>
