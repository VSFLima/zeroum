<template>
    <RenderlessPagination
        :data="data"
        :limit="30"
        :keep-length="keepLength"
        @pagination-change-page="onPaginationChangePage"
        v-slot="slotProps"
    >
        <nav
            v-bind="$attrs"
            aria-label="Pagination"
            class="flex justify-center items-center w-full  max-w-[450px]"
        >
            <button
                :disabled="!slotProps.computed.prevPageUrl"
                v-on="slotProps.prevButtonEvents"
                class="custom-button"
            >
                <slot name="prev-nav">
                    <img src="/public/assets/images/left.png" alt="Texto alternativo" width="12" height="12">
                </slot>
            </button>

            <div class="flex space-x-2">
                <button
                    v-for="page in slotProps.computed.totalPages"
                    :key="page"
                    @click="changePage(page)"
                    :class="['px-3 py-2 rounded-lg', {'custom-button': page === slotProps.computed.currentPage, 'custom-button': page !== slotProps.computed.currentPage}]"
                >
                    {{ page }}
                </button>
            </div>

            <button
                :disabled="!slotProps.computed.nextPageUrl"
                v-on="slotProps.nextButtonEvents"
                class="custom-button"
            >
                <slot name="next-nav">
                    <img src="/public/assets/images/right.png" alt="Texto alternativo" width="12" height="12">
                </slot>
            </button>
        </nav>
    </RenderlessPagination>
</template>

<script>
import RenderlessPagination from 'laravel-vue-pagination/src/RenderlessPagination.vue';

export default {
    inheritAttrs: false,

    emits: ['pagination-change-page'],

    components: {
        RenderlessPagination
    },

    props: {
        data: {
            type: Object,
            default: () => {}
        },
        limit: {
            type: Number,
            default: 30  // Defina o limite padrão aqui
        },
        keepLength: {
            type: Boolean,
            default: false
        },
    },

    methods: {
        onPaginationChangePage(page) {
            this.$emit('pagination-change-page', page);
        },
        changePage(page) {
            this.onPaginationChangePage(page);
        }
    }
}
</script>

<style>
    .custom-button {
        border-radius: 8px;
        padding: 10px 10px;
        border-width: solid;
        border-width: 1px;
        border-color: var(--borders-and-dividers-colors);
        cursor: pointer;
        transition: border-width 0.3s ease;
        margin-right: 10px;
    }

    .custom-button:disabled {
        opacity: 0.5;
        cursor: not-allowed;
    }

    .custom-button:hover {
        border-width: 0.5px;
        border-width: solid;
        border-color: var(--background-itens-selected);
    }

    .flex.space-x-2 {  /* Nova classe para centralizar os botões */
        justify-content: center;
    }
</style>
