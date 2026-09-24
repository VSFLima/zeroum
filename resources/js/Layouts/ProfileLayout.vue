<template>

    <div class="sm:ml-0 mt-0 max-w-[450px] mx-auto">
        <div class="relative ">
            <slot></slot>

           
        </div>
    </div>

 <BottomNavComponent v-once />
</template>

<script>
import { initFlowbite, Tabs, Modal } from 'flowbite';
import { onMounted } from "vue";
import { useAuthStore } from "@/Stores/Auth.js";
import BottomNavComponent from "@/Components/Nav/BottomNavComponent.vue";


export default {
    props: [],
    components: {
        BottomNavComponent,
    },
    data() {
        return {
            logo: '/assets/images/logo_verde.png',
            isLoading: false,
        }
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
        
    },
};
</script>

<style scoped>
/* Adiciona qualquer estilo adicional, se necessário */
</style>
