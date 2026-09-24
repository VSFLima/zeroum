<template>
    <NavTopComponent :simple="false" />

    <SideBarComponent v-once />

    <div class="sm:ml-0 mt-[56px] max-w-[450px] mx-auto">
        <div class="relative ">
            <slot></slot>

            
        </div>
    </div>
    <FooterComponent v-once />
    <BottomNavComponent v-once />

    <CookiesComponent v-once />
</template>

<script>
import { initFlowbite, Tabs, Modal } from 'flowbite';
import { onMounted } from "vue";

import { useAuthStore } from "@/Stores/Auth.js";

import NavTopComponent from "@/Components/Nav/NavTopComponent.vue";
import SideBarComponent from "@/Components/Nav/SideBarComponent.vue";
import FooterComponent from "@/Components/UI/FooterComponent.vue";
import BottomNavComponent from "@/Components/Nav/BottomNavComponent.vue";
import CookiesComponent from "@/Components/UI/CookiesComponent.vue";

export default {
    props: [],
    components: {
        CookiesComponent,
        BottomNavComponent,
        FooterComponent,
        SideBarComponent,
        NavTopComponent,
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
        getDayOfWeek() {
            const daysOfWeek = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
            const currentDate = new Date();
            const dayOfWeek = daysOfWeek[currentDate.getDay()];
            return dayOfWeek;
        },
    },
};
</script>

<style scoped>
/* Adiciona qualquer estilo adicional, se necessário */
</style>
