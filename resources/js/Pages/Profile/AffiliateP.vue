<template>
        <div class="container mx-auto pl-2 pr-2 relative custom-font min-h-[calc(100vh-565px)]">
            <div class="flex flex-col justify-between rounded-lg background-bottom-navigation p-2">
                <div class="link-section">
                    <div class="link-text">URL do convite</div>
                    <div class="link-input">
                        <div class="link-display text-color">
                            <div class="link-content">{{ referencelink }}</div>
                            <button class="copy-btn" @click="copyToClipboard(referencelink)">
                                <i class="far fa-copy"></i>
                            </button>
                        </div>
                    </div>
                </div>
                <div class="info-section flex flex-col text-color">
                    <span> Código de Convite: <span class="number">{{ referencecode }}</span>
                        <button class="copy-btn-id ml-2" @click="copyToClipboard(referencecode)">
                            <i class="far fa-copy"></i>
                        </button>
                    </span>
                </div>
            </div>
            
            <div class="flex scroll-container">
                <div class="share-item">
                    <div class="icon-circle">
                        <a :href="referencelink" target="_blank" rel="noopener noreferrer">
                            <i class="fa-regular fa-share-from-square"></i>
                        </a>
                    </div>
                    <span class="text-color">Compartilhe</span>
                </div>
                <div class="share-item">
                    <a :href="'https://www.facebook.com/sharer/sharer.php?u=' + referencelink" target="_blank" rel="noopener noreferrer">
                        <i class="fab fa-facebook text-blue-500 text-4xl"></i>
                    </a>
                    <span class="text-color">Facebook</span>
                </div>
                <div class="share-item">
                    <a :href="'https://t.me/share/url?url=' + referencelink" target="_blank" rel="noopener noreferrer">
                        <i class="fab fa-telegram text-blue-500 text-4xl"></i>
                    </a>
                    <span class="text-color">Telegram</span>
                </div>
                <div class="share-item">
  <a href="https://www.instagram.com" 
     target="_blank" 
     rel="noopener noreferrer" 
     @click.prevent="handleInstagramClick">
    <i class="fab fa-instagram text-pink-500 text-4xl"></i>
  </a>
  <span>Instagram</span>
</div>
                <div class="share-item">
                    <a :href="'https://api.whatsapp.com/send?text=' + referencelink" target="_blank" rel="noopener noreferrer">
                        <i class="fab fa-whatsapp text-green-500 text-4xl"></i>
                    </a>
                    <span class="text-color">Whatsapp</span>
                </div>
                <div class="share-item">
                    <a :href="'https://twitter.com/intent/tweet?url=' + referencelink" target="_blank" rel="noopener noreferrer">
                        <i class="fab fa-twitter text-blue-400 text-4xl"></i>
                    </a>
                    <span class="text-color">Twitter</span>
                </div>
            </div>
            <div v-if="wallet && !isLoading" class="grid grid-cols-1 gap-0">
                <div class="col-span-2 w-full">
                    <div class="grid grid-cols-1 gap-0 background-bottom-navigation rounded-lg">
                        <div class="flex justify-end items-center mr-5 px-4 py-2 w-full">
                            <button @click.prevent="openModalWithdrawal" type="button" class="backsf rounded-lg">
                                {{ $t('Sacar') }}
                            </button>
                        </div>
                        <div class="flex justify-between items-center px-4 py-2 w-full bordics">
                            <h1 class="text-color">{{ $t('Total de recompensas') }}</h1>
                            <h2 class="text-color">{{ state.currencyFormat(parseFloat(wallet.refer_rewards), wallet.currency) }}</h2>
                        </div>
                        <div class="flex justify-between items-center px-4 py-2 w-full bordics">
                            <h1 class="text-color">{{ $t('Total de Referencias') }}</h1>
                            <h2 class="text-color">{{ indications }}</h2>
                        </div>
                    </div>

                    <div class="grid grid-cols-1 gap-0 background-bottom-navigation rounded-lg mt-2">
                        <div class="flex justify-between items-center px-4 py-2 w-full">
                            <h2 class="text-color">{{ $t('Revshare') }}</h2>
                            <h1 class="text-color">{{ userData.affiliate_revenue_share_fake ? userData.affiliate_revenue_share_fake : userData.affiliate_revenue_share }}%</h1>
                        </div>
                        <div class="flex justify-between items-center px-4 py-2 w-full bordics">
                            <h2 class="text-color">{{ $t('CPA') }}</h2>
                            <h1 class="text-color">{{ state.currencyFormat(parseFloat(userData.affiliate_cpa), wallet.currency) }}</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- MODAL SAQUE -->
        <div v-if="showWithdrawalModal" id="withdrawalEl" tabindex="-1" aria-hidden="true" class="fixed inset-0 z-40 flex items-center justify-center w-full">
            <div class="flex bg-black bg-opacity-40 w-full max-w-[450px] h-full items-center justify-center">
                <div class="relative max-h-full w-full max-w-[420px] z-50 ">
                    <!-- Modal content -->
                    <div class="relative rounded-lg background-bottom-navigation">
                        <!-- Modal header -->
                        <div class="flex justify-end p-4 rounded-t-lg ">
                            <button @click.prevent="closeModalWithdrawal">
                                <i class="fa-solid fa-xmark"></i>
                            </button>
                        </div>

                        <!-- Modal body -->
                        <div class="flex flex-col w-full justify-center p-4 bordics">
                            <form @submit.prevent="makeWithdrawal">
                                <div class="text-color mb-3">
                                    <label for="">Valor do Saque</label>
                                    <input v-model="withdrawalForm.amount" type="number" class="inputs text-color" placeholder="Valor do saque" required>
                                    <span v-if="wallet" class="text-sm italic text-color">Saldo: {{ state.currencyFormat(parseFloat(wallet?.refer_rewards), wallet?.currency) }}</span>
                                </div>

                                <div class="text-color mb-3">
                                    <label for="">Chave Pix</label>
                                    <input v-model="withdrawalForm.pix_key" type="text" class="inputs text-color" placeholder="Digite seu CPF ou CNPJ" required>
                                </div>

                                <div class="text-color0 mb-3">
                                    <label for="">Tipo de Chave</label>
                                    <select v-model="withdrawalForm.pix_type" name="type_document" class="inputs text-color" required>
                                        <option value="document">CPF/CNPJ</option>
                                    </select>
                                </div>

                                <button type="submit" class="mt-5 w-full text-color backsf px-4 py-2 rounded-lg transition duration-700">
                                    Solicitar SAQUE
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</template>

