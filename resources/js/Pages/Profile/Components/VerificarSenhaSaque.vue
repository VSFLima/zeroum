<template>
  <div v-if="isVisible" class="overlays"></div>
  <div v-if="isVisible" tabindex="-1" aria-hidden="true" class="fixed inset-0 modal-container custom-font flex flex-col items-center justify-center overflow-y-auto">
    <div class="relative w-[calc(100%-30px)] max-w-[420px] justify-center items-center">
      <div class="modal-content p-4 bg-white rounded shadow-lg">
        <!-- Início do header -->
        <div class="p-4 h-12 flex justify-center items-center">
          <h2 class="text-[16px] text-color">Digite sua senha de saque</h2>
        </div>
        <!-- Fim do header -->

        <section class="password-section mt-4">
  <div class="password-input__label">
    <span class="text-color">Verificar Senha de Saque</span>
    <span class="password-icon" @click="togglePasswordVisibility" style="cursor: pointer;">
      <i v-if="isPasswordVisible" class="fa fa-eye-slash" aria-hidden="true"></i>
      <i v-else class="fa fa-eye" aria-hidden="true"></i>
    </span>
  </div>
  <div class="pin-container">
    <input
      v-for="(digit, index) in 6"
      :key="index"
      ref="pinInputs"
      class="custom-pin-input"
      :type="isPasswordVisible ? 'text' : 'password'"
      inputmode="numeric"
      maxlength="1"
      :value="password[index] || ''"
      @input="handleInput($event, index)"
      @keydown="handleKeydown($event, index)"
      :disabled="index > 0 && !password[index - 1]"
      :autofocus="index === 0"
    />
  </div>
</section>


        <!-- Adicione o botão de verificar PIN aqui -->
        <div class="flex justify-center mt-4">
          <button 
            @click="verifyPin"
            :disabled="!isPasswordComplete"
            class="px-4 py-2 text-color vgdfd disabled:opacity-50"
          >
            Verificar PIN
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { useAuthStore } from "@/Stores/Auth.js";
import HttpApi from "@/Services/HttpApi.js";

export default {
  data() {
    return {
      isVisible: false, // Inicia como falso
      password: ['', '', '', '', '', ''],
      isPasswordVisible: false, // Estado de visibilidade da senha
    };
  },
  computed: {
    isPasswordComplete() {
      return this.password.every(digit => digit !== '');
    },
    userData() {
      const authStore = useAuthStore();
      return authStore.user;
    },
  },
  methods: {
    open() {
      this.isVisible = true;
    },
    close() {
      this.isVisible = false;
    },
  handleInput(event, index) {
    const value = event.target.value.replace(/\D/g, ''); // Remove caracteres não numéricos
    this.password[index] = value;

    if (value && index < 5) {
      this.$nextTick(() => {
        this.$refs.pinInputs[index + 1].focus();
      });
    }

    // Verificar se o valor foi digitado (número) e ajustar dinamicamente
    if (!this.isPasswordVisible) {
      event.target.style.fontSize = '20px'; // Manter o texto digitado pequeno
    }
  },

  togglePasswordVisibility() {
    this.isPasswordVisible = !this.isPasswordVisible;

    this.$nextTick(() => {
      this.$refs.pinInputs.forEach((input, index) => {
        if (this.isPasswordVisible) {
          input.style.fontSize = '20px'; // Quando visível, tamanho pequeno
        } else {
          // Se o campo está ocultando a senha, garantir que o tamanho dos dots fique grande
          input.style.fontSize = this.password[index] ? '50px' : '20px'; // Tamanho grande só para os dots preenchidos
        }
      });
    });
  },
    handleKeydown(event, index) {
      if (event.key === 'Backspace' && !this.password[index]) {
        if (index > 0) {
          this.$refs.pinInputs[index - 1].focus();
        }
      }
    },
    async verifyPin() {
      try {
        console.log('Enviando solicitação para verificar PIN...');
        const response = await HttpApi.post('/verify-pin', {
          user_id: this.userData.id,
          pin: this.password.join('')
        });

        console.log('Resposta da API:', response.data);

        if (response.data.message === 'PIN verificado com sucesso!') {
          this.close();  // Fecha o modal se o PIN for verificado com sucesso
          return true;
        } else {
          // Você pode adicionar um feedback para o usuário caso o PIN não seja verificado
          return false;
        }
      } catch (error) {
        console.error("Erro ao verificar PIN:", error.response ? error.response.data : error.message);
        return false;
      }
    }
  }
}
</script>

<style scoped>
button:disabled {
  cursor: not-allowed;
}
.overlays {
  position: fixed;
  top: 0;
  width: 100%;
  height: 100%;
  max-width: 450px;
  z-index: 40;
  background-color: rgba(0, 0, 0, 0.5);
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

.password-section {
  display: flex;
  flex-direction: column;
}

.pin-container {
  display: flex;
  justify-content: space-between;
  background-color: var(--background-bottom-navigation);
  border: 1px solid var(--borders-and-dividers-colors);
  border-radius: 10px;
  height: 75px;
}
.password-input__label {
  display: flex;
  justify-content: space-between;
  margin-bottom: 10px;
}

.custom-pin-input {
  flex: 1;
  height: 100%;
  width: 16%;
  text-align: center;
  background: transparent;
  border-top: none;
  border-bottom: none;
  border-left: 1px solid var(--borders-and-dividers-colors);
  border-right: 1px solid var(--borders-and-dividers-colors);
  outline: none;
  margin: 0;
  font-size: 20px;
}

/* Números pequenos quando o campo estiver no modo "text" */
.custom-pin-input[type="text"] {
  font-size: 20px; /* Tamanho pequeno para números */
  color: var(--text-color);
}

/* Dots grandes quando o campo estiver no modo "password" */
.custom-pin-input[type="password"] {
  font-size: 20px; /* Tamanho grande para dots */
  color: var(--text-color);
}

/* Remove a borda direita do último campo */
.custom-pin-input:last-child {
  border-top: none;
  border-bottom: none;
  border-right: none;
}

/* Remove a borda esquerda do primeiro campo */
.custom-pin-input:first-child {
  border-left: none;
}

.custom-pin-input:focus,
.custom-pin-input:hover {
  border-top: none;
  border-bottom: none;
  border-left: 1px solid var(--borders-and-dividers-colors);
  border-right: 1px solid var(--borders-and-dividers-colors);
  box-shadow: none;
}

.vgdfd {
  margin: 5px;
  width: 100%;
  max-width: 40%;
  padding: 5px;
  font-size: 16px;
  border-width: 1px;
  border-style: solid;
  border-color: var(--borders-and-dividers-colors);
  border-radius: 10px;
  color: var(--text-color);
}

@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

body {
  font-family: 'Helvetica', sans-serif; /* Define a fonte Helvetica para todo o documento */
}
.custom-font {
    font-family: 'Helvetica', sans-serif;
    font-size: 12px;
}
</style>
