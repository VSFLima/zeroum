<template>
  <div class="fixed top-0 flex justify-center w-full max-w-[450px] background-bottom-navigation bordf items-center relative h-12 p-4">
    <button type="button" @click="navigateTohome" class="absolute left-0 ml-5">
      <i class="fa-light fa-chevron-left text-white"></i>
    </button>
    <h2 class="text-xl absolute left-1/2 transform -translate-x-1/2 title-color">Senha de Saque</h2>
  </div>

  <div class="flex justify-center items-center text-green p-6">
    <span class="tekh">{{ $t('Para a segurança dos seus fundos, você precisa primeiro definir uma senha de saque!') }}</span>
  </div>

  <div class="modal-header p-2 flex justify-start">
    <div class="modal-title">Defina sua senha de saque</div>
  </div>

  <div class="modal-body p-2">
    <form @submit.prevent="validatePassword" class="ant-form ant-form-horizontal ant-form-hide-required-mark">
      <div>
        <div class="ant-row ant-form-item password-form-item p-2">
          <div class="ant-col ant-form-item-control-wrapper">
            <div class="ant-form-item-control">
              <span class="ant-form-item-children">
                <div>
                  <section class="password-section">
                    <div class="password-input__label">
                      <span class="text-color">Nova senha de Saque</span>
                      <span class="password-icon" @click="togglePasswordVisibility">
                        <i class="icon-container" style="display: inline-flex; justify-content: center; align-items: center;">
                          <svg v-if="isPasswordVisible" width="1em" height="1em" fill="currentColor" aria-hidden="true" focusable="false">
                            <use xlink:href="#comm_icon_show--svgSprite:all"></use>
                          </svg>
                          <svg v-else width="1em" height="1em" fill="currentColor" aria-hidden="true" focusable="false">
                            <use xlink:href="#comm_icon_hide--svgSprite:all"></use>
                          </svg>
                        </i>
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

                  <section class="password-section mt-5">
                    <div class="password-input__label">
                      <span class="text-color">Confirme a nova senha de Saque</span>
                    </div>
                    <div class="pin-container">
                      <input
    v-for="(digit, index) in 6"
    :key="'confirm-' + index"
    ref="confirmPinInputs"
    class="custom-pin-input"
    :type="isPasswordVisible ? 'text' : 'password'"
    inputmode="numeric"
    maxlength="1"
    :value="confirmPassword[index] || ''"
    @input="handleConfirmInput($event, index)"
    @keydown="handleConfirmKeydown($event, index)"
    :disabled="!isPasswordComplete"
  />
                    </div>
                  </section>
                </div>
              </span>
            </div>
          </div>
        </div>

        <div v-if="errorMessage" class="error-message">
          {{ errorMessage }}
        </div>

        <div class="flex justify-center items-center p-2">
          <span class="tegh">{{ $t('Atenção: A senha de saque protege seus fundos e é extremamente importante. Mantenha-a em segredo para evitar qualquer perda financeira.') }}</span>
        </div>

        <div class="fixed bottom-0 flex justify-center w-full max-w-[450px] cister p-2 background-bottom-navigation">
          <button type="submit" class="btnh mb-4"><span>Confirmar</span></button>
        </div>
      </div>
    </form>
  </div>

  <DesejaRecuperarPin ref="desejaRecuperarPin"/>
</template>

<script>
import axios from 'axios';
import { useRouter } from 'vue-router';
import { useAuthStore } from "@/Stores/Auth.js";
import { useSettingStore } from "@/Stores/SettingStore.js";
import DesejaRecuperarPin from '@/Pages/Profile/Components/DesejaRecuperarPin.vue';
import HttpApi from "@/Services/HttpApi.js";

