<template>
  <div class="fixed inset-0 z-50 flex flex-cols-1 w-full items-center justify-center" v-if="showModal">
    <div class="relative w-[calc(100%-30px)] max-w-[420px] justify-center p-4 items-center modal-content">
      <div class="modal-header">
        <h3 class="text-color">Termos de Uso</h3>
        <span class="close" @click="closeModal">&times;</span>
      </div>
      <div class="modal-body">
        <p class="text-color">
          Para utilizar nossos serviços, você concorda com os seguintes termos:
        </p>
        <p class="text-color">
          - O CPF utilizado para depósito será salvo e só poderá ser utilizado para realizar operações financeiras.
        </p>
        <p class="text-color">
          - Este CPF também será associado como sua chave PIX para saques.
        </p>
        <p class="text-color">
          - É crucial que você digite seu CPF corretamente durante o processo de depósito, pois erros podem resultar na perda dos seus fundos.
        </p>
        <p class="text-color">
          - Ao aceitar estes termos, você concorda com nossa política de privacidade e segurança de dados.
        </p>
        <p class="text-color">
          Agradecemos por utilizar nossos serviços. Se tiver alguma dúvida, entre em contato conosco.
        </p>
      </div>
    </div>
    </div>

</template>

<script>
export default {
  data() {
    return {
      showModal: false
    };
  },
  methods: {
    openModal() {
      this.showModal = true;
    },
    closeModal() {
      this.showModal = false;
    }
  }
};
</script>

<style scoped>

.modal-content {
  background-color: var(--background-color-cassino);
  border-radius: 8px;
  border-width: 1px;
  border-width: solid;
  border-color: var(--borders-and-dividers-colors);
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
  color: #999;
}

</style>
