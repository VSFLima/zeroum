<template>
 <div v-if="isModalOpen" class="over-modal"></div>
  <div v-if="isModalOpen" tabindex="-1" aria-hidden="true" class="fixed inset-0 z-50 flex flex-cols-1 w-full items-center justify-center overflow-y-auto custom-font">
    <div class="relative w-[calc(100%-30px)] max-w-[420px] justify-center items-center">
      <div class="relative max-w-none banoes rounded-xl shadow-lg p-2" :class="[isLoginActive ? 'bordas-modal' : 'bordas-modal']">
  <div class="flex grid grid-cols-2 justify items-center p-1 pl-6 pr-6 bordas">
        <button @click="showLogin" :class="{ 'btn-1': isLoginActive, 'highlight': isLoginActive }" class="flex items-center mr-2 py-2 pr-2">
            <img :src="isLoginActive ? '/storage/' + setting.icon_wt_11 : '/storage/' + setting.icon_bt_6" alt="Login" class="inline-block w-4 h-4">
            <span :class="{ 'text-select-loginreg': isLoginActive }" class="mr-l ml-2">Acessar</span>
        </button>
        <button @click="showRegister" :class="{ 'btn-1': isRegisterActive, 'highlight': isRegisterActive }" class="flex items-center ml-2 py-2">
            <img :src="isRegisterActive ? '/storage/' + setting.icon_wt_12 : '/storage/' + setting.icon_bt_7" alt="Registro" class="inline-block w-4 h-4">
            <span :class="{ 'text-select-loginreg': isRegisterActive }" class="mr-l ml-2">Inscrever-se</span>
        </button>
    </div>



    <!-- Loading Spinner -->
    <div v-if="isLoading" class="absolute inset-0 bg-white/70 dark:bg-gray-800/70 z-[999] flex justify-center items-center">
      <div role="status">
        <svg aria-hidden="true" class="w-10 h-10 text-gray-200 animate-spin dark:text-gray-600 fill-white" viewBox="0 0 100 101" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path d="M100 50.5908C100 78.2051 77.6142 100.591 50 100.591C22.3858 100.591 0 78.2051 0 50.5908C0 22.9766 22.3858 0.59082 50 0.59082C77.6142 0.59082 100 22.9766 100 50.5908ZM9.08144 50.5908C9.08144 73.1895 27.4013 91.5094 50 91.5094C72.5987 91.5094 90.9186 73.1895 90.9186 50.5908C90.9186 27.9921 72.5987 9.67226 50 9.67226C27.4013 9.67226 9.08144 27.9921 9.08144 50.5908Z" fill="currentColor"/>
          <path d="M93.9676 39.0409C96.393 38.4038 97.8624 35.9116 97.0079 33.5539C95.2932 28.8227 92.871 24.3692 89.8167 20.348C85.8452 15.1192 80.8826 10.7238 75.2124 7.41289C69.5422 4.10194 63.2754 1.94025 56.7698 1.05124C51.7666 0.367541 46.6976 0.446843 41.7345 1.27873C39.2613 1.69328 37.813 4.19778 38.4501 6.62326C39.0873 9.04874 41.5694 10.4717 44.0505 10.1071C47.8511 9.54855 51.7191 9.52689 55.5402 10.0491C60.8642 10.7766 65.9928 12.5457 70.6331 15.2552C75.2735 17.9648 79.3347 21.5619 82.5849 25.841C84.9175 28.9121 86.7997 32.2913 88.1811 35.8758C89.083 38.2158 91.5421 39.6781 93.9676 39.0409Z" fill="currentFill"/>
        </svg>
        <span class="sr-only">Loading...</span>
      </div>
    </div>

    <div v-if="isLoginActive">
      <!-- Formulário de Login -->
     <form @submit.prevent="loginSubmit">
  <div class="relative mt-5 mb-3">
    <div class="absolute inset-y-0 left-0 flex items-center pl-3.5 pointer-events-none">
      <i class="fa-regular fa-user texts-color text-success-emphasis"></i>
    </div>
    <input type="text" v-model="loginForm.name" name="name" class="input-group rounded-lg" placeholder="Digite seu username" required>
  </div>
  <div class="relative mb-6">
    <div class="absolute inset-y-0 left-0 flex items-center pl-3.5 pointer-events-none">
      <i class="fa-regular fa-lock-keyhole texts-color text-success-emphasis"></i>
    </div>
    <input type="password" v-model="loginForm.password" name="password" class="input-group pr-[40px] rounded-lg" placeholder="Digite sua senha" required>
  </div>
  <div class="mt-3 w-full flex justify-between items-center">
    <button type="submit" class="left-0 devilsess-login w-full mx-auto py-2">Login</button>
  </div>
