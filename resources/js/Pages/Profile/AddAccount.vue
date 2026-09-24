<template>
  
    <div class="fixed flex bottom-0 w-full cister max-w-[450px] p-2 background-bottom-navigation">
      <button class="open-modal1-addaccount flex items-center justify-between w-full" @click="openModal1">
        <img src="/public/assets/images/icon_normal_pix.png" alt="Icon" class="mr-2 w-10 h-10">
        <span class="text-color">Adicionar conta</span>
        <i class="fa-light fa-chevron-right text-color mr-2"></i>
      </button>
    </div>

    <!-- Grid de contas -->
    <div class="grid-container mt-2 px-4">
      <div class="flex mb-2 justify-between items-center">
        <p class="text-color">Conta para recebimento ({{ totalAccounts }} / 8)</p>
        <button @click="togglePixKeyVisibility">
          <i :class="showPixKey ? 'fa fa-eye text-color' : 'fa fa-eye-slash text-color'"></i>
        </button>
      </div> 

      <div v-if="accountsDetails.length === 0" class="text-center text-color">Nenhuma conta disponível.</div>
      <div v-else class="grid grid-cols-1 gap-2">
        <div v-for="account in accountsDetails" :key="account.pix_key" class="account-card p-1 flex hgfds justify relative">
          <div class="absolute flex flex-col left-1 mr-1">
            <img src="/public/assets/images/icon_normal_pix.png" class="w-10 h-10">
          </div>
          <div class="flex flex-col ml-12">
            <p class="text-[14px] text-color"><strong>PIX</strong> ({{ account.pix_type }}) </p>
            <p class="text-[14px] text-color"><strong></strong> {{ formatPixKey(account.pix_key) }} </p>
          </div>
          <div class="absolute flex flex-cols right-1">
            <h3 class="text-[14px]  text-color"><strong></strong> ({{ account.name }})</h3>
          </div>
        </div>
      </div>
    </div>
 
  <!-- Modal de adicionar conta -->
  <AddAcountModal ref="addAcountModal"/>
  <!-- Modal de criar senha de saque -->
  <CriarSenhaSaque ref="criarSenhaSaque"/>
  <!-- Modal de verificar senha de saque -->
  <VerificarSenhaSaque ref="verificarSenhaSaque"/>

</template>

<script>
import CriarSenhaSaque from "@/Pages/Profile/Components/CriarSenhaSaque.vue";
import VerificarSenhaSaque from "@/Pages/Profile/Components/VerificarSenhaSaque.vue";
import AddAccountLayout from "@/Layouts/AddAccountLayout.vue";
import AddAcountModal from "@/Pages/Profile/Components/AddAccountModal.vue";
import { useRouter } from 'vue-router';
import HttpApi from "@/Services/HttpApi.js";
import { useSettingStore } from "@/Stores/SettingStore.js";
import { useAuthStore } from "@/Stores/Auth.js";

export default {
  components: {
    AddAccountLayout,
    AddAcountModal,
    VerificarSenhaSaque,
    CriarSenhaSaque
  },
  data() {
    return {
      totalAccounts: 0,
      accountsDetails: [],
      isLoadingProfile: false,
      loading: false,
      showPixKey: false
    };
  },
  setup() {
    const router = useRouter();

    const navigateToCreatePin = () => {
      router.push('/profile/createpin');
    };

    return {
      navigateToCreatePin
    };
  },
  async created() {
    if (this.isAuthenticated) {
      await this.getProfile();
    }
    this.fetchAllData();

    // Verificar se o usuário tem senha de saque salva ao carregar a página
    await this.checkUserHasPin();
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
    openModal1() {
      this.$refs.addAcountModal.openModal1();
    },
    fetchAccountWithdrawsDetails() {
      this.loading = true;
      HttpApi.get('profile/infos/account-withdraws')
        .then(response => {
          if (response && response.data) {
            this.totalAccounts = response.data.totalAccounts || 0;
            this.accountsDetails = response.data.accountsDetails || [];
          } else {
            this.totalAccounts = 0;
            this.accountsDetails = [];
          }
        })
        .catch(error => {
          console.error("Error fetching account withdraws details: ", error);
          this.totalAccounts = 0;
          this.accountsDetails = [];
        })
        .finally(() => {
          this.loading = false;
        });
    },
    fetchAllData() {
      this.fetchAccountWithdrawsDetails();
    },
    togglePixKeyVisibility() {
      this.showPixKey = !this.showPixKey;
    },
    formatPixKey(pixKey) {
      if (this.showPixKey) {
        return pixKey;
      }
      const hiddenPartLength = pixKey.length - 6;
      const hiddenPart = hiddenPartLength > 0 ? '*'.repeat(Math.min(hiddenPartLength, 6)) : '';
      const visiblePart = pixKey.slice(0, Math.ceil(pixKey.length / 4));
      return visiblePart + hiddenPart;
    },
    async checkUserHasPin() {
  try {
    const response = await HttpApi.get('/verify-senha-saque', {
      params: {
        user_id: this.userData.id
      }
    });

    if (response.data.hasPins) {
      // Se o usuário já tem uma senha de saque, abrir o modal de verificação
      console.log('Abrindo modal de Verificação de Senha de Saque');
     if (this.$refs.verificarSenhaSaque && typeof this.$refs.verificarSenhaSaque.open === 'function') {
  this.$refs.verificarSenhaSaque.open();
} else {
  console.warn('Referência para o modal de verificação de senha de saque não encontrada.');
}

    } else {
      // Se o usuário não tem uma senha de saque, abrir o modal para criar uma senha
      console.log('Abrindo modal de Criação de Senha de Saque');
      if (this.$refs.criarSenhaSaque && typeof this.$refs.criarSenhaSaque.open === 'function') {
        this.$refs.criarSenhaSaque.open();
      } else {
        console.warn('Referência para o modal de criação de senha de saque não encontrada.');
      }
    }
  } catch (error) {
    console.error('Erro ao verificar se o usuário tem senha de saque:', error);
  }
}

  }
};
</script>


<style scoped>
.centered-button-container {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100%;
}

.cister {
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
}
.open-modal1-addaccount {
  border: 1px solid var(--borders-and-dividers-colors);
  padding: 5px;
  border-radius: 10px;
  width: 100%;
}

.hgff {
  border-radius: 10px;
  background: var(--background-bottom-navigation);
}

.hgfds {
  border-radius: 10px;
  border-color: var(--borders-and-dividers-colors);
  border-width: 1px;
  border-width: solid;
}

.navigate-button {
  padding: 10px 20px;
  font-size: 16px;
  background-color: #1890ff;
  color: var(--text-color);
  border: none;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}
.navigate-button:hover {
  background-color: #40a9ff;
}

button i {
  font-size: 20px;
}

.grid-container {
  background-color: var(--background-bottom-navigation);
  margin: 0 10px; /* Ajuste a margem conforme necessário */
  padding: 10px;
  border-radius: 10px;
  margin-top: 55px;
  margin-bottom: 50px;
}
</style>
