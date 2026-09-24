<template>
    <BauLayout>
        <LoadingComponent :isLoading="isLoading">
            <div class="text-center">
                <span>{{ $t('Loading bonus') }}</span>
            </div>
        </LoadingComponent>

       
    </BauLayout>
</template>


<script>

import BaseLayout from "@/Layouts/BauLayout.vue";
import LoadingComponent from "@/Components/UI/LoadingComponent.vue";
import HttpApi from "@/Services/HttpApi.js";

export default {
    props: [],
    components: {LoadingComponent, BauLayout },
    data() {
        return {
            isLoading: false,
            games: null,
        }
    },
    setup(props) {


        return {};
    },
    computed: {

    },
    mounted() {

    },
    methods: {

    },
    async created() {

    },
    watch: {

    },
};
</script>

<style scoped>

</style>