</form>
  </div>


    <div v-if="isRegisterActive">
      <!-- Formulário de Registro -->
 <form @submit.prevent="registerSubmit">
    <div class="relative mt-2 mb-1">
      <div class="absolute inset-y-0 left-0 flex items-center pl-3.5 pointer-events-none">
        <i class="fa-regular fa-user texts-color text-success-emphasis"></i>
      </div>
      <input type="text" v-model="registerForm.name" name="name" class="input-group rounded-lg" placeholder="Nome de Usuário" required>
    </div>
    <p v-if="registerForm.name.length > 0 && registerForm.name.length < 3" class="text-red-500 text-[10px] mt-1 mb-1">
  O nome deve ter pelo menos 3 letras.
</p>
   
    <div class="relative mb-1">
      <div class="absolute inset-y-0 left-0 flex items-center pl-3.5 pointer-events-none">
        <i class="fa-regular fa-lock-keyhole texts-color text-success-emphasis"></i>
      </div>
      <input type="password" v-model="registerForm.password" name="password" class="input-group rounded-lg pr-[40px]" placeholder="Senha" required @input="checkPasswordStrength">
    </div>
    <p v-if="passwordMessage" class="text-red-500 text-[10px]  mt-1 mb-1">
  {{ passwordMessage }}
</p>

    <div class="relative mb-1">
      <div class="flex items-center space-x-1 mr-40">
        <span class="mr-2 text-color text-[14px]">Força </span>
        <div v-for="n in 4" :key="n" :class="['h-2 flex-1 rounded', passwordStrength >= n ? strengthClasses[n - 1] : 'bg-gray-200']"></div>
      </div>
    </div>
   <div class="relative mb-1">
  <div class="absolute inset-y-0 left-0 flex items-center pl-3.5 pointer-events-none">
    <i class="fa-regular fa-lock-keyhole texts-color text-success-emphasis"></i>
  </div>
  <input type="password" v-model="registerForm.confirmPassword" name="confirmPassword" class="input-group rounded-lg pr-[40px]" placeholder="Confirme sua senha" required>
</div>
<p v-if="passwordMismatchMessage" class="text-red-500 text-[10px] mt-1 mb-1">
  {{ passwordMismatchMessage }}
</p>

   
    <div class="mb-1">
      <input type="checkbox" v-model="registerForm.acceptTerms" class="form-checkbox h-5 w-5 rounded-md boresr" id="acceptTerms" style="appearance: none; -webkit-appearance: none; background-color: var(--placeholder-background); border-radius: 5px;" required>
      <span class="ml-3 mr-2 texts-color text-[10px]" for="acceptTerms">Tenho mais de 18 anos, li e aceito</span>
      <span class="text-[12px] mr-2 bghfd cursor-pointer" @click="openModalTermos2">
        {{ $t('《Acordo de Usúario》') }}
      </span>
    </div>

    <div class="mt-3 w-full flex justify-between items-center">
      <button type="submit" class="left-0 devilsess rounded-lg w-full mx-auto py-2">Registro</button>
    </div>
   
  </form>
    </div>

    <div v-if="isBotaActive">
        <div class="mt-1 w-full flex justify-between items-center">
          <button href="" class="left-0 bghfd w-full mx-auto py-2">Suporte ao cliente</button>
          <button @click="showForgotPassword" class="left-0 bghfd w-full mx-auto py-2">Esqueci a senha</button>
        </div>
    </div>

     <div class="mt-1 w-full flex flex-col justify-center items-center">

        <div class="flex justify-center items-center mb-2">
    <img src="/public/assets/images/lefts.png" class="p-1 flex w-auto max-w-[100px]">
    <span class="custom-fontess text-[12px]">Registro vinculativo</span>
    <img src="/public/assets/images/rights.png" class="p-1 flex w-auto max-w-[100px]">
