<template>
  <ConviteLayout>
    <div class="w-full max-w-[450px] mt-24 p-4">
      <div class="grid grid-cols-3 gap-2">
        <div class="flex flex-col items-center py-4 rounded-lg background-bottom-navigation">
          <p class="text-[12px]">{{ $t('Total winnings') }}</p>
          <p class="text-2xl font-bold"> R$ {{ totalEarnings || 0 }}</p>
        </div>
        <div class="flex flex-col items-center py-4 rounded-lg background-bottom-navigation">
          <p class="text-[12px]">{{ $t('Total bets') }}</p>
          <p class="text-2xl font-bold"> R$ {{ totalBets || 0 }}</p>
        </div>
        <div class="flex flex-col items-center py-4 rounded-lg background-bottom-navigation">
          <p class="text-[12px]">{{ $t('Total bet') }}</p>
          <p class="text-2xl font-bold"> R$ {{ sumBets || 0 }}</p>
        </div>
         <div class="flex flex-col items-center py-4 rounded-lg background-bottom-navigation">
          <p class="text-[12px]">{{ $t('Total de Depósitos') }}</p>
          <p class="text-2xl font-bold"> R$ {{ totalDep || 0 }}</p>
        </div>
         <div class="flex flex-col items-center py-4 rounded-lg background-bottom-navigation">
          <p class="text-[12px]">{{ $t('Numero de Depósitos') }}</p>
          <p class="text-2xl font-bold">{{ numDep || 0 }}</p>
        </div>
         <div class="flex flex-col items-center py-4 rounded-lg background-bottom-navigation">
          <p class="text-[12px]">{{ $t('Maior Depósitos') }}</p>
          <p class="text-2xl font-bold"> R$ {{ maiorDep || 0 }}</p>
        </div>
         <div class="flex flex-col items-center py-4 rounded-lg background-bottom-navigation">
          <p class="text-[12px]">{{ $t('Menor Depósitos') }}</p>
          <p class="text-2xl font-bold"> R$ {{ menorDep || 0 }}</p>
        </div>
      </div>
    </div>
  </ConviteLayout>
</template>

<script>
import ConviteLayout from "@/Layouts/ConviteLayout.vue";
import HttpApi from "@/Services/HttpApi.js";
import { useSettingStore } from "@/Stores/SettingStore.js";
import { useAuthStore } from "@/Stores/Auth.js";

export default {
  components: {
    ConviteLayout
  },
  data() {
    return {
      sumBets: 0,
      totalBets: 0,
      totalEarnings: 0,
      numDep: 0,
      totalDep: 0,
      maiorDep: 0,
      menorDep: 0,
      profileUser: null,
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
  methods: {
    async getProfile() {
      this.isLoadingProfile = true;
      try {
        const response = await HttpApi.get('/profile/');
        const data = response.data;

        this.sumBets = data.sumBets !== undefined ? data.sumBets : 0;
        this.totalBets = data.totalBets !== undefined ? data.totalBets : 0;
        this.totalEarnings = data.totalEarnings !== undefined ? data.totalEarnings : 0;

        this.profileUser = data.user || null;
      } catch (error) {
        console.error(error);
        this.sumBets = 0;
        this.totalBets = 0;
        this.totalEarnings = 0;
      } finally {
        this.isLoadingProfile = false;
      }
    },
  },
  async created() {
    if (this.isAuthenticated) {
      await this.getProfile();
    }
  },
};
</script>

<style scoped>
/* Seu estilo aqui */
</style>