<script>
import BauLayout from "@/Layouts/BauLayout.vue";
import HttpApi from "@/Services/HttpApi.js";
import {useToast} from "vue-toastification";
import {useAuthStore} from "@/Stores/Auth.js";
import {useRouter} from "vue-router";

export default {
    components: { BauLayout },
    data() {
        return {
            isLoading: false,
            isShowForm: false,
            isLoadingGenerate: false,
            code: '',
            urlCode: '',
            referencecode: '',
            referencelink: '',
            wallet: null,
            indications: 0,
            histories: null,
            showWithdrawalModal: false,
            withdrawalForm: {
                amount: 0,
                pix_key: '',
                pix_type: 'document',  // Default to CPF/CNPJ
            }
        }
    },
    setup() {
        const router = useRouter();
        return { router };
    },
    computed: {
        userData() {
            const authStore = useAuthStore();
            return authStore.user;
        }
    },
    methods: {
        copyToClipboard(text) {
            navigator.clipboard.writeText(text).then(() => {
                useToast().success('Copiado com sucesso!');
            }, () => {
                useToast().error('Falha ao copiar.');
            });
        },
        openModalWithdrawal() {
            this.showWithdrawalModal = true;
        },
        closeModalWithdrawal() {
            this.showWithdrawalModal = false;
        },
       handleInstagramClick() {
      this.copyToClipboard(this.referencelink);
      window.open('https://www.instagram.com', '_blank');
    },
        makeWithdrawal() {
            const _this = this;
            const _toast = useToast();

            _this.isLoading = true;

            HttpApi.post('profile/affiliates/request', _this.withdrawalForm)
                .then(response => {
                    _this.closeModalWithdrawal();

                    _toast.success(_this.$t(response.data.message));
                    _this.isLoading = false;
                    _this.router.push({ name: 'profileWallet' });
                })
                .catch(error => {
                    Object.entries(JSON.parse(error.request.responseText)).forEach(([key, value]) => {
                        _toast.error(`${value}`);
                    });
                    _this.isLoading = false;
                });
        },
        getCode() {
            const _this = this;
            const _toast = useToast();
            _this.isLoadingGenerate = true;

            HttpApi.get('profile/affiliates/')
                .then(response => {
                    if (response.data.code) {
                        _this.isShowForm = true;
                        _this.code = response.data.code;
                        _this.referencecode = response.data.code;
                        _this.urlCode = response.data.url;
                    }

                    _this.indications = response.data.indications;
                    _this.referencelink = response.data.url;
                    _this.wallet = response.data.wallet;
                    _this.withdrawalForm.amount = response.data.wallet.refer_rewards;

                    _this.isLoadingGenerate = false;
                })
                .catch(error => {
                    _this.isShowForm = false;
                    _this.isLoadingGenerate = false;
                });
        },
    },
    mounted() {
        this.getCode();
    },
    created() {
        this.getCode();
    }
};
</script>

<style scoped>
.inputs {
    background-color: var(--background-color-cassino);
    border: 1px solid var(--borders-and-dividers-colors);
    border-radius: 10px;
    padding: 0.5rem;
    width: 100%;
}
.bordics {
    border-top-width: 1px;
    border-top-width: solid;
    border-color: var(--borders-and-dividers-colors);
}

.backsf {
    padding: 5px 5px;
    background-color: var(--background-color-cassino);
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

.custom-icon-container {
    padding: 10px;
}

.custom-icon {
    width: 40px;
    height: 40px;
    object-fit: cover;
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
    color: var(--text-color);
   font-size: 14px;
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
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

body {
  font-family: 'Helvetica', sans-serif; /* Define a fonte Helvetica para todo o documento */
}
.custom-font {
    font-family: 'Helvetica', sans-serif;
    font-style: normal;
    font-weight: 400;
    color: var(--text-color);
}

</style>