</div>

           
          <button class="bhfgff"> <img src="/public/assets/images/google.png" class="p-1"></button>
      </div>

    <div v-if="!isLoginActive && !isRegisterActive">
  <!-- Formulário de Recuperação de Senha -->
  <form @submit.prevent="forgotPasswordSubmit" method="post" action="" class="">
    <div class="relative mt-2 mb-3">
      <div class="absolute inset-y-0 left-0 flex items-center pl-3.5 pointer-events-none">
        <i class="fa-regular fa-envelope text-color text-success-emphasis"></i>
      </div>
      <input type="email" v-model="form.email" name="email" class="input-group rounded-lg" placeholder="Digite seu email" required>
    </div>
    <div class="mt-3 w-full flex justify-between items-center">
      <button type="submit" class="left-0 devilse text-color rounded-lg w-full mx-auto py-2">Recuperar Senha</button>
    </div>
  </form>
</div>

        <div v-if="alertMessage" class="mt-4 alert alert-danger">
          {{ alertMessage }}
        </div>
  </div>
  <div class="w-full flex justify-center mt-3 items-center">
   <button @click="closeModal" class="w-8 h-8 justify-center rounded-full binous">
    <i class="fa-solid fa-xmark text-color"></i>
</button>

        </div>
   </div>
   </div>
   <ModalTermos2 ref="modalTermos2" />
</template>

<script>
import ModalTermos2 from '@/Components/UI/ModalTermos2.vue';
import { RouterLink, useRoute } from "vue-router";
import { useAuthStore } from "@/Stores/Auth.js";
import { useToast } from "vue-toastification";
import { useRouter } from "vue-router";
import {onMounted, reactive} from "vue";
import HttpApi from "@/Services/HttpApi.js";
import { useSettingStore } from "@/Stores/SettingStore.js";


