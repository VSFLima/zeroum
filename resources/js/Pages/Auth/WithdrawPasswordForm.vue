<template>
  <div class="withdraw-password-form">
    <label for="withdraw-password" class="text-white mb-2 text-sm">
      Digite a senha de saque
    </label>
    <div class="password-inputs">
      <input
        v-for="(input, index) in passwordInputs"
        :key="index" type="password" maxlength="1" class="password-input" v-model="password[index]" @input="onInput(index)" @keydown.backspace="onBackspace(index)"
        :placeholder="'•'"
        ref="passwordInputs"
      />
    </div>
    <button @click="submitPassword" class="ui-button-blue w-full mt-4">
      <span class="uppercase font-semibold text-sm">Confirmar</span>
    </button>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      password: Array(6).fill(''),
      passwordInputs: Array(6).fill(null),
    };
  },
  methods: {
    onInput(index) {
      if (index < this.passwordInputs.length - 1 && this.password[index]) {
        this.$nextTick(() => {
          this.$refs.passwordInputs[index + 1].focus();
        });
      }
    },
    onBackspace(index) {
      if (index > 0 && !this.password[index]) {
        this.$nextTick(() => {
          this.$refs.passwordInputs[index - 1].focus();
        });
      }
    },
    async submitPassword() {
      const password = this.password.join('');

      try {
        const response = await axios.post('/api/withdrawal/verify-password', { password });
        if (response.status === 200) {
          // Senha verificada com sucesso, prossiga com o saque
          this.$emit('password-verified');
        }
      } catch (error) {
        // Senha incorreta
        console.error('Erro ao verificar a senha:', error.response.data.message);
      }
    },
  },
};
</script>
