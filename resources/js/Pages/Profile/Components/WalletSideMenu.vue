<template>
  <div>
    <h1 class="text-2xl font-bold mb-3">{{ $t('Wallet') }}</h1>
    <div class="flex space-x-4">
      <button @click="navigate('profileWallet')" class="btn">{{ $t('Balance') }}</button>
      <button @click="navigate('profileDeposit')" class="btn">{{ $t('Deposit') }}</button>
      <button @click="navigate('profileWithdraw')" class="btn">{{ $t('Withdraw') }}</button>
      <button @click="navigate('profileTransactions')" class="btn">{{ $t('Transactions') }}</button>
    </div>
  </div>
</template>


<script>
export default {
  props: [],
  components: {},
  data() {
    return {
      isLoading: false,
    };
  },
  setup(props) {
    return {};
  },
  computed: {},
  mounted() {},
  methods: {
    navigate(routeName) {
      this.$router.push({ name: routeName });
    },
  },
  watch: {},
};
</script>


<style scoped>
.btn {
  padding: 10px 20px;
  background-color: #4a5568;
  color: #fff;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.btn:hover {
  background-color: #2d3748;
}
</style>

