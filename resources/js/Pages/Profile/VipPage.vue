<template>

        <LoadingComponent :isLoading="isLoading">
            <div class="text-center text-color">
                <span>{{ $t('Loading vips') }}</span>
            </div>
        </LoadingComponent>

        <div v-if="!isLoading" class="w-full btese max-w-[450px] mx-auto pl-2 pr-2 custom-font">
            <div>
                <div class="level-actual relative background-bottom-navigation rounded-lg">
                    <div class="absolute top-0 left-0 text-color px-3 py-2 site-menu-item rounded-tl-lg rounded-br-lg">
                        {{ $t('Current level') }}
                    </div>

                    <div class="pt-6">
                        <div class="flex justify-between text-color items-center self-center w-full p-4 custom-font-3">
                            <div>
                                <!-- Imagem exibida do level atual-->
                                <img :src="currentLevelImage" alt="" width="50">
                            </div>
                            <div class="flex flex-col justify-between gap-2">
                                <a class="font-bold text-primary">
                                    <span class="font-normal text-color"> Para Alcançar</span>
                                </a>
                                 <a class="font-bold title-color">
                                    VIP {{ nextLevel?.bet_level }}
                                </a>
                            </div>
                            <div class="flex flex-col justify-between gap-2">
                                <a class="font-bold text-primary">
                                    <span class="font-normal text-color"> Aposte Mais </span>
                                </a>
                                <a class="font-bold text-primary">
                                    <span class="font-normal text-color"> {{ difference.toFixed(2) }} / {{ nextLevel?.bet_required }}</span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="absolute top-0 right-0 text-color px-3 py-1 site-menu-item rounded-tr-lg rounded-bl-lg">
                        <button class="p-1 bhg" @click="collectVipWallet">Coletar</button>
                        <span class="font-normal text-[14px] text-color ml-2">R$ {{ vipWallet }}</span>
                    </div>
                </div>

                <div class="rounded-lg mt-5 w-full">
                    <div class="title-vip flex justify-between">
                        <p class="custom-font-3 text-color">Lista de níveis VIP</p>
                    </div>

                    <!-- Start Tabs -->
                    <div class="mb-4 bordas mt-1 overflow-x-auto scrollbar-hide">
                        <ul class="flex flex-nowrap -mb-px text-sm text-center text-color" id="tabs-vip" role="tablist">
                            <li class="me-2" role="presentation">
                                <button class="inline-block rounded-t-lg btn-nav p-2 text-color whitespace-nowrap" id="vipdefault-tab" type="button" role="tab" aria-controls="vipdefault-panel" :class="{'active': activeTab === 'vipdefault'}" @click="setActiveTab('vipdefault')">
                                    Bônus de aumento de nível
                                </button>
                            </li>
                           
                            <li class="me-2" role="presentation">
                                <button class="inline-block rounded-t-lg btn-nav p-2 text-color whitespace-nowrap" id="monthlybonus-tab" type="button" role="tab" aria-controls="monthlybonus-panel" :class="{'active': activeTab === 'monthlybonus'}" @click="setActiveTab('monthlybonus')">
                                    Bônus Mensal
                                </button>
                            </li>
                           
                        </ul>
                    </div>
                    <div id="tabContentExample custom-font-2">
                        <div v-show="activeTab === 'vipdefault'" class="rounded-lg" id="vipdefault-panel" role="tabpanel" aria-labelledby="vipdefault-tab">
                            <div class="flex w-full">
                                <TableVip :vips="nivelToday" :vipPoints="vipPoints" />
                            </div>
                        </div>
                       
                        <div v-show="activeTab === 'monthlybonus'" class="rounded-lg" id="monthlybonus-panel" role="tabpanel" aria-labelledby="monthlybonus-tab">
                            <div class="flex w-full">
                                <TableVip :vips="nivelMonthly" :vipPoints="vipPoints" />
                            </div>
                        </div>
                       
                    </div>
                    <!-- End Tabs -->
                </div>
            </div>
        </div>
</template>


<script>
import LoadingComponent from "@/Components/UI/LoadingComponent.vue";
import HeaderComponent from "@/Components/UI/HeaderComponent.vue";
import HttpApi from "@/Services/HttpApi.js";
import { initFlowbite, Tabs, Modal } from 'flowbite';
import TableVip from "@/Pages/Home/Vip/TableVip.vue";
import BauLayout from "@/Layouts/BauLayout.vue";

export default {
    props: [],
    components: { TableVip, HeaderComponent, LoadingComponent, BauLayout },
    data() {
        return {
            isLoading: false,
            nivelToday: null,
           
            nivelMonthly: null,
           
            nextLevel: null,
            vipWallet: 0,
            vipPoints: 0,
            difference: 0,
            currentLevelImage: '/storage/001.png', // Imagem padrão
            activeTab: 'vipdefault', // Aba ativa inicial
        }
    },
    methods: {
        setActiveTab(tab) {
            this.activeTab = tab;
        },
        getVips: async function () {
            const _this = this;
            await HttpApi.get(`/profile/vip/`)
                .then(response => {
                    _this.vipPoints = response.data.vipPoints;
                    _this.nextLevel = response.data.nextLevel;
                    _this.nivelToday = response.data.nivelToday;
                   
                    _this.nivelMonthly = response.data.nivelMonthly;
                   
                    _this.currentLevelImage = `/storage/${response.data.currentLevelImage}`;
                    _this.difference = response.data.difference;
                    _this.vipWallet = response.data.vipWallet;
                    _this.isLoading = false;
                    _this.$nextTick(() => {
                        _this.loadingVipTab();
                    });
                })
                .catch(error => {
                    _this.isLoading = false;
                });
        },
       collectVipWallet: async function () {
    try {
        const response = await HttpApi.post(`/profile/collect`);
        if (response.data.success) {
            this.vipWallet = response.data.vipWallet;
           // alert(response.data.message);
        } else {
           // alert(response.data.message);
        }
    } catch (error) {
        console.error('Erro ao coletar VIP Wallet:', error);
        alert('Ocorreu um erro ao tentar coletar o saldo.');
    }
}

    },
    async created() {
        await this.getVips();
    },
};
</script>


<style scoped>
/* Hide the scrollbar */
.scrollbar-hide {
    -ms-overflow-style: none; /* IE and Edge */
    scrollbar-width: none; /* Firefox */
}
.scrollbar-hide::-webkit-scrollbar {
    display: none; /* Chrome, Safari, Opera */
}

.btn-nav {
    color: var(--text-color);
}
.bhg{
    border-radius: 5px;
    border: 1px solid var(--borders-and-dividers-colors);
}

.btn-nav.active {
    margin-bottom: 2px;
    border-bottom: 2px solid var(--background-itens-selected);
}

.bordas {
    border-bottom: 1px solid var(--borders-and-dividers-colors);
}
.btese{
    margin-bottom: 30px;
}
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

body {
  font-family: 'Helvetica', sans-serif; /* Define a fonte Helvetica para todo o documento */
}
.custom-font {
    font-family: 'Helvetica', sans-serif;
    font-size: 12px;
}
.custom-font-2 {
    font-family: 'Helvetica', sans-serif;
    font-size: 10px;
}
.custom-font-3 {
    font-family: 'Helvetica', sans-serif;
    font-size: 16px;
}
</style>
