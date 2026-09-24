<template>
  <div v-if="showModal" class="over-modals"></div>
 <div v-if="showModal" tabindex="-1" aria-hidden="true" class="fixed mongos inset-0 flex flex-cols-1 w-full items-center justify-center">
    <div class="relative w-[calc(100%-30px)] max-w-[420px] justify-center p-4 items-center modal-content">
      <div class="modal-header">
        <h3 class="text-color">Termos de Uso</h3>
        <span class="close" @click="closeModal">&times;</span>
      </div>
      <div class="modal-body">
        <div class="mt-1 text-sm text-color" v-html="$t(custom.modal_termos_register)"></div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      showModal: false,
      custom: null,
    };
  },
  methods: {
    openModal() {
      this.showModal = true;
    },
    closeModal() {
      this.showModal = false;
    }
  },
  async created() {
    this.custom = custom; // Certifique-se de que `custom` esteja disponível aqui
  },
};
</script>

<style scoped>
.over-modals {
  position: fixed;
  top: 0;
  width: 100%;
  height: 100%;
  max-width: 450px;
  z-index: 55;
  background-color: rgba(0, 0, 0, 0.616);
}
.mongos {
  z-index: 55;
}
.modal-content {
  background-color: var(--background-color-cassino);
  border-radius: 8px;
  border-width: 1px;
  border-style: solid;
  border-color: var(--borders-and-dividers-colors);
  max-height: 90vh; /* Define a altura máxima para o modal completo */
}

.modal-body {
  max-height: 60vh; /* Define a altura máxima para o conteúdo do modal */
  overflow-y: auto; /* Adiciona rolagem vertical quando necessário */
  -ms-overflow-style: none;  /* Para Internet Explorer e Edge */
  scrollbar-width: none;  /* Para Firefox */
}

.modal-body::-webkit-scrollbar {
  display: none; /* Esconde a barra de rolagem no Chrome, Safari e Opera */
}

.modal-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  border-bottom: 1px solid;
  border-color: var(--borders-and-dividers-colors);
  padding-bottom: 10px;
  margin-bottom: 10px;
}

.modal-header h3 {
  margin: 0;
}

.modal-header .close {
  cursor: pointer;
  font-size: 24px;
  color: var(--text-color);
}
</style>
