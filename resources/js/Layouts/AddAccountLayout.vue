<template>

<NavigationBarWallet :simple="false" />



<div class="ml-0 md:ml-0 mt-38 w-full max-w-[450px]" :class="'mt-[50px] mb-[0px]'">

     
    <div class="relative">
         <slot></slot>

        
     </div>
 </div>
</template>

<script>
import {initFlowbite} from 'flowbite';
import {onMounted} from "vue";
import NavigationBarWallet from '@/Components/Nav/NavigationBarWallet.vue';

export default {
    props: [],
    components: { NavigationBarWallet},
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
