<template>
    <BaseLayout>
        <div class="my-auto">
            <div class="px-4 py-5">
                <form class="mb-5">
                    <label for="search" class="mb-2 text-sm font-medium text-gray-900 sr-only dark:text-white">{{ $t('Search') }}</label>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                            <svg class="w-4 h-4 text-gray-500 dark:text-gray-400" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20">
                                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z"/>
                            </svg>
                        </div>
                        <input v-model="searchTerm" @input="searchGames" type="search" id="search" class="block w-full p-4 pl-10 text-sm text-gray-900 border border-gray-300 rounded-full bg-gray-50 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700/20 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 rounded-full" placeholder="Search" required>
                        <button type="submit" class="text-white absolute right-2.5 bottom-2.5 bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-full text-sm px-4 py-2 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800 rounded-full">
                            {{ $t('Search') }}
                        </button>
                    </div>
                </form>

                <div v-if="!gamesSlotegrator" class="min-h-[calc(100vh-565px)] text-center flex flex-col items-center justify-center">
                    <div class="mb-3">

                    </div>
                    <h1 class="text-2xl font-bold">A pesquisa requer pelo menos 3 caracteres</h1>
                </div>

                <div v-else class="flex flex-col">
                    <div class="grid grid-cols-3 md:grid-cols-6 mb-3 gap-4">
                        <CassinoGameCard
                            v-for="(game, index) in gamesSlotegrator.data"
                            :index="index"
                            :title="game.name"
                            :cover="`/storage/`+game.image"
                            :link="game.slug"
                        />
                    </div>

                    <CustomPagination :data="gamesSlotegrator" @pagination-change-page="getData"/>

                </div>

            </div>
        </div>
    </BaseLayout>
</template>

<script>
// imports...

export default {
    // component options...
}
</script>

<style scoped>
/* styles... */
</style>
