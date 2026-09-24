<template>
  <!-- Terceiro componente -->
  <div class="w-full max-w-[450px] mx-auto bgcategoria">
  
    <!-- categories mobile -->
    <div v-if="categories" class="category-list bordinha flex justify-between">
      <button @click="scrollToStart" class="btn-navigation">
        <img src="/public/assets/images/avancar.png" alt="Voltar" class="rotate-180 w-5 h-auto">
      </button>
      <div class="flex w-full overflow-x-auto">
        <RouterLink v-for="(category, index) in sortedCategories" :key="index"
                    :to="{ name: 'casinosAll', params: { provider: 'all', category: category.slug }}"
                    :class="{ 
                      'selected-category': isSelectedCategory(category), 
                      'text-color': !isSelectedCategory(category)
                    }"
                    class="flex-shrink-0 flex-grow-0 w-1/5 text-center mt-1">
          <div class="flex items-center justify-center">
            <img :src="category.slug === 'popular' ? `/storage/` + category.image_select : `/storage/` + category.image" 
                 alt="Imagem" class="w-auto h-6 mb-1">
          </div>
<p class="text-[12px] text-color opacity-80" :style="{ border: isSelectedCategory(category) ? 'none' : '' }">
            {{ $t(category.name) }}
          </p>        </RouterLink>

      </div>

      <button @click="scrollToEnd" class="btn-navigation-1">
        <img src="/public/assets/images/avancar.png" alt="Avançar" class="w-5 h-auto">
      </button>
    </div>
  </div>
</template>



<script>
import { RouterLink } from "vue-router";
import HttpApi from "@/Services/HttpApi.js";
import CustomPagination from "@/Components/UI/CustomPagination.vue";
import JackpotComponent from "@/Pages/Home/Components/JackpotComponent.vue";

export default {
  props: [],
  components: {
    JackpotComponent,
    CustomPagination,
    RouterLink,
  },
  data() {
    return {
      isLoading: true,
      isFixedCategories: false, // Adicionei essa propriedade para o exemplo
      categories: null,
    };
  },
  computed: {
    sortedCategories() {
      return this.categories ? this.categories.sort((a, b) => a.id - b.id) : [];
    },
  },
  mounted() {},
  methods: {
    scrollToStart() {
      const listContainer = document.querySelector('.category-list .flex');
      if (listContainer) {
        listContainer.scrollTo({ left: 0, behavior: 'smooth' });
      } else {
        console.error('Container de lista não encontrado.');
      }
    },
    scrollToEnd() {
      const listContainer = document.querySelector('.category-list .flex');
      if (listContainer) {
        const scrollWidth = listContainer.scrollWidth;
        const visibleWidth = listContainer.clientWidth;
        listContainer.scrollTo({ left: scrollWidth - visibleWidth, behavior: 'smooth' });
      } else {
        console.error('Container de lista não encontrado.');
      }
    },
    async getCasinoCategories() {
      try {
        const response = await HttpApi.get('categories');
        this.categories = response.data.categories;
      } catch (error) {
        console.error('Erro ao obter categorias:', error);
      }
    },
    async initializeMethods() {
      await this.getCasinoCategories();
      // Adicione outras inicializações conforme necessário
    },
    isSelectedCategory(category) {
      return this.$route.params.category === category.slug || (this.$route.params.category === undefined && this.sortedCategories[0].slug === category.slug);
    }
  },
  async created() {
    await this.initializeMethods();
  },
};
</script>

<style scoped>
.selected-category {
    color: var(--background-itens-selected);
    border-bottom: 2px solid var(--background-itens-selected); /* Estilo da barra inferior para a categoria selecionada */
    /* Outros estilos conforme necessário */
}

.opacity-80 {
    opacity: var(--opacity-categories);
}

.category-img img {
    /* Adicione o seguinte código CSS para definir a largura da imagem */
    height: 40px; /* Isso mantém a proporção da imagem */
    display: block; /* Garante que a imagem se comporte como um bloco */
}

.transparent-bg {
    /* Adicione o seguinte código CSS para tornar o fundo da imagem transparente */
    background-color: transparent;
}

.bordinha {
    margin-right: 4px; 
    padding-left: 4px; 
    padding-right: 4px;
    margin-left: 4px;
    border-bottom-width: 1px;
    border-bottom-width: solid;
    border-color: var(--borders-and-dividers-colors);
    transition: background-color 0.3s ease;
}
.bgcategoria{
  background-color: var(--background-color-category);
}

.btn-navigation img.rotate-180 {
  transform: rotate(180deg);
}
</style>
