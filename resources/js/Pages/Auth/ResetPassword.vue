<template>
  <div v-if="isModalOpen" class="over-modal">
    <div class="fixed inset-0 z-50 flex flex-cols-1 w-full items-center justify-center overflow-y-auto">
      <div class="relative w-[calc(100%-30px)] max-w-[420px] justify-center items-center custom-font">
        <div class="px-4 py-5">
          <div class="min-h-[calc(100vh-565px)] text-center flex flex-col items-center justify-center">
            <div class="w-full rounded-lg border-none md:mt-0 sm:max-w-md xl:p-0 background-bottom-navigation">
              <div class="p-2 space-y-4">
                <h1 class="text-center custom-font-title">{{ $t('Reset Password') }}</h1>
                <div class="mt-4 px-4">
                  <form @submit.prevent="resetPasswordSubmit">
                    <div class="relative mb-3">
                      <div class="absolute inset-y-0 left-0 flex items-center pl-3.5 pointer-events-none">
                        <i class="fa-regular fa-envelope text-success-emphasis"></i>
                      </div>
                      <input type="email"
                             name="email"
                             v-model="form.email"
                             class="input-group rounded-lg"
                             :placeholder="$t('Seu Email')"
                             required
                      >
                    </div>
                    <div class="relative mb-3">
                      <div class="absolute inset-y-0 left-0 flex items-center pl-3.5 pointer-events-none">
                        <i class="fa-regular fa-lock text-success-emphasis"></i>
                      </div>
                      <input :type="typeInputPassword"
                             name="password"
                             v-model="form.password"
                             class="input-group pr-[40px] rounded-lg"
                             :placeholder="$t('Type the password')"
                             required
                      >
                      <button type="button" @click.prevent="togglePassword" class="absolute inset-y-0 right-0 flex items-center pr-3.5">
                        <i v-if="typeInputPassword === 'password'" class="fa-regular fa-eye"></i>
                        <i v-if="typeInputPassword === 'text'" class="fa-sharp fa-regular fa-eye-slash"></i>
                      </button>
                    </div>
                    <div class="relative mb-3">
                      <div class="absolute inset-y-0 left-0 flex items-center pl-3.5 pointer-events-none">
                        <i class="fa-regular fa-lock text-success-emphasis"></i>
                      </div>
                      <input :type="typeInputPassword"
                             name="password_confirmation"
                             v-model="form.password_confirmation"
                             class="input-group pr-[40px] rounded-lg"
                             :placeholder="$t('Confirm the Password')"
                             required
                      >
                      <button type="button" @click.prevent="togglePassword" class="absolute inset-y-0 right-0 flex items-center pr-3.5">
                        <i v-if="typeInputPassword === 'password'" class="fa-regular fa-eye"></i>
                        <i v-if="typeInputPassword === 'text'" class="fa-sharp fa-regular fa-eye-slash"></i>
                      </button>
                    </div>
                    <div class="mt-5 w-full">
                      <button type="submit" class="butiss text-[14px] rounded-lg w-full mb-3" :disabled="isLoading">
                        {{ isLoading ? 'Carregando...' : $t('Submit') }}
                      </button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { useToast } from "vue-toastification";
import { useAuthStore } from "@/Stores/Auth.js";
import { useRoute, useRouter } from 'vue-router';
import { onMounted, ref } from "vue";
import HttpApi from "@/Services/HttpApi.js";

export default {
  props: [],
  data() {
    return {
      isModalOpen: true, // O modal sempre abre se este componente é montado
      isLoading: false,
      typeInputPassword: 'password',
      form: {
        email: '',
        password: '',
        password_confirmation: '',
        token: '',
      },
    };
  },
  setup(props) {
    const route = useRoute();
    const token = ref(null);

    onMounted(() => {
      token.value = route.params.token;
    });

    return {
      token,
      route,
    };
  },
  computed: {
    isAuthenticated() {
      const authStore = useAuthStore();
      return authStore.isAuth;
    },
  },
  mounted() {
    const router = useRouter();
    if (this.isAuthenticated) {
      router.push({ name: 'home' });
    }
  },
methods: {
  togglePassword() {
    this.typeInputPassword =
      this.typeInputPassword === 'password' ? 'text' : 'password';
  },
  resetPasswordSubmit: async function () {
    const _toast = useToast();
    this.isLoading = true;

    // Associa o token ao form
    this.form.token = this.token;

    await HttpApi.post(`auth/reset-password/${this.token}`, this.form)
      .then((response) => {
        this.isLoading = false;
        _toast.success('Senha restaurada com sucesso!', {
          position: 'top-center',
          timeout: 3000,
          className: 'custom-toast' // Classe customizada para estilização
        });
        this.$router.push({ name: 'login' });
      })
      .catch((error) => {
        this.isLoading = false;
        const errors = JSON.parse(error.request.responseText);
        Object.entries(errors).forEach(([key, value]) => {
          _toast.error(`${value}`, {
            position: 'top-center', // Posiciona no centro superior
            timeout: 3000, // Tempo de exibição
            className: 'custom-toast' // Classe customizada para estilização
          });
        });
      });
  },
}

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
  padding: 4px 8px;
  color: #fff;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.banoes {
  background-color: var(--background-color-cassino);
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
  border-radius: 10px;
  transition: background-color 0.3s ease;
  font-size: 16px; 
  border-width: 1px; 
  border-width: solid; 
  border-color: var(--borders-and-dividers-colors);
  background-color: var(--background-bottom-navigation);
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
  border-color: var(--borders-and-dividers-colors);
}
  .butiss {
    background-color: var(--placeholder-background);
    padding-top: 8px;
    padding-bottom: 8px;
  color: var(--text-color);
  border-color: var(--borders-and-dividers-colors);
  border-width: 1px;
  border-width: solid;
}

  .input-group {
  background-color: var(--placeholder-background);
  color: var(--placeholder-color);
  border-color: var(--borders-and-dividers-colors);
  border-width: 1px;
  border-width: solid;
}

.input-group:not(:placeholder-shown) {
  background-color: var(--placeholder-background);
  border-color: var(--background-itens-selected)
}

.input-group:focus {
  background-color: var(--placeholder-background);
  border-width: 2px;
  border-width: solid;
  border: var(--background-itens-selected)
}

.items-forms-colores {
  background-color: var(--placeholder-background);
}
.input-group::-webkit-input-placeholder {
            color: var(--placeholder-color);
        }

        .input-group:-moz-placeholder {
            color: var(--placeholder-color);
        }

        .input-group::-moz-placeholder {
            color: var(--placeholder-color);
        }

        .input-group:-ms-input-placeholder {
            color: var(--placeholder-color);
        }

        .input-group::placeholder {
            color: var(--placeholder-color);
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
    font-size: 12px;
    color: var(--text-color);
}
.custom-font-title {
    font-family: 'Helvetica', sans-serif;
    font-size: 20px;
    color: var(--text-color);
}
</style>



