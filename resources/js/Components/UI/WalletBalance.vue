<template>
  <div class="border-l flex justify-between items-center custom-font">
    <img class="w-4 h-4 rounded-full" src="/public/assets/images/br.png">

    <button
      v-if="wallet?.total_balance !== undefined && !isLoadingWallet"
      @click="$router.push('/profile/wallet')"
      type="button"
      class="flex justify-center items-center mgd"
    >
      <div>
        <strong class="textsss">{{ formatBalance(displayedBalance) }}</strong>
      </div>
    </button>

    <button @click="refreshWallet" type="button" class="flex justify-center items-center ml-1">
      <img
        :class="{'spin': isLoadingWallet}"
        src="/public/assets/images/refresh.png"
        alt="Refresh"
        class="w-4 h-4"
      />
    </button>
  </div>
</template>


<script>
import HttpApi from "@/Services/HttpApi.js";
import { onMounted, ref } from "vue";
import { useRoute } from "vue-router";

export default {
  data() {
    return {
      isLoadingWallet: true,
      wallet: null,
      displayedBalance: 0,
      processInterval: null,
    };
  },
  setup() {
    const route = useRoute();
    const isCasinoPlayPage = ref(false);

    onMounted(() => {
      checkRoute();
    });

    function checkRoute() {
      isCasinoPlayPage.value = route.name === 'casinoPlayPage';
    }

    return {
      isCasinoPlayPage,
    };
  },
  beforeUnmount() {
    clearInterval(this.processInterval);
  },
  async created() {
    if (this.isCasinoPlayPage) {
      this.processInterval = setInterval(async () => {
        await this.getWallet();
      }, 5000);
    }
    await this.getWallet();
  },
  methods: {
     formatBalance(value) {
    return value.toFixed(2); // Formata o valor para 2 casas decimais
  },
    async getWallet() {
    try {
      const response = await HttpApi.get('profile/wallet');
      const newBalance = response.data.wallet.total_balance;
      this.animateBalance(this.wallet?.total_balance || 0, newBalance);
      this.wallet = response.data.wallet;
      this.isLoadingWallet = false;
    } catch (error) {
      console.error(error);
      this.isLoadingWallet = false;
    }
  },
  async refreshWallet() {
    this.isLoadingWallet = true;
    const response = await HttpApi.get('profile/wallet');
    const newBalance = response.data.wallet.total_balance;
    this.animateBalance(this.wallet?.total_balance || 0, newBalance);
    this.wallet = response.data.wallet;
    this.isLoadingWallet = false;
  },
  animateBalance(oldBalance, newBalance) {
    const duration = 1000; // duração da animação em ms
    const frameRate = 60; // frames por segundo
    const totalFrames = (duration / 1000) * frameRate;
    const increment = (newBalance - oldBalance) / totalFrames;
    let currentFrame = 0;

    const animate = () => {
      if (currentFrame < totalFrames) {
        this.displayedBalance = oldBalance + increment * currentFrame;
        currentFrame++;
        requestAnimationFrame(animate);
      } else {
        this.displayedBalance = newBalance;
      }
    };

      animate();
    }
  },
};
</script>

<style scoped>
.textsss {
    font-family: 'Roboto', sans-serif;
font-weight: 300; /* Ajusta a espessura da fonte */
color: var(--value-color-navtop);
font-size: 14px;
text-decoration: underline;
text-decoration-color: var(--value-color-navtop);
text-decoration-thickness: 1px;
text-underline-offset: 1px;
}

.border-l {
    border: 1px solid var(--borders-and-dividers-colors);
    border-radius: 50px;
    padding: 1px;
}
.mgd{
  margin-left: 1px;
}
.spin {
    animation: spin 1s linear infinite;
}

@keyframes spin {
    0% {
      transform: rotate(0deg);
    }
    100% {
      transform: rotate(360deg);
    }
}
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

body {
  font-family: 'Helvetica', sans-serif; /* Define a fonte Helvetica para todo o documento */
}
.custom-font {
    font-family:'Helvetica', sans-serif;
    font-style: normal;
    line-height: normal;
    font-weight: 400;
}
</style>
