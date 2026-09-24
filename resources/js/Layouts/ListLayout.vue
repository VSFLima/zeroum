<template>
     <div class="ml-0 md:ml-0 mt-0 max-w-[450px]" :class="'mb-[0px]'">
         
        <div class="relative">
             <slot></slot>
    
            
       
         </div>
     </div>
    </template>

<script>
import {initFlowbite} from 'flowbite';
import {onMounted} from "vue";
import NavTopComponent from "@/Components/Nav/NavTopComponent.vue";
import SideBarComponent from "@/Components/Nav/SideBarComponent.vue";
import BottomNavComponent from "@/Components/Nav/BottomNavComponent.vue";
import CookiesComponent from "@/Components/UI/CookiesComponent.vue";

export default {
    props: [],
    components: {CookiesComponent, BottomNavComponent, SideBarComponent, NavTopComponent},
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
    computed: {},
    mounted() {


        // setTimeout(() => {
        //     this.isLoading = false
        // }, 3000)
    },
    methods: {},
    watch: {},
};
</script>
