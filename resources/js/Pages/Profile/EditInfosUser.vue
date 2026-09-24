<template>
    <WalletLayout>
        <div class="fixed top-0 flex flex-col relative w-full max-w-[450px] background-color-cassino custom-font">

            <nav class="flex items-center relative w-full max-w-[450px] fixed top-0 px-2 p-2 borders background-bottom-navigation">
                <button @click="$router.push('/profile/profile')" class="absolute left-2 w-6 h-6">
                    <img :src="`/storage/` + setting.icon_wt_10" class="w-auto h-5">
                </button>

                <span class="font-bold text-[16px] mx-auto">Dados</span>
            </nav>

            <div class="flex flex-cols-2">
                <div class="flex p-2">
                    <div class="avatar-section flex w-auto">
                        <img class="bordafoto w-16 h-16 cursor-pointer" :src="avatarUrl || (userData?.avatar ? '/storage/' + userData.avatar : (setting && setting.image_user_nav ? '/storage/' + setting.image_user_nav : '/default-avatar.jpg'))" alt="Avatar"  @click="openImagePicker">
                        <input type="file" ref="imageInput" class="hidden" @change="handleFileChange" accept="image/*">
                    </div>
                </div>
                <div class="flex flex-col p-2">
                    <div class="flex custom-font text-color">
                        <p>ID: {{ userData?.id || 'Não disponível' }} </p>
                        <button @click="copyToClipboard(userData?.id || '')" class="copy-button ml-2" :disabled="!userData?.id">
                            <i class="fas fa-copy"></i>
                        </button>
                    </div>
                </div>
            </div>

            <div class="p-2 flex flex-col">
                <!-- Campos não editáveis -->
                <div class="mb-4">
                    <div class="input-icon-container">
                        <i class="fas fa-user text-color input-icon mr-2"></i>
                        <input type="text" id="name" :value="userData?.name || ''" readonly class="inputs w-full">
                    </div>
                </div>
                <div class="mb-4">
                    <div class="input-icon-container">
                        <i class="fas fa-phone text-color input-icon mr-2"></i>
                        <input type="text" id="phone" :value="userData?.phone || ''" readonly class="inputs w-full">
                    </div>
                </div>
                <!-- Campos editáveis -->
                <div class="mb-4">
                    <div class="input-icon-container">
                        <i class="fab fa-facebook text-blue-500 input-icon mr-2"></i>
                        <input type="text" v-model="formData.facebook_id" placeholder="Facebook ID" class="inputs w-full">
                    </div>
                </div>
                <div class="mb-4">
                    <div class="input-icon-container">
                        <i class="fab fa-whatsapp text-green-500 input-icon mr-2"></i>
                        <input type="text" v-model="formData.whatsapp_id" placeholder="WhatsApp ID" class="inputs w-full">
                    </div>
                </div>
                <div class="mb-6">
                    <div class="input-icon-container">
                        <i class="fab fa-telegram text-blue-500 input-icon mr-2"></i>
                        <input type="text" v-model="formData.telegram_id" placeholder="Telegram ID" class="inputs w-full">
                    </div>
                </div>
                <div class="mb-4">
    <span class="text-color mb-3">Selecione a data de nascimento (depois de definida, não pode ser modificada)</span>
    <div class="input-icon-container">
        <i class="fas fa-birthday-cake text-colors input-icon mr-2"></i>
        <input
            type="date"
            v-model="formData.aniversario"
            placeholder="Aniversário"
            class="inputs w-full"
            :disabled="isAniversarioDefined"
        >
    </div>
</div>

            </div>

            <div class="flex w-full max-w-[450px] grid grid-cols-2 gap-2 fixed bottom-0 p-2 borders background-bottom-navigation">
                <button @click="$router.push('/profile/profile')" class="flex justify-center p-2 items-center text-center borderse">Retornar</button>
                <button @click="updateProfile" class="flex justify-center p-2 bordersa items-center text-center">Salvar</button>
            </div>
            
        </div>
    </WalletLayout>
</template>

<script>
import HttpApi from "@/Services/HttpApi.js";
import { useToast } from "vue-toastification";
import { useAuthStore } from "@/Stores/Auth.js";
import { useRouter } from "vue-router";
import { useSettingStore } from "@/Stores/SettingStore.js";
import WalletLayout from "@/Layouts/WalletLayout.vue";

