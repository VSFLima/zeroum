<template>
  <div class="flex justify-center items-center w-full h-full">
    <RouterView v-slot="{ Component, route }">
      <Transition name="page-opacity" mode="out-in">
        <div :key="route.name" class="center-content background-color-cassino w-full max-w-[450px] hidden-scrollbar">
          <component :is="Component"></component>
        </div>
      </Transition>
    </RouterView>
  </div>
</template>


<script>
import { onMounted } from "vue";
import { RouterView } from "vue-router";


export default {
  props: [],
  components: { RouterView },
  data() {
    return {};
  },
  setup(props) {
    onMounted(() => {});

    return {};
  },
  computed: {},
  mounted() {},
  methods: {},
  watch: {},
};
</script>

<style scoped>

.background-color-cassino {
    background-color: var(--background-color-cassino);
    height: 100vh; /* Altura total da viewport */
    overflow-y: auto; /* Adiciona o scroll vertical */
    padding-bottom: 50px;
}
/* Estilos para esconder a barra de rolagem */
.hidden-scrollbar {
  scrollbar-width: none; /* Firefox */
  -ms-overflow-style: none; /* Internet Explorer 10+ */
}

.hidden-scrollbar::-webkit-scrollbar {
  display: none; /* Safari and Chrome */
}
</style>
