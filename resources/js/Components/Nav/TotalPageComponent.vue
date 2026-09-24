<template>
    <div class="flex sm:hidden">
        <!-- Botões de navegação -->
        <div class="flex justify-center mt-1">
            <button @click="voltarPagina" :disabled="paginaAtual === 1" class="pagination-button">Voltar</button>
            <button v-for="pagina in totalPaginas" :key="pagina" @click="irParaPagina(pagina)" :class="{ 'pagination-button': true, 'active': pagina === paginaAtual }">{{ pagina }}</button>
            <button @click="avancarPagina" :disabled="paginaAtual === totalPaginas" class="pagination-button">Avançar</button>
        </div>
    </div>
</template>

<script>
import { useSettingStore } from "@/Stores/SettingStore.js";

export default {
    props: [],
    components: {},
    data() {
        return {
            isLoading: false,
            setting: null,
            paginaAtual: 1,
            totalPaginas: 5 // Defina o número total de páginas aqui
        }
    },
    setup(props) {
        return {};
    },
    methods: {
        getSetting: function() {
            const _this = this;
            const settingStore = useSettingStore();
            const settingData = settingStore.setting;

            if (settingData) {
                _this.setting = settingData;
            }
            this.$emit('hide-bottom-nav');
        },
        voltarPagina() {
            if (this.paginaAtual > 1) {
                this.paginaAtual--;
                console.log("Voltando para a página " + this.paginaAtual);
                // Adicione lógica para atualizar o conteúdo da página ao voltar
            }
        },
        avancarPagina() {
            if (this.paginaAtual < this.totalPaginas) {
                this.paginaAtual++;
                console.log("Indo para a página " + this.paginaAtual);
                // Adicione lógica para atualizar o conteúdo da página ao avançar
            }
        },
        irParaPagina(pagina) {
            this.paginaAtual = pagina;
            console.log("Indo para a página " + this.paginaAtual);
            // Adicione lógica para atualizar o conteúdo da página ao ir para uma página específica
        },
    },
    created() {
        this.getSetting();
    },
    watch: {},
};
</script>

<style scoped>
.pagination-button {
    margin: 0 5px;
    padding: 5px 10px;
    background-color: #3498db;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.pagination-button:disabled {
    background-color: #ccc;
    cursor: not-allowed;
}

.pagination-button.active {
    background-color: #2c3e50;
}
</style>