export default {
    props: ['simple'],
    components: {
      RouterLink,
      ModalTermos2
    },
    data() {
        return {
            isModalOpen: false,
            isLoading: false,
            isLoginActive: true,
            isRegisterActive: false,
            isBotaActive: true,
            isReferral: false,
            passwordMessage: '',
            loginForm: {
                name: '',
                password: ''
            },
            registerForm: {
                name: '',
                email: '',
                password: '',
                confirmPassword: '',
                reference_code: '',
                acceptTerms: true
          },
             form: {
                email: ''
              },
      alertMessage: '',
            passwordStrength: 0,
            strengthClasses: ['bg-red-500', 'bg-orange-500', 'bg-yellow-500', 'bg-green-500'],
        }
    },
    setup() {
        const router = useRouter();
        const route = useRoute();
        const routeParams = reactive({
            code: null,
        });

       onMounted(() => {
            const params = new URLSearchParams(window.location.search);
            if (params.has('code')) {
                routeParams.code = params.get('code');
            }
        });

        return {
            routeParams,
            router,
            route
        };
    },
    computed: {
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
        }
    },
  mounted() {
   const router = useRouter();
        if(this.isAuthenticated) {
            router.push({ name: '/' });
        }

        if (this.router.currentRoute.value.params.code) {
            try {
                const str = atob(this.router.currentRoute.value.params.code);
                const obj = JSON.parse(str);


                this.registerForm.spin_token = this.router.currentRoute.value.params.code;
            } catch (e) {
                this.registerForm.reference_code = this.routeParams.code;
                this.isReferral = true;
            }
        }else if(this.routeParams.code) {
            this.registerForm.reference_code = this.routeParams.code;
            this.isReferral = true;
        }
    },
  methods: {
    showForgotPassword() {
      this.isLoginActive = false;
      this.isRegisterActive = false;
      this.isForgotPasswordActive = true;
      this.isBotaActive = false;
    },
     openModalTermos2() {
      this.$refs.modalTermos2.openModal(); // Chama o método openModal do componente ModalTermos2
    },
   checkPasswordStrength() {
    const password = this.registerForm.password;
    let strength = 0;
    this.passwordMessage = '';

    // Verifica o comprimento mínimo da senha
    if (password.length < 4) {
        this.passwordMessage = '* A senha deve ter pelo menos 4 caracteres.';
        this.strengthClasses = ['', '', '', ''];
        return;
    }

    // Verifica se a senha contém pelo menos uma letra maiúscula
    if (password.match(/[A-Z]/)) strength++;
    // Verifica se a senha contém pelo menos uma letra minúscula
    if (password.match(/[a-z]/)) strength++;
    // Verifica se a senha contém pelo menos um número
    if (password.match(/[0-9]/)) strength++;
    // Verifica se a senha contém pelo menos um caractere especial
    if (password.match(/[^a-zA-Z0-9]/)) strength++;

    // Atualiza a mensagem de feedback
    if (strength < 4) {
        this.passwordMessage = '* Crie uma senha forte com letras e numeros.';
    } else {
        this.passwordMessage = ''; // Mensagem vazia quando a senha atende a todos os critérios
    }

    this.passwordStrength = strength; // Define a força da senha

    // Atribui as classes de estilo de acordo com a força da senha
    switch (this.passwordStrength) {
        case 1:
            this.strengthClasses = ['bg-red-500', '', '', ''];
            break;
        case 2:
            this.strengthClasses = ['bg-orange-500', 'bg-orange-500', '', ''];
            break;
        case 3:
            this.strengthClasses = ['bg-yellow-500', 'bg-yellow-500', 'bg-yellow-500', ''];
            break;
        case 4:
            this.strengthClasses = ['bg-green-500', 'bg-green-500', 'bg-green-500', 'bg-green-500'];
            break;
        default:
            this.strengthClasses = ['', '', '', ''];
            break;
    }
},

        openModal(type) {
            this.isModalOpen = true;
            if (type === 'login') {
                this.showLogin();
            } else {
              this.showRegister();
                // Verifica se há um código na URL para preencher o formulário de registro
        const params = new URLSearchParams(window.location.search);
        if (params.has('code')) {
            this.registerForm.reference_code = params.get('code');
            this.isReferral = true;
        }
            }
        },
        closeModal() {
            this.isModalOpen = false;
        },
        showLogin() {
            this.isLoginActive = true;
            this.isRegisterActive = false;
          this.isForgotPasswordActive = false;
            this.isBotaActive = true;
        },
        showRegister() {
            this.isLoginActive = false;
            this.isRegisterActive = true;
          this.isForgotPasswordActive = false;
             this.isBotaActive = true;
        },
        async loginSubmit() {
            this.isLoading = true;
            const authStore = useAuthStore();
            const _toast = useToast();
            
            try {
                const response = await HttpApi.post('auth/login', this.loginForm);
                authStore.setToken(response.data.access_token);
                authStore.setUser(response.data.user);
                authStore.setIsAuth(true);

                this.loginForm = {
                    name: '',
                    password: '',
                };

                this.closeModal();
           // _toast.success('You have been authenticated, welcome!', {
             // position: 'top-center', // Posiciona no centro superior
             // timeout: 3000, // Tempo de exibição
             // className: 'custom-toast' // Classe customizada para estilização
              // });
                
            } catch (error) {
                Object.entries(JSON.parse(error.request.responseText)).forEach(([key, value]) => {
                    _toast.error(`${value}`);
                });
            } finally {
                this.isLoading = false;
            }
        },
   async registerSubmit() {
    this.isLoading = true;
    const authStore = useAuthStore();
    const _toast = useToast();

    // Verificação da senha
    // const passwordValidation = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[^A-Za-z\d]).{4,}$/;
    // if (!passwordValidation.test(this.registerForm.password)) {
    //     //_toast.error('A senha deve ter pelo menos 4 caracteres. 1 Caractere especial e 1 Letra');
    //     this.isLoading = false;
    //     return;
    // }

    // Verificar se as senhas coincidem
    if (this.registerForm.password !== this.registerForm.confirmPassword) {
        this.passwordMismatchMessage = '* As senhas não coincidem.';
        this.isLoading = false;
        return;
    } else {
        this.passwordMismatchMessage = ''; // Limpar a mensagem se as senhas coincidirem
    }

    if (this.registerForm.name.length < 3) {
        //_toast.error('O nome deve ter pelo menos 3 letras');
        this.isLoading = false;
        return;
    }

    // Gerar email automaticamente a partir do nome
    const nameParts = this.registerForm.name.trim().toLowerCase().split(' ');
    const generatedEmail = `${nameParts.join('.')}@example.com`; // Exemplo de email gerado

    // Atribuir o email gerado ao formulário
    this.registerForm.email = generatedEmail;

    if (this.passwordStrength < 2) {
        _toast.warning('Sua senha é fraca. Use letras e numeros.');
    }

    try {
        const response = await HttpApi.post('auth/register', this.registerForm);
        if (response.data.access_token !== undefined) {
            authStore.setToken(response.data.access_token);
            authStore.setUser(response.data.user);
            authStore.setIsAuth(true);

            // Gerar código de referência
            const codeResponse = await HttpApi.get('profile/affiliates/generate');
            if (codeResponse.data.status) {
                //_toast.success('Seu código foi gerado com sucesso', { ... });
            }

            this.registerForm = {
                name: '',
                email: '',
                password: '',
                confirmPassword: '', // Resetar o campo de confirmação da senha
                reference_code: '',
                acceptTerms: ''
            };

            this.closeModal();
            this.router.push({ name: 'gerenciarPague' });
            //_toast.success('Sua conta foi criada com sucesso', { ... });
        }
    } catch (error) {
        Object.entries(JSON.parse(error.request.responseText)).forEach(([key, value]) => {
            _toast.error(`${value}`);
        });
    } finally {
        this.isLoading = false;
    }
},
        forgotPasswordSubmit: async function(event) {
            const _this = this;
            const _toast = useToast();
            _this.isLoading = true;

            await HttpApi.post('auth/forget-password', _this.form)
                .then(async response =>  {

                    _this.isLoading = false;
                  _toast.success('Um token foi enviado para você em sua caixa de E-mail!', {
                       position: 'top-center', // Posiciona no centro superior
                  timeout: 3000, // Tempo de exibição
                  className: 'custom-toast' // Classe customizada para estilização
                    });
                })
                .catch(error => {
                    const _this = this;
                    Object.entries(JSON.parse(error.request.responseText)).forEach(([key, value]) => {
                        _toast.error(`${value}`);
                    });
                    _this.isLoading = false;
                });
        },
        getSetting() {
            const settingStore = useSettingStore();
            this.setting = settingStore.setting;
        },
        hideLoginShowRegisterToggle() {
            this.modalAuth.toggle();
            this.modalRegister.toggle();
        },
        loginToggle() {
            this.modalAuth.toggle();
        },
        registerToggle() {
            this.modalRegister.toggle();
        },
        profileToggle() {
            this.modalProfile.toggle();
        },
    },
    async created() {
        if (this.isAuthenticated) {
            this.getSetting();
        }
    },
    watch: {
    },
};
</script>

