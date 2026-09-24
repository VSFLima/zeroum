<template>

  <ConviteBarNav :simple="false" />
  <!--<SubConviteBar :simple="false" />-->
   

    <div class="ml-0 md:ml-0 w-full max-w-[450px] h-screen" :class="'mt-[38px] mb-[0px]'">
        
       <div class="relative">
            <slot></slot>

           
        </div>
    </div>
</template>

<script>
import ConviteBarNav from '@/Components/Nav/ConviteBarNav.vue';
//import SubConviteBar from '@/Components/Nav/SubConviteBar.vue';
import {initFlowbite} from 'flowbite';
import {onMounted} from "vue";


export default {
    props: [],
    components: {ConviteBarNav},
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

