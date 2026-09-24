<template>
    <NavTopComponent :simple="simple ?? true" />

    <SideBarComponent v-once />

    <div class="sm:ml-0 mt-16 max-w-[450px]">
        <div class="relative">
            <slot></slot>
        <BottomNavComponent v-once/>
        </div>
    </div>
</template>

<script>
import { initFlowbite } from 'flowbite';
import { onMounted } from "vue";
import NavTopComponent from "@/Components/Nav/NavTopComponent.vue";
import SideBarComponent from "@/Components/Nav/SideBarComponent.vue";
import BottomNavComponent from "@/Components/Nav/BottomNavComponent.vue";
import CookiesComponent from "@/Components/UI/CookiesComponent.vue";

export default {
    props: ['simple'],
    components: {CookiesComponent, BottomNavComponent, SideBarComponent, NavTopComponent },
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

    },
    mounted() {

    },
    methods: {

    },
    watch: {

    },
};
</script>
