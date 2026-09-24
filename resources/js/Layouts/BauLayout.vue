<template>
    <div class="ml-0 md:ml-0 w-full max-w-[450px]" :class="'mb-[0px]'">
        
       <div class="relative">
            <slot></slot>

        </div>
    </div>
    <BottomNavComponent v-once/>
</template>

<script>
import {initFlowbite} from 'flowbite';
import {onMounted} from "vue";
import NavTopComponent from "@/Components/Nav/NavTopComponent.vue";
import SideBarComponent from "@/Components/Nav/SideBarComponent.vue";
import BottomNavComponent from "@/Components/Nav/BottomNavComponent.vue";
import CookiesComponent from "@/Components/UI/CookiesComponent.vue";
import NavBarInfos from '@/Components/Nav/NavBarInfos.vue';

export default {
    props: [],
    components: {CookiesComponent, BottomNavComponent, NavBarInfos},
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

<style scoped>

.banoes {
  padding-bottom: 50px;
  height: 100vh; /* Altura total da viewport */
}

</style>