<style scoped>
.bordas {
  border-bottom-width: 1px; 
  border-bottom-width: solid; 
  border-color: var(--borders-and-dividers-colors);}

.rounded {
  border-radius: 999px; 
}
.btn-1 {
      font-family: 'Helvetica', sans-serif;
    font-size: 17px;
    font-style: normal;
    font-weight: 500;
  padding: 4px 8px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}
.binous {
  border-radius: 50%;
  border: 2px solid var(--text-color)
}
.banoes {
  background-color: var(--background-color-cassino);
}

.bghfd{
      font-family: 'Helvetica', sans-serif;
    font-style: normal;
    font-weight: 400;
  color: var(--botao-registro-background-modal);
}

.btn {
  padding: 4px 8px;
  color: #fff;
  border-radius: 50px;
  cursor: pointer;
  transition: background-color 0.3s ease;
  font-size: 16px;
  border-width: 1px; 
  border-width: solid; 
  border-color: var(--borders-and-dividers-colors);
}
.devilse {
      font-family: 'Helvetica', sans-serif;
    font-style: normal;
    font-weight: 400;
  border-radius: 10px;
  transition: background-color 0.3s ease;
  font-size: 16px; 
  border-width: 1px; 
  border-width: solid; 
  border-color: var(--borders-and-dividers-colors);
  background-color: var(--background-bottom-navigation);
}
.devilsess {
      font-family: 'Helvetica', sans-serif;
    font-style: normal;
    font-weight: 400;
  border-radius: 10px;
  transition: background-color 0.3s ease;
  font-size: 14px; 
  color: var(--botao-registro-text-modal);
  background-color: var(--botao-registro-background-modal);
}
.devilsess-login {
      font-family: 'Helvetica', sans-serif;
    font-style: normal;
    font-weight: 400;
  border-radius: 10px;
  transition: background-color 0.3s ease;
  font-size: 14px; 
  color: var(--botao-login-text-modal);
  background-color: var(--botao-login-background-modal);
}
.btn-border-transparent-yellow {
  background-color: transparent;
  border-width: 1px;
  border-width: solid;
  border-color: var(--borders-and-dividers-colors);
}

