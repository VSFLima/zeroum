<template>
  <div v-if="isVisible" class="overlaysdf"></div>
  <div v-if="isVisible" tabindex="-1" aria-hidden="true" class="fixed inset-0 modal-container flex flex-col items-center justify-center overflow-y-auto">
    <div class="relative w-[calc(100%-30px)] max-w-[420px] justify-center items-center">
      <div class="modal-content p-4 bg-white rounded shadow-lg">

        <!-- Início do header -->
        <div class="p-4 h-12 mb-2 flex justify-center items-center relative">
          <h2 class="text-xl font-bold absolute left-1/2 transform -translate-x-1/2  text-color">Adicionar PIX</h2>
          <button type="button" @click="closeModal" class="absolute right-0 px-4 py-2 text-color"><i class="fa-solid fa-xmark  text-color"></i></button>
        </div>
        <!-- Fim do header -->

        <form @submit.prevent="submitForm">
          <!-- Formulário -->
          <div class="mb-4 flex items-center input-custom">
            <i class="fa fa-user ml-2 mr-2"></i>
            <input type="text" v-model="name" id="name" placeholder="Nome" class="block w-full p-2 input-customs" required>
          </div>
          <div class="mb-4 flex items-center">
            <select v-model="pixType" id="pixType" class="block w-full p-2 custom-select" required>
              <option value="DOCUMENT">CPF</option>
              <option value="EMAIL">Email</option>
              <option value="phoneNumber">Telefone</option>
            </select>
          </div>
          <div class="mb-4 flex items-center input-custom">
            <i :class="pixTypeIcon" class="ml-2 mr-2"></i>
            <input
              type="text"
              v-model="pixKey"
              :id="pixType === 'phoneNumber' ? 'phoneNumber' : 'pixKey'"
              :placeholder="pixType === 'phoneNumber' ? '(00) 00000-0000' : 'Chave PIX'"
              class="block w-full p-2 input-customs"
              v-mask="pixType === 'phoneNumber' ? '(##) #####-####' : ''"
              required>
          </div>

          <div v-if="pixType === 'EMAIL' || pixType === 'phoneNumber'" class="mb-4 flex items-center input-custom">
            <i class="fa fa-id-card ml-2 mr-2"></i>
            <input
              type="text"
              v-model="document"
              id="document"
              placeholder="CPF"
              class="block w-full p-2 input-customs"
              v-mask="'###.###.###-##'"
              required>
          </div>

          <div class="flex justify-center">
            <button type="submit" class="px-4 py-2 botose w-full">Confirmar</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import { useAuthStore } from "@/Stores/Auth.js";
import { useSettingStore } from "@/Stores/SettingStore.js";

export default {
  data() {
    return {
      isVisible: false, // Inicia como falso
      name: '',
      pixType: 'DOCUMENT',
      pixKey: '',
      document: ''
    };
  },
  computed: {
    userData() {
      const authStore = useAuthStore();
      return authStore.user;
    },
    setting() {
      const settingStore = useSettingStore();
      return settingStore.setting;
    },
    pixTypeIcon() {
      switch (this.pixType) {
        case 'EMAIL':
          return 'fa fa-envelope';
        case 'phoneNumber':
          return 'fa fa-phone';
        default:
          return 'fa fa-id-card';
      }
    }
  },
  methods: {
   async submitForm() {
    try {
      const data = {
        user_id: parseInt(this.userData?.id, 10), // Garante que user_id seja um número
        name: this.name,
        pix_type: this.pixType === 'phoneNumber' ? this.pixType : this.pixType.toLowerCase(), // Converte para minúsculas, exceto para telefone
        pix_key: this.pixType === 'phoneNumber' ? this.pixKey : this.pixKey.toLowerCase() // Não converte para minúsculas se for telefone
      };

      if (this.pixType === 'EMAIL' || this.pixType === 'phoneNumber') {
        data.document = this.document.toLowerCase(); // Converte o CPF para minúsculas, se necessário
      }

      const response = await axios.post('/account_withdraw', data);
      console.log(response.data.message);
      this.closeModal();
    } catch (error) {
      console.error('Erro ao salvar os dados:', error.response.data);
    }
  },
  openModal1() {
    this.isVisible = true;
  },
  closeModal() {
    this.isVisible = false;
  }
}

}
</script>

<style scoped>
.overlaysdf {
  position: fixed;
  top: 0;
  width: 100%;
  height: 100%;
  max-width: 450px;
  z-index: 40;
  background: rgba(0, 0, 0, 0.5);
}
.botose {
    border-radius: 10px;
    color: var(--botao-registro-text-modal);
    background-color: var(--botao-registro-background-modal);
}
.modal-container {
  z-index: 50;
  display: flex;
  justify-content: center;
  align-items: center;
}
.modal-content {
  background: var(--background-bottom-navigation);
  border-radius: 8px;
  padding: 16px;
}

.input-custom {
  background-color: var(--background-color-cassino);
  border: 1px solid var(--borders-and-dividers-colors);
  border-radius: 10px;
  color: var(--text-color);
  padding: 1px;
}
.input-customs {
  background: none;
  border: none;
  color: var(--text-color);
}
.input-custom::placeholder {
  color: var(--placeholder-color);
}
.input-customs::placeholder {
  color: var(--placeholder-color);
}

.input-customs:focus {
  background: none;
  border: none;
  box-shadow: none; /* Remove o box-shadow padrão */
}

.custom-select {
  background-color: var(--background-color-cassino);
  border: 1px solid var(--borders-and-dividers-colors);
  border-radius: 10px;
  color: var(--text-color);
  padding: 8px;
}
</style>