export default {
  components: {
    DesejaRecuperarPin,
  },
  data() {
    return {
      password: ['', '', '', '', '', ''],
      confirmPassword: ['', '', '', '', '', ''],
      isPasswordVisible: false,
      errorMessage: '',
    };
  },
  computed: {
    isPasswordComplete() {
      return this.password.every(digit => digit !== '');
    },
    isAuthenticated() {
      const authStore = useAuthStore();
      return authStore.isAuth;
    },
    userData() {
      const authStore = useAuthStore();
      return authStore.user;
    },
    setting() {
      const authStore = useSettingStore();
      return authStore.setting;
    },
  },
  setup() {
    const router = useRouter();

    const navigateTohome = () => {
      router.push('/');
    };

    return {
      navigateTohome
    };
  },
  async created() {
  // Verifica se o usuário está autenticado
  if (this.isAuthenticated) {
    // Recupera o perfil do usuário
    await this.getProfile();
    // Verifica se o usuário já possui um PIN
    await this.checkUserHasPin();
  } else {
    // Caso não esteja autenticado, redireciona para a página de login ou tratamento alternativo
    this.navigateTohome();
  }
},
  methods: {
    async getProfile() {
      this.isLoadingProfile = true;
      try {
        const response = await HttpApi.get('/profile/');
        const data = response.data;
        // Processamento adicional do perfil, se necessário
      } catch (error) {
        console.error('Error fetching profile:', error);
      } finally {
        this.isLoadingProfile = false;
      }
    },
     async checkUserHasPin() {
  try {
    const response = await HttpApi.get('/verify-senha-saque', {
      params: {
        user_id: this.userData.id
      }
    });

        if (response.data.hasPins) {
          // Se o usuário já tem uma senha de saque, abrir o modal de recuperação
          console.log('Abrindo modal de Recuperação de Senha de Saque');
          if (this.$refs.desejaRecuperarPin && typeof this.$refs.desejaRecuperarPin.open === 'function') {
            this.$refs.desejaRecuperarPin.open();
          } else {
            console.warn('Referência para o modal de recuperação de senha de saque não encontrada.');
          }
        } else {
          // Se o usuário não tem uma senha de saque, exibir o formulário de criação de senha
          console.log('Exibindo formulário de criação de senha de saque');
        }
      } catch (error) {
        console.error('Erro ao verificar se o usuário tem senha de saque:', error);
      }
    },
    togglePasswordVisibility() {
    this.isPasswordVisible = !this.isPasswordVisible;

    // Ajustar o tamanho da fonte quando a visibilidade da senha for alterada
    this.$nextTick(() => {
      this.$refs.pinInputs.forEach((input, index) => {
        if (this.isPasswordVisible) {
          input.style.fontSize = '20px'; // Quando visível, tamanho pequeno
        } else {
          // Se o campo está ocultando a senha, garantir que o tamanho dos dots fique grande
          input.style.fontSize = this.password[index] ? '50px' : '20px'; // Tamanho grande só para os dots preenchidos
        }
      });
      // Ajustar também para o campo de confirmação do PIN
      this.$refs.confirmPinInputs.forEach((input, index) => {
        if (this.isPasswordVisible) {
          input.style.fontSize = '25px'; // Quando visível, tamanho pequeno
        } else {
          input.style.fontSize = this.confirmPassword[index] ? '50px' : '25px'; // Tamanho grande só para os dots preenchidos
        }
      });
    });
  },

  handleInput(event, index) {
    const value = event.target.value.replace(/\D/g, ''); // Remove caracteres não numéricos
    this.password[index] = value;

    // Ajustar dinamicamente o tamanho da fonte ao digitar
    if (!this.isPasswordVisible) {
      event.target.style.fontSize = '25px'; // Texto digitado menor
    }

    // Move o foco para o próximo campo se o campo atual não estiver completo
    if (value && index < 5) {
      this.$nextTick(() => {
        this.$refs.pinInputs[index + 1].focus();
      });
    } else if (index === 5) {
      // Se todos os dígitos do PIN estiverem preenchidos, mover para o primeiro campo de confirmação
      this.$nextTick(() => {
        this.$refs.confirmPinInputs[0].focus();
      });
    }
  },

  handleConfirmInput(event, index) {
    const value = event.target.value.replace(/\D/g, ''); // Remove caracteres não numéricos
    this.confirmPassword[index] = value;

    // Ajustar dinamicamente o tamanho da fonte ao digitar no campo de confirmação
    if (!this.isPasswordVisible) {
      event.target.style.fontSize = '25px'; // Texto digitado menor
    }

    // Move o foco para o próximo campo de confirmação se o campo atual não estiver completo
    if (value && index < 5) {
      this.$nextTick(() => {
        this.$refs.confirmPinInputs[index + 1].focus();
      });
    }
  },
    handleKeydown(event, index) {
      if (event.key === 'Backspace' && !this.password[index]) {
        if (index > 0) {
          this.$refs.pinInputs[index - 1].focus();
        }
      }
    },
    handleConfirmInput(event, index) {
      const value = event.target.value.replace(/\D/g, '');
      this.confirmPassword[index] = value;

      if (value && index < 5) {
        this.$nextTick(() => {
          this.$refs.confirmPinInputs[index + 1].focus();
        });
      }
    },
    handleConfirmKeydown(event, index) {
      if (event.key === 'Backspace' && !this.confirmPassword[index]) {
        if (index > 0) {
          this.$refs.confirmPinInputs[index - 1].focus();
        }
      }
    },
    async validatePassword() {
      if (this.password.join('') !== this.confirmPassword.join('')) {
        this.errorMessage = 'As senhas não coincidem!';
        return;
      }

      // Enviar senha de saque ao backend
      try {
        await this.submitSaquePassword();
        this.navigateTohome(); // Navegar para a home após sucesso
      } catch (error) {
        this.errorMessage = 'Erro ao salvar a senha de saque.';
      }
    },
    async submitSaquePassword() {
      const pin = this.password.join('');

      // Captura o user_id do sistema semelhante
      const userId = parseInt(this.userData?.id, 10);

      // Realizar a requisição POST para enviar o PIN e user_id ao backend
      try {
        const response = await axios.post('/api/sen-saque', {
          user_id: userId,
          pin: pin
        });
        console.log(response.data.message);
      } catch (error) {
        console.error('Erro ao salvar a senha de saque:', error.response.data);
        throw error;
      }
    }
  }
}
</script>