export default {
  props: ['simple'],
  components: { WalletLayout },
  data() {
    return {
      isLoadingProfile: false,
      profileUser: null,
      isLoading: false,
      histories: null,
      isLoadingGenerate: false,
      avatarUrl: null,
      setting: null,
      formData: {
        facebook_id: '',
        whatsapp_id: '',
        telegram_id: '',
        aniversario: ''
      },
    };
  },
  setup() {
    const router = useRouter();
    return {
      router
    };
  },
  computed: {
    userData() {
      const authStore = useAuthStore();
      return authStore.user;
    },
    setting() {
      const authStore = useSettingStore();
      return authStore.setting;
    },
    isAniversarioDefined() {
      return !!this.userData.aniversario;
    }
  },
  mounted() {
    this.loadUserData();
  },
  methods: {
    openImagePicker() {
        this.$refs.imageInput.click();
    },
    async handleFileChange(event) {
        const file = event.target.files[0];
        const formData = new FormData();
        formData.append('avatar', file);

        const reader = new FileReader();
        reader.onload = () => {
            this.avatarUrl = reader.result;
        };
        reader.readAsDataURL(file);

        await HttpApi.post('/profile/upload-avatar', formData, {
            headers: {
                'Content-Type': 'multipart/form-data',
            },
        }).then(response => {
            console.log('Avatar atualizado com sucesso', response.data);
            this.userData.avatar = response.data.avatar;
        })
        .catch(error => {
            console.error('Erro ao atualizar avatar', error);
            const _toast = useToast();
            _toast.error("Erro ao atualizar a imagem do perfil");
        });
    },
    async updateProfile() {
        try {
            const requests = [];
            const toast = useToast();
            
            if (this.formData.facebook_id) {
                requests.push(HttpApi.post('/profile/update-facebook-id', { facebook_id: this.formData.facebook_id }));
            }
            if (this.formData.whatsapp_id) {
                requests.push(HttpApi.post('/profile/update-whatsapp-id', { whatsapp_id: this.formData.whatsapp_id }));
            }
            if (this.formData.telegram_id) {
                requests.push(HttpApi.post('/profile/update-telegram-id', { telegram_id: this.formData.telegram_id }));
            }
            if (this.formData.aniversario) {
                requests.push(HttpApi.post('/profile/update-aniversario', { aniversario: this.formData.aniversario }));
            }

            if (requests.length > 0) {
                await Promise.all(requests);
                toast.success("Dados atualizados com sucesso");
            } else {
                toast.info("Nenhuma alteração detectada");
            }
        } catch (error) {
            console.error('Erro ao atualizar perfil', error);
            const _toast = useToast();
            _toast.error("Erro ao atualizar perfil");
        }
    },
    loadUserData() {
        // Aqui você pode carregar os dados do usuário e preencher o formData se necessário
        this.formData.facebook_id = this.userData.facebook_id || '';
        this.formData.whatsapp_id = this.userData.whatsapp_id || '';
        this.formData.telegram_id = this.userData.telegram_id || '';
        this.formData.aniversario = this.userData.aniversario || '';
    }
  },

  created() {},
};
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

body {
  font-family: 'Helvetica', sans-serif;
}
.custom-font {
    font-family: 'Helvetica', sans-serif;
    font-size: 15px;
    font-style: normal;
    font-weight: 400;
}

.borders {
    border-bottom: 1px solid var(--borders-and-dividers-colors);
}
.bordafoto {
  border-color: var(--borders-and-dividers-colors);
  border-width: 1px;
  border-width: solid;
  border-radius: 10px;
}
.borderse {
  border-color: var(--borders-and-dividers-colors);
  border-width: 1px;
  border-width: solid;
  border-radius: 10px;
  color: var(--text-color)
}
.bordersa {
    border-radius: 10px;
  transition: background-color 0.3s ease;
  font-size: 16px; 
  color: var(--botao-registro-text-modal);
  background-color: var(--botao-registro-background-modal);
}
.inputs {
    color: var(--text-color);
    border-color: var(--borders-and-dividers-colors);
  border-width: 1px;
  border-width: solid;
  border-radius: 10px;
  background: var(--background-bottom-navigation);
   padding-left: 30px; /* Espaço para o ícone */
}

.input-icon-container {
    display: flex;
    align-items: center;
    position: relative;
}

.input-icon {
    position: absolute;
    left: 10px;
    font-size: 16px;
}

</style>
