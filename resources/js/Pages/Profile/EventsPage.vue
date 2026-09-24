<template>
    <div class="w-full max-w-[450px] pl-2 pr-2">
      <div class="flex w-full">
        <!-- Seção do botão de navegação -->
        <aside class="2x1:w-1/5 md:w-1/5 p-0 bg-transparent sticky top-0">
       <ul class="space-y-4 flex flex-col justify-center items-center">
  <button class="btn-nav custom-font flex flex-col justify-center items-center">
    <img class="w-auto h-8" src="/public/assets/images/XXXGHFFF.png" alt="Icone Events"> 
    <span>{{ $t('Events') }}</span>
  </button>
</ul>


        </aside>

        <!-- Área dos cards de eventos com scroll escondido -->
        <div class="2x1:w-4/5 md:w-4/5 pl-1 w-full h-[80vh] overflow-y-auto hide-scrollbar">
          <div class="grid grid-cols-1 w-full">
            <div v-for="(event, index) in events" :key="index" class="flex background-bottom-navigation items-center justify-center w-full rounded-lg p-2 mb-1 h-auto">
              <div class="h-auto relative">
                <img 
                  class="flex-col w-full cursor-pointer" 
                  :src="getImageSrc(event.image)" 
                  @click="openModal(event)"
                  alt="Event Image"
                >
                <div v-if="!event.image" class="text-red-500">Imagem não disponível</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Modal -->
    <div v-if="modalOpen" class="over-modals" @click="closeModal">
      <div v-if="modalOpen" tabindex="-1" aria-hidden="true" class="fixed inset-0 mongos flex flex-col items-center justify-center overflow-y-auto">
        <div class="relative w-[calc(100%-30px)] max-w-[420px] p-1 bg-white rounded-lg background-bottom-navigation">
          <!-- Botão de Fechar -->
          <button @click="closeModal" class="absolute justify-center items-center top-2 right-2">
            <i class="fa-solid fa-xmark text-white"></i>
          </button>
          
          <!-- Header do Modal -->
          <h2 class="custom-font-2 pl-2">Sobre o Evento</h2>

           <!-- Divider -->
          <hr class="my-2 mhfg" />
          <!-- Descrição do Evento -->
          <div class="custom-font  pl-2">
            <p>{{ stripHTML(selectedEvent?.descricao) }}</p>
          </div>
          
          <!-- Divider -->
          <hr class="my-2 mhfg" />

          <!-- Botão de Navegar para o Evento -->
          <div class="text-center">
            <button @click="navigateToEventPage" class="btbond custom-font text-[14px]">Navegar para o evento</button>
          </div>
        </div>
      </div>
    </div>
</template>

<script>
import BauLayout from "@/Layouts/BauLayout.vue";
import axios from 'axios';

export default {
  components: { BauLayout },
  data() {
    return {
      events: [],
      modalOpen: false,
      selectedEvent: null,
    };
  },
  async mounted() {
    await this.fetchEvents();
  },
  methods: {
    async fetchEvents() {
      try {
        const response = await axios.get('/api/events');
        console.log('Fetched events:', response.data); // Log dos eventos
        this.events = response.data;
      } catch (error) {
        console.error('Error fetching events:', error);
      }
    },
    openModal(event) {
      console.log('Opening modal with event:', event); // Log do evento selecionado
      this.selectedEvent = event;
      this.modalOpen = true;
    },
    closeModal() {
      this.modalOpen = false;
      this.selectedEvent = null;
    },
    navigateToEventPage() {
      if (this.selectedEvent) {
        const path = this.selectedEvent.caminho;
        console.log('Navigating to path:', path); // Log do caminho selecionado
        if (path) {
          this.$router.push(path).catch(err => {
            console.error('Navigation error:', err);
          });
        } else {
          console.warn('No path available for the event');
        }
      } else {
        console.warn('No selected event to navigate');
      }
    },
    stripHTML(html) {
      if (!html) return ''; // Retorna string vazia se não houver HTML
      html = html.replace(/<br\s*\/?>/gi, '\n');
      html = html.replace(/<p>/gi, '').replace(/<\/p>/gi, '\n\n');
      
      const doc = new DOMParser().parseFromString(html, 'text/html');
      return doc.body.textContent || "";
    },
    getImageSrc(image) {
      // Verifique o caminho da imagem e adicione um log
      console.log('Image path:', `/storage/${image}`);
      return `/storage/${image}`;
    }
  }
}
</script>

<style scoped>
.over-modals {
  position: fixed;
  top: 0;
  width: 100%;
  height: 100%;
  max-width: 450px;
  z-index: 55;
  background-color: rgba(0, 0, 0, 0.616);
}
.mongos {
  z-index: 55;
}

.cursor-pointer {
  cursor: pointer;
}
.mhfg {
     border-top : 1px solid var(--borders-and-dividers-colors);
}
.mhfgs {
    margin-bottom: 10px;
     border-bottom-width: 1px solid var(--borders-and-dividers-colors);
}
.btn-nav {
  border-radius: 7px;
  padding-right: 12px;
  padding-left: 12px;
  padding-top: 2px;
  padding-bottom: 2px;
  color: #fff;
  cursor: pointer;
  transition: background-color 0.3s ease;
  display: flex;
  align-items: center;
  position: relative;
  background-color: var(--background-bottom-navigation);
}

.btbond {
  border: 1px solid var(--borders-and-dividers-colors);
  border-radius: 8px;
  padding: 5px;
}

hr {
  border: 0;
  height: 1px;
  background: #ddd;
}
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

body {
  font-family: 'Helvetica', sans-serif; /* Define a fonte Helvetica para todo o documento */
}
.custom-font {
    font-family: 'Helvetica', sans-serif;
    font-size: 12px;
    color: var(--text-color);
    font-style: normal;
    font-weight: 400;
}
.custom-font-2 {
    font-family: 'Helvetica', sans-serif;
    font-size: 16px;
    padding: 5px;
    color: var(--text-color);
    font-style: normal;
    font-weight: 400;
    
}

/* CSS para esconder a barra de rolagem */
.hide-scrollbar {
  scrollbar-width: none; /* Firefox */
  -ms-overflow-style: none;  /* Internet Explorer 10+ */
}

.hide-scrollbar::-webkit-scrollbar {
  width: 0;  /* Safari e Chrome */
  height: 0; /* Safari e Chrome */
}

</style>
