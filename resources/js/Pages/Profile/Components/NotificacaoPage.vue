<template>
  <div class="notification-list w-full max-w-[450px]">
    <LoadingComponent v-if="isLoading" />
    <div v-else>
      <template v-if="notifications.length > 0">
        <div v-for="notification in notifications" :key="notification.id" class="notification-card w-full flex flex-col" @click="toggleExpand(notification.id)">
          <div class="flex w-full">
            <img :src="'/storage/' + notification.imagem" class="notification-image" />
            <h3 class="notification-title">{{ notification.titulo }}</h3>
          </div>

          <div class="notification-content">
            <p v-if="expandedNotificationId === notification.id" class="notification-message">
              {{ notification.message }}
            </p>
          </div>
        </div>
      </template>
      <template v-else>
        <div class="no-notifications flex flex-col items-center justify-center">
          <img :src="`/assets/images/img_none_sj.webp`" alt="Sem Notificações" class="w-auto h-auto max-h-[140px]" />
          <h3 class="text-color">{{ $t('Sem registro') }}</h3>
        </div>
      </template>
    </div>
  </div>
</template>

<script>
import HttpApi from "@/Services/HttpApi.js";
import LoadingComponent from "@/Components/UI/LoadingComponent.vue";

export default {
  components: { LoadingComponent },
  data() {
    return {
      isLoading: true,
      notifications: [],
      expandedNotificationId: null,
    };
  },
  methods: {
    async fetchNotifications() {
      try {
        const response = await HttpApi.get('/post-notifications');
        this.notifications = response.data;
        this.isLoading = false;
      } catch (error) {
        console.error('Error fetching notifications:', error);
        this.isLoading = false;
      }
    },
    toggleExpand(id) {
      this.expandedNotificationId = this.expandedNotificationId === id ? null : id;
    }
  },
  async created() {
    await this.fetchNotifications();
  }
};
</script>

<style scoped>
.notification-list {
  display: flex;
  flex-direction: column;
  gap: 20px; /* Aumentar o espaço entre os itens */
  height: 100vh; /* Ocupar toda a tela */
  overflow-y: auto; /* Adicionar rolagem vertical se necessário */
  padding: 2px; /* Adicionar algum preenchimento ao redor da lista */
}


.notification-card {
  border: 1px solid var(--borders-and-dividers-colors);
  border-radius: 5px;
  margin-top: 10px;
  padding: 15px; /* Aumentar o padding interno */
  transition: background-color 0.3s;
}


.notification-card:hover {
  background-color: var(--background-bottom-navigation);
}

.notification-image {
  width: 30px;
  height: 30px;
  object-fit: cover;
  border-radius: 5px;
  margin-right: 15px;
}

.notification-content {
  flex: 1;
}

.notification-title {
  margin: 0;
  font-size: 16px;
  color: var(--title-color)
}

.notification-message {
  margin-top: 10px;
  font-size: 14px;
  color: var(--text-color);
}

.no-notifications {
  height: 100%; /* Alcançar a altura total da tela */
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  text-align: center;
  color: var(--text-color);
  margin-bottom: 80px;
}

.no-notifications img {
  max-height: 140px;
  height: auto;
  width: auto;
}
</style>
