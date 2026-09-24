<template>
    
        <div class="w-full h-full">
            <div class="grid grid-cols-1 md:grid-cols-1 gap-1 z-[999999]">
                <div class="col-span-2 relative">
                    <DepositWidget />
                </div>
            </div>
        </div>
   
</template>


<script>

import { RouterLink } from "vue-router";
import WalletLayout from "@/Layouts/WalletLayout.vue";
import DepositWidget from "@/Components/Widgets/DepositWidget.vue";
import WalletSideMenu from "@/Pages/Profile/Components/WalletSideMenu.vue";
import {useAuthStore} from "@/Stores/Auth.js";

export default {
    props: [],
    components: {WalletSideMenu, DepositWidget, WalletLayout, RouterLink },
    data() {
        return {
            isLoading: false,

        }
    },
    setup(props) {


        return {};
    },
    computed: {
        isAuthenticated() {
            const authStore = useAuthStore();
            return authStore.isAuth;
        },
    },
    mounted() {

    },
    methods: {

    },
    created() {

    },
    watch: {

    },
};
</script>

<style scoped>
/* Estilos CSS específicos para a página podem ser adicionados aqui */
.btn {
  padding: 8px 8px;
  color: #fff;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.btn-border-transparent-yellow {
  background-color: transparent;
  border: 1px solid #F9FD4E; /* Amarelo */
}

.btn-border-transparent-yellow:hover {
  background-color: #F9FD4E; /* Amarelo */
  color: #000; /* Cor do texto */
}

</style>
