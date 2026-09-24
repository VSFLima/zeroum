<template>
    <div v-if="isLoading" class="is-loading-component w-full background-bottom-navigation max-w-[450px] h-[calc(100vh-60px)] z-[999999]">
        <div class="text-center flex-col">
            <div role="status" class="absolute grid -translate-x-1/2 -translate-y-1/2 top-2/4 left-1/2">
                <!-- Exibe a div que contém a imagem APENAS se a imagem existir -->
                <div v-if="isImageAvailable" class="text-center mx-auto mb-5">
                    <img :src="`/storage/${setting.software_loading}`" class="mx-auto max-w-[280px]" />
                </div>
                <slot></slot>
            </div>
        </div>
    </div>
</template>

<script>
import { useSettingStore } from "@/Stores/SettingStore.js";

export default {
    props: ['isLoading'],
    setup() {
        const { setting } = useSettingStore();
        return { setting };
    },
    computed: {
        setting() {
            const settingStore = useSettingStore();
            return settingStore.setting;
        },
        // Verifica se a imagem de loading está disponível
        isImageAvailable() {
            return this.setting.software_loading && this.setting.software_loading.trim() !== '';
        }
    },
    methods: {
        getSetting() {
            const settingStore = useSettingStore();
            this.setting = settingStore.setting;
        },
    },
    created() {
        this.getSetting();
    },
};
</script>

<style>
    .is-loading-component {
        position: fixed;
        top: 0;
        bottom: 0;
        height: 100vh;
        background-color: var(--background-color-cassino);
    }
</style>