.highlight{
  padding-right: 5px;
  border-bottom-width: 2px; 
  border-bottom-width: solid; 
  border-color: var(--background-itens-selected);
}
.highlight .text-color {
    color: var((--text-color), var(--text-opacity));
}
  .input-group {
  background-color: var(--placeholder-background);
  color: var(--placeholder-color);
  border: 1px solid var(--borders-and-dividers-colors);
  transition: background-color 0.3s ease;
}

.boresr{
  border: 1px solid var(--borders-and-dividers-colors);
  transition: background-color 0.3s ease;
  background-color: var(--botao-registro-background-modal);
}

.bhfgff {
  width: 35px;
  height: 35px;
  border-radius: 50%;
  border: 1px solid var(--borders-and-dividers-colors);
  background: #ffffff;
}

.input-group:not(:placeholder-shown) {
  background-color: var(--placeholder-background);
  border: 1px solid var(--background-itens-selected);
  transition: background-color 0.3s ease;
}

.input-group:focus {
  background-color: var(--placeholder-background);
  border: 1px solid var(--background-itens-selected);
  transition: background-color 0.3s ease;
}
.input-group:hover {
  background-color: var(--placeholder-background);
  border: 1px solid var(--background-itens-selected);
  transition: background-color 0.3s ease;
}

.items-forms-colores {
  background-color: var(--placeholder-background);
}
.input-group::-webkit-input-placeholder {
             color: var(--placeholder-color);
            opacity: var(--text-opacity);
            
        }

        .input-group:-moz-placeholder {
            color: var(--placeholder-color);
            opacity: var(--text-opacity);
        }

        .input-group::-moz-placeholder {
             color: var(--placeholder-color);
            opacity: var(--text-opacity);
        }

        .input-group:-ms-input-placeholder {
             color: var(--placeholder-color);
            opacity: var(--text-opacity);
        }

        .input-group::placeholder {
            color: var(--placeholder-color);
            opacity: var(--text-opacity);


        }

.bordas-modal {
  border-width: 1px; 
  border-width: solid; 
  border-color: var(--borders-and-dividers-colors);}
  
.over-modal {
  position: fixed;
  top: 0;
  width: 100%;
  height: 100%;
  max-width: 450px;
  z-index: 40;
  background-color: rgba(0, 0, 0, 0.5);
}
.texts-color{
  color: var(--text-color);
  opacity: var(--text-opacity);
  font-style: normal;
  font-weight: 400;
}
.text-select-loginreg {
  color: var(--botao-login-background-modal);
    font-style: normal;
    font-weight: 400;
}
.modal-container {
  z-index: 50;
}

.custom-toast {
    max-width: 400px;
    margin: 0 auto; /* Centraliza horizontalmente */
}
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

body {
  font-family: 'Helvetica', sans-serif; /* Define a fonte Helvetica para todo o documento */
}
.custom-font {
    font-family: 'Helvetica', sans-serif;
    font-size: 16px;
    font-style: normal;
    font-weight: 400;
}

.custom-font-title {
    font-family: 'Helvetica', sans-serif;
    font-size: 17px;
    font-style: normal;
    font-weight: 500;

}
.custom-fontess {
    font-family: 'Helvetica', sans-serif;
    font-style: normal;
    font-weight: 400;
    color: var(--text-color);
    opacity: var(--text-opacity);
}


</style>



