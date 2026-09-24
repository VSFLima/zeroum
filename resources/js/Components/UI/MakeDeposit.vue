<template>
    <div class="relative inline-block">
        <div class="ml-1 btn inline-flex items-center">
        <!-- Botão de Depósito (abre o modal de depósito) -->
        <button @click.prevent="toggleModalDeposit" type="button" 
                :class="[showMobile === false ? 'md:block' : '', isFull ? 'w-full' : '']" 
                class="ml-1 inline-flex items-center">
            {{ title }}
           
        </button>
           <div class="divider-vertical"></div>
           <!-- Ícone do dropdown -->
           <svg 
    @click.prevent="toggleDropdown" 
    :class="{'rotate': dropdownOpen}" 
    class="w-4 h-4 ml-1 cursor-pointer transition-transform duration-300" 
    aria-hidden="true" 
    fill="none" 
    stroke="currentColor" 
    viewBox="0 0 24 24" 
    xmlns="http://www.w3.org/2000/svg">
    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
          d="M19 9l-7 7-7-7"></path>
</svg>

          </div>

        <!-- Dropdown menu para "Saque" -->
        <div v-if="dropdownOpen" @click="dropdownOpen = false" class="absolute right-0 z-10">
            <div class="" role="menu" aria-orientation="vertical" aria-labelledby="options-menu">
                <a @click.prevent="goToWithdraw" class="block btn" role="menuitem">
                    {{ $t('Withdraw') }}
                </a>
            </div>
        </div>
    </div>

    <!-- Modal de Depósito -->
    <div id="modalElDeposit" tabindex="-1" aria-hidden="true" class="fixed top-0 left-0 right-0 z-50 hidden w-full overflow-x-hidden overflow-y-auto md:inset-0 h-screen md:h-[calc(100%-1rem)] max-h-full rounded-lg">
        <div class="relative w-full max-h-full rounded-lg max-w-[450px]">
            <div class="flex flex-col md:justify-between my-auto rounded-lg mt-5">
            
                <DepositWidget />
            </div>
        </div>
    </div>
</template>

<script>
import { useAuthStore } from "@/Stores/Auth.js";
import DepositWidget from "@/Components/Widgets/DepositWidget.vue";
import { onMounted } from "vue";
import { initFlowbite } from "flowbite";

export default {
    props: ['showMobile', 'title', 'isFull'],
    components: { DepositWidget },
    data() {
        return {
            isLoading: false,
            modalDeposit: true,
            dropdownOpen: false,  // Estado para controlar o dropdown
        };
    },
    setup(props) {
        onMounted(() => {
            initFlowbite();
        });
        return {};
    },
    computed: {
        isAuthenticated() {
            const authStore = useAuthStore();
            return authStore.isAuth;
        },
    },
    methods: {
        toggleModalDeposit() {
            this.modalDeposit.toggle();
        },
        toggleDropdown() {
            this.dropdownOpen = !this.dropdownOpen;
        },
        goToWithdraw() {
            // Redireciona para a mesma rota "profile/financas"
            this.$router.push('/profile/financas?tab=saque');
        },
    },
    mounted() {
        this.modalDeposit = new Modal(document.getElementById('modalElDeposit'), {
            placement: 'center',
            backdrop: 'dynamic',
            backdropClasses: '',
            closable: true,
        });
    },
};
</script>

<style scoped>
.btn {
    padding-top: 4px;
    padding-bottom: 4px;
    padding-left: 8px;
    padding-right: 6px;
    color: var(--botao-deposito-text-nav);
    border-radius: 7px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    font-size: 12px; /* Tamanho do texto */
    background: var(--botao-deposito-background-nav);
    border: 1px solid var(--border-deposito-nav);
}
.divider-vertical {
    width: 1px;
    height: 12px;
    background-color: var(--botao-deposito-text-nav); /* Cor do divisor */
    margin-left: 8px; /* Ajuste o espaçamento conforme necessário */
    margin-right: 2px; /* Ajuste o espaçamento conforme necessário */
}
.dropdown-menu {
    display: none;
}

.dropdown-menu.show {
    display: block;
}

/* Efeito de rotação para o ícone do dropdown */
.rotate {
    transform: rotate(180deg);
}
</style>
