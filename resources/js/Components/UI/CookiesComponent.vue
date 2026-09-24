<template>
    <div v-if="!cookieAccepted" class="flashs flex justify-between items-center background-bottom-navigation fixed left-0 md:left-1/2 md:-translate-x-1/2 bottom-20 z-[999] p-4 max-w-md mx-auto">
        <p>Os cookies nos ajudam a fornecer a melhor experiência para você.</p>
        <button @click="acceptCookie" class="flashs-1 flex justify-between pl-2 pr-2 pb-1 pt-1 items-center ml-3 rounded-lg">Aceitar</button>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                cookieAccepted: true,
            };
        },
        created() {
            const cookieStatus = localStorage.getItem('cookieAccepted');
            if (!cookieStatus) {
                localStorage.setItem('cookieAccepted', 'true');
            }
        },
        methods: {
            acceptCookie() {
                localStorage.setItem('cookieAccepted', 'true');
                this.cookieAccepted = true;
            },
        }
    };
</script>

<style scoped>
.flashs {
    border-radius: 12px;
    max-width: 420px; /* Ajuste o valor conforme necessário */
    width: 100%;
    border-width: 1px;
    border-style: solid;
    border-color: var(--borders-and-dividers-colors);
}

.flashs-1 {
    border-radius: 8px;
    border-width: 1px;
    border-style: solid;
    border-color: var(--borders-and-dividers-colors);
}
</style>