<style scoped>
/* Seus estilos aqui */
.bordf {
  border: var(--borders-and-dividers-colors);
  border-bottom-width: 1px;
  border-bottom-width: solid;
}

.btnh {
  border: 1px solid var(--borders-and-dividers-colors);
  padding: 5px;
  border-radius: 10px;
  width: 100%;
  color: var(--text-color);
}

.cister {
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
}

.modal-header {
  padding-bottom: 15px;
  text-align: center;
}

.modal-title {
   color: var(--title-color);
  font-size: 18px;
  font-weight: bold;
}

.modal-body {
  padding: 0;
}

.password-form-item {
  margin-bottom: 15px;
}

.password-section {
  display: flex;
  flex-direction: column;
}

.tekh {
  color: var(--text-color);
}

.tegh {
  color: var(--text-color);
}

.password-input__label {
  display: flex;
  justify-content: space-between;
  margin-bottom: 10px;
}

.pin-container {
  display: flex;
  justify-content: space-between;
  background-color: var(--background-bottom-navigation);
  border: 1px solid var(--borders-and-dividers-colors);
  border-radius: 10px;
  height: 75px;
}

.custom-pin-input {
  flex: 1;
  height: 100%;
  width: 16%;
  text-align: center;
  font-size: 25px;
  color: var(--text-color);
  background: transparent;
  border-top: none;
  border-bottom: none;
  border-left: 1px solid var(--borders-and-dividers-colors); /* Aplica borda direita padrão */
  border-right: 1px solid var(--borders-and-dividers-colors); /* Aplica borda direita padrão */
  outline: none; /* Remove a borda de foco padrão */
  margin: 0;
}
.custom-pin-input[type="text"] {
  font-size: 25px; /* Números pequenos ao digitar */
  color: var(--text-color);
}

/* Dots grandes no modo de senha */
.custom-pin-input[type="password"] {
  font-size: 25px; /* Dots grandes quando o campo está no modo password */
  color: var(--text-color);
}
.custom-pin-input:last-child {
  border-top: none;
  border-bottom: none;
  border-right: none; /* Remove a borda direita do último input */
}
.custom-pin-input:first-child {
  border-left: none; /* Adiciona borda esquerda ao primeiro input */
}

/* Remove efeitos de hover e foco na borda */
.custom-pin-input:focus,
.custom-pin-input:hover {
  border-top: none;
  border-bottom: none;
  border-left: 1px solid var(--borders-and-dividers-colors); /* Aplica borda direita padrão */
  border-right: 1px solid var(--borders-and-dividers-colors); /* Garante que a borda direita seja sempre aplicada */
  box-shadow: none; /* Remove qualquer sombra que possa aparecer */
}

.security-message {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-bottom: 20px;
}

.forgot-password {
  color: #1890ff;
  cursor: pointer;
}

.error-message {
  color: red;
  margin-bottom: 10px;
}
</style>
