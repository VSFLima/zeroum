<template>
  <div id="affiliate-page">
    <div class="promo-info">
      <div class="promo-title">
        <h3>Prêmios</h3>
        <div class="title-line"></div>
      </div>
      <div class="promo-content">
        <div class="promo-left">
          <div class="qr-save-container">
             <qrcode-vue ref="qrcode" :value="referencelink"  :size="85"></qrcode-vue>
            <button @click="downloadQRCode" class="save-btn">Salve</button>
          </div>
        </div>
        <div class="promo-right">
          <div class="link-section top-0">
            <div class="link-text">URL do convite</div>
            <div class="link-input">
              <div class="link-display text-color">
                <div class="link-content">
                  {{ referencelink }}
                </div>
                <button class="copy-btn" @click="copyToClipboard(referencelink)"><i class="far fa-copy"></i></button>
              </div>
            </div>
          </div>
          <div class="info-section flex flex-col">
    <span> Convidados diretos: <span class="number"> {{ indications }} </span></span>
    <span> Código de Convite: <span class="number"> {{ referencecode }} </span>
      <button class="copy-btn-id" @click="copyToClipboard(referencecode)"><i class="far fa-copy"></i></button>
    </span>
      <span> Convidados válidos: <span class="number"> {{ validIndications }} </span>
      </span>
  </div>
        </div>
      </div>
     <div class="share-icons scroll-container">
    <div class="share-item">
        <div class="icon-circle">
            <a :href="referencelink" target="_blank" rel="noopener noreferrer" class="">
                <i class="fa-regular fa-share-from-square"></i>
            </a>
        </div>
        <span  class="text-color">Compartilhe</span>
    </div>
    <div class="share-item">
        <a :href="'https://www.facebook.com/sharer/sharer.php?u=' + referencelink" target="_blank" rel="noopener noreferrer" class="">
            <i class="fab fa-facebook text-blue-500 text-4xl"></i>
        </a>
        <span class="text-color">Facebook</span>
    </div>
    <div class="share-item">
        <a :href="'https://www.instagram.com/direct/inbox/'" target="_blank" rel="noopener noreferrer" class="">
            <i class="fab fa-telegram text-blue-500 text-4xl"></i>
        </a>
        <span class="text-color">Telegram</span>
    </div>
    <div class="share-item">
        <a :href="'https://www.instagram.com/sharer.php?u=' + referencelink" target="_blank" rel="noopener noreferrer" class="">
            <i class="fab fa-instagram text-pink-500 text-4xl"></i>
        </a>
        <span class="text-color">Instagram</span>
    </div>
    <div class="share-item">
        <a :href="'https://api.whatsapp.com/send?text=' + referencelink" target="_blank" rel="noopener noreferrer" class="">
            <i class="fab fa-whatsapp text-green-500 text-4xl"></i>
        </a>
        <span class="text-color">Whatsapp</span>
    </div>
    <div class="share-item">
        <a :href="'https://twitter.com/intent/tweet?url=' + referencelink" target="_blank" rel="noopener noreferrer" class="">
            <i class="fab fa-twitter text-blue-400 text-4xl"></i>
        </a>
        <span class="text-color">Twitter</span>
    </div>
</div>

    </div>

    <div class="info">
      <p>
        Qual é a quantidade efetiva de recomendação? (Deve corresponder às condições abaixo)
      </p>
      <div class="info-item-top">
        <span  class="text-color">Depósitos acumulados do convidado</span><span>{{ userData.affiliate_bau_baseline }} ou mais</span>
      </div>
      <div class="info-item-bottom">
        <span  class="text-color">Apostas acumuladas do convidado</span><span>{{ userData.affiliate_bau_aposta }} ou mais</span>
      </div>
    </div>
    <div class="container">
      <!-- Linha 1 de baús -->
      <div class="row">
       <div class="chest" id="chest1" @click="verificarBau(1)">
    <img :src="chestImages[1]" alt="Baú" />
    <div class="chest-text-2" v-if="valuesToShow[1] !== undefined">
      {{ valuesToShow[1] }}
    </div>
    <div class="chest-text">
      <p>1 pessoa</p>
    </div>
    <div class="chest-value">{{ bauValue.toFixed(2) }}</div>
  </div>
       
         <div class="chest" id="chest2" @click="verificarBau(2)">
    <img :src="chestImages[2]" alt="Baú" />
    <div class="chest-text-2" v-if="valuesToShow[2] !== undefined">
      {{ valuesToShow[2] }}
    </div>
    <div class="chest-text">
      <p>2 pessoas</p>
    </div>
    <div class="chest-value">{{ bauValue.toFixed(2) }}</div>
  </div>
       
        <div class="chest" id="chest3" @click="verificarBau(3)">
          <img :src="chestImages[3]" alt="Baú" />
          <div class="chest-text-2" v-if="valuesToShow[3] !== undefined">
      {{ valuesToShow[3] }}
    </div>
          <div class="chest-text">
            <p>3 pessoas</p>
          </div>
          <div class="chest-value">{{ bauValue.toFixed(2) }}</div>
        </div>
       
        <div class="chest" id="chest4" @click="verificarBau(4)">
          <img :src="chestImages[4]" alt="Baú" />
          <div class="chest-text-2" v-if="valuesToShow[4] !== undefined">
      {{ valuesToShow[4] }}
    </div>
          <div class="chest-text">
            <p>4 pessoas</p>
          </div>
          <div class="chest-value">{{ bauValue.toFixed(2) }}</div>
        </div>
      </div>
      



      <!-- Linha 2 de baús -->
      <div class="row">
        <div class="chest" id="chest5" @click="verificarBau(5)">
          <img :src="chestImages[5]" alt="Baú" />
              <div class="chest-text-2" v-if="valuesToShow[5] !== undefined">
      {{ valuesToShow[5] }}
    </div>
          <div class="chest-text">
            <p>5 pessoas</p>
          </div>
          <div class="chest-value">{{ bauValue.toFixed(2) }}</div>
        </div>
       
        <div class="chest" id="chest6" @click="verificarBau(6)">
          <img :src="chestImages[6]" alt="Baú" />
              <div class="chest-text-2" v-if="valuesToShow[6] !== undefined">
      {{ valuesToShow[6] }}
    </div>
          <div class="chest-text">
            <p>6 pessoas</p>
          </div>
          <div class="chest-value">{{ bauValue.toFixed(2) }}</div>
        </div>
       
        <div class="chest" id="chest7" @click="verificarBau(7)">
          <img :src="chestImages[7]" alt="Baú" />
              <div class="chest-text-2" v-if="valuesToShow[7] !== undefined">
      {{ valuesToShow[7] }}
    </div>
          <div class="chest-text">
            <p>7 pessoas</p>
          </div>
          <div class="chest-value">{{ bauValue.toFixed(2) }}</div>
        </div>
       
        <div class="chest" id="chest8" @click="verificarBau(8)">
          <img :src="chestImages[8]" alt="Baú" />
              <div class="chest-text-2" v-if="valuesToShow[8] !== undefined">
      {{ valuesToShow[8] }}
    </div>
          <div class="chest-text">
            <p>8 pessoas</p>
          </div>
          <div class="chest-value">{{ bauValue.toFixed(2) }}</div>
        </div>
      </div>
     



      <!-- Linha 3 de baús -->
      <div class="row">
        <div class="chest" id="chest9" @click="verificarBau(9)">
          <img :src="chestImages[9]" alt="Baú" />
              <div class="chest-text-2" v-if="valuesToShow[9] !== undefined">
      {{ valuesToShow[9] }}
    </div>
          <div class="chest-text">
            <p>9 pessoas</p>
          </div>
          <div class="chest-value">{{ bauValue.toFixed(2) }}</div>
        </div>
       
        <div class="chest" id="chest10" @click="verificarBau(10)">
          <img :src="chestImages[10]" alt="Baú" />
              <div class="chest-text-2" v-if="valuesToShow[10] !== undefined">
      {{ valuesToShow[10] }}
    </div>
          <div class="chest-text">
            <p>10 pessoas</p>
          </div>
          <div class="chest-value">{{ bauValue.toFixed(2) }}</div>
        </div>
       
        <div class="chest" id="chest11" @click="verificarBau(11)">
          <img :src="chestImages[11]" alt="Baú" />
              <div class="chest-text-2" v-if="valuesToShow[11] !== undefined">
      {{ valuesToShow[11] }}
    </div>
          <div class="chest-text">
            <p>15 pessoas</p>
          </div>
          <div class="chest-value">{{ (bauValue * 5).toFixed(2) }}</div>
        </div>
       
        <div class="chest" id="chest12" @click="verificarBau(12)">
          <img :src="chestImages[12]" alt="Baú" />
              <div class="chest-text-2" v-if="valuesToShow[12] !== undefined">
      {{ valuesToShow[12] }}
    </div>
          <div class="chest-text">
            <p>20 pessoas</p>
          </div>
          <div class="chest-value">{{ (bauValue * 5).toFixed(2) }}</div>
        </div>
      </div>
      



      <!-- Linha 4 de baús -->
      <div class="row">
        <div class="chest" id="chest13" @click="verificarBau(13)">
          <img :src="chestImages[13]" alt="Baú" />
              <div class="chest-text-2" v-if="valuesToShow[13] !== undefined">
      {{ valuesToShow[13] }}
    </div>
          <div class="chest-text">
            <p>25 pessoas</p>
          </div>
          <div class="chest-value">{{ (bauValue * 5).toFixed(2) }}</div>
        </div>
       
        <div class="chest" id="chest14" @click="verificarBau(14)">
          <img :src="chestImages[14]" alt="Baú" />
              <div class="chest-text-2" v-if="valuesToShow[14] !== undefined">
      {{ valuesToShow[14] }}
    </div>
          <div class="chest-text">
            <p>30 pessoas</p>
          </div>
          <div class="chest-value">{{ (bauValue * 5).toFixed(2) }}</div>
        </div>
       
        <div class="chest" id="chest15" @click="verificarBau(15)">
          <img :src="chestImages[15]" alt="Baú" />
              <div class="chest-text-2" v-if="valuesToShow[15] !== undefined">
      {{ valuesToShow[15] }}
    </div>
          <div class="chest-text">
            <p>35 pessoas</p>
          </div>
          <div class="chest-value">{{ (bauValue * 5).toFixed(2) }}</div>
        </div>
       
        <div class="chest" id="chest16" @click="verificarBau(16)">
          <img :src="chestImages[16]" alt="Baú" />
              <div class="chest-text-2" v-if="valuesToShow[16] !== undefined">
      {{ valuesToShow[16] }}
    </div>
          <div class="chest-text">
            <p>40 pessoas</p>
          </div>
          <div class="chest-value">{{ (bauValue * 5).toFixed(2) }}</div>
        </div>
      </div>
     


      <!-- Linha 5 de baús -->
      <div class="row">
        <div class="chest" id="chest17" @click="verificarBau(17)">
          <img :src="chestImages[17]" alt="Baú" />
              <div class="chest-text-2" v-if="valuesToShow[17] !== undefined">
      {{ valuesToShow[17] }}
    </div>
          <div class="chest-text">
            <p>45 pessoas</p>
          </div>
          <div class="chest-value">{{ (bauValue * 5).toFixed(2) }}</div>
        </div>
       
        <div class="chest" id="chest18" @click="verificarBau(18)">
          <img :src="chestImages[18]" alt="Baú" />
              <div class="chest-text-2" v-if="valuesToShow[18] !== undefined">
      {{ valuesToShow[18] }}
    </div>
          <div class="chest-text">
            <p>50 pessoas</p>
          </div>
          <div class="chest-value">{{ (bauValue * 5).toFixed(2) }}</div>
        </div>
       
        <div class="chest" id="chest19" @click="verificarBau(19)">
          <img :src="chestImages[19]" alt="Baú" />
              <div class="chest-text-2" v-if="valuesToShow[19] !== undefined">
      {{ valuesToShow[19] }}
    </div>
          <div class="chest-text">
            <p>55 pessoas</p>
          </div>
          <div class="chest-value">{{ (bauValue * 5).toFixed(2) }}</div>
        </div>
       
        <div class="chest" id="chest20" @click="verificarBau(20)">
          <img :src="chestImages[20]" alt="Baú" />
              <div class="chest-text-2" v-if="valuesToShow[20] !== undefined">
      {{ valuesToShow[20] }}
    </div>
          <div class="chest-text">
            <p>60 pessoas</p>
          </div>
          <div class="chest-value">{{ (bauValue * 5).toFixed(2) }}</div>
        </div>
      </div>
      


      <!-- Linha 6 de baús -->
      <div class="row">
        <div class="chest" id="chest21" @click="verificarBau(21)">
          <img :src="chestImages[21]" alt="Baú" />
              <div class="chest-text-2" v-if="valuesToShow[21] !== undefined">
      {{ valuesToShow[21] }}
    </div>
          <div class="chest-text">
            <p>70 pessoas</p>
          </div>
          <div class="chest-value">{{ (bauValue * 10).toFixed(2) }}</div>
        </div>
       
        <div class="chest" id="chest22" @click="verificarBau(22)">
          <img :src="chestImages[22]" alt="Baú" />
              <div class="chest-text-2" v-if="valuesToShow[22] !== undefined">
      {{ valuesToShow[22] }}
    </div>
          <div class="chest-text">
            <p>80 pessoas</p>
          </div>
          <div class="chest-value">{{ (bauValue * 10).toFixed(2) }}</div>
        </div>
       
        <div class="chest" id="chest23" @click="verificarBau(23)">
          <img :src="chestImages[23]" alt="Baú" />
              <div class="chest-text-2" v-if="valuesToShow[23] !== undefined">
      {{ valuesToShow[23] }}
    </div>
          <div class="chest-text">
            <p>90 pessoas</p>
          </div>
          <div class="chest-value">{{ (bauValue * 10).toFixed(2) }}</div>
        </div>
       
        <div class="chest" id="chest24" @click="verificarBau(24)">
          <img :src="chestImages[24]" alt="Baú" />
              <div class="chest-text-2" v-if="valuesToShow[24] !== undefined">
      {{ valuesToShow[24] }}
    </div>
          <div class="chest-text">
            <p>100 pessoas</p>
          </div>
          <div class="chest-value">{{ (bauValue * 10).toFixed(2) }}</div>
        </div>
      </div>
     
      <!-- Linha 7 de baús -->
      <div class="row">
        <div class="chest" id="chest25" @click="verificarBau(25)">
          <img :src="chestImages[25]" alt="Baú" />
              <div class="chest-text-2" v-if="valuesToShow[25] !== undefined">
      {{ valuesToShow[25] }}
    </div>
          <div class="chest-text">
            <p>110 pessoas</p>
          </div>
          <div class="chest-value">{{ (bauValue * 10).toFixed(2) }}</div>
        </div>
       
        <div class="chest" id="chest26" @click="verificarBau(26)">
          <img :src="chestImages[26]" alt="Baú" />
              <div class="chest-text-2" v-if="valuesToShow[26] !== undefined">
      {{ valuesToShow[26] }}
    </div>
          <div class="chest-text">
            <p>120 pessoas</p>
          </div>
          <div class="chest-value">{{ (bauValue * 10).toFixed(2) }}</div>
        </div>
       
        <div class="chest" id="chest27" @click="verificarBau(27)">
          <img :src="chestImages[27]" alt="Baú" />
              <div class="chest-text-2" v-if="valuesToShow[27] !== undefined">
      {{ valuesToShow[27] }}
    </div>
          <div class="chest-text">
            <p>130 pessoas</p>
          </div>
          <div class="chest-value">{{ (bauValue * 10).toFixed(2) }}</div>
        </div>
       
        <div class="chest" id="chest28" @click="verificarBau(28)">
          <img :src="chestImages[28]" alt="Baú" />
              <div class="chest-text-2" v-if="valuesToShow[28] !== undefined">
      {{ valuesToShow[28] }}
    </div>
          <div class="chest-text">
            <p>140 pessoas</p>
          </div>
          <div class="chest-value">{{ (bauValue * 10).toFixed(2) }}</div>
        </div>
      </div>
      


      <!-- Linha 8 de baús -->
      <div class="row">
        <div class="chest" id="chest29" @click="verificarBau(29)">
          <img :src="chestImages[29]" alt="Baú" />
              <div class="chest-text-2" v-if="valuesToShow[29] !== undefined">
      {{ valuesToShow[29] }}
    </div>
          <div class="chest-text">
            <p>150 pessoas</p>
          </div>
          <div class="chest-value">{{ (bauValue * 10).toFixed(2) }}</div>
        </div>
       
        <div class="chest" id="chest30" @click="verificarBau(30)">
          <img :src="chestImages[30]" alt="Baú" />
              <div class="chest-text-2" v-if="valuesToShow[30] !== undefined">
      {{ valuesToShow[30] }}
    </div>
          <div class="chest-text">
            <p>160 pessoas</p>
          </div>
          <div class="chest-value">{{ (bauValue * 10).toFixed(2) }}</div>
        </div>
       
        <div class="chest" id="chest31" @click="verificarBau(31)">
          <img :src="chestImages[31]" alt="Baú" />
              <div class="chest-text-2" v-if="valuesToShow[31] !== undefined">
      {{ valuesToShow[31] }}
    </div>
          <div class="chest-text">
            <p>180 pessoas</p>
          </div>
          <div class="chest-value">{{ (bauValue * 20).toFixed(2) }}</div>
        </div>
       
        <div class="chest" id="chest32" @click="verificarBau(32)">
          <img :src="chestImages[32]" alt="Baú" />
              <div class="chest-text-2" v-if="valuesToShow[32] !== undefined">
      {{ valuesToShow[32] }}
    </div>
          <div class="chest-text">
            <p>200 pessoas</p>
          </div>
          <div class="chest-value">{{ (bauValue * 20).toFixed(2) }}</div>
        </div>
      </div>
     


      <!-- Linha 9 de baús -->
      <div class="row">
        <div class="chest" id="chest33" @click="verificarBau(33)">
          <img :src="chestImages[33]" alt="Baú" />
              <div class="chest-text-2" v-if="valuesToShow[33] !== undefined">
      {{ valuesToShow[33] }}
    </div>
          <div class="chest-text">
            <p>220 pessoas</p>
          </div>
          <div class="chest-value">{{ (bauValue * 20).toFixed(2) }}</div>
        </div>
       
        <div class="chest" id="chest34" @click="verificarBau(34)">
          <img :src="chestImages[34]" alt="Baú" />
              <div class="chest-text-2" v-if="valuesToShow[34] !== undefined">
      {{ valuesToShow[34] }}
    </div>
          <div class="chest-text">
            <p>240 pessoas</p>
          </div>
          <div class="chest-value">{{ (bauValue * 20).toFixed(2) }}</div>
        </div>
       
        <div class="chest" id="chest35" @click="verificarBau(35)">
          <img :src="chestImages[35]" alt="Baú" />
              <div class="chest-text-2" v-if="valuesToShow[35] !== undefined">
      {{ valuesToShow[35] }}
    </div>
          <div class="chest-text">
            <p>260 pessoas</p>
          </div>
          <div class="chest-value">{{ (bauValue * 20).toFixed(2) }}</div>
        </div>
       
        <div class="chest" id="chest36" @click="verificarBau(36)">
          <img :src="chestImages[36]" alt="Baú" />
              <div class="chest-text-2" v-if="valuesToShow[36] !== undefined">
      {{ valuesToShow[36] }}
    </div>
          <div class="chest-text">
            <p>280 pessoas</p>
          </div>
          <div class="chest-value">{{ (bauValue * 20).toFixed(2) }}</div>
        </div>
      </div>
      
      
      <!-- Linha 10 de baús -->
      <div class="row">
        <div class="chest" id="chest37" @click="verificarBau(37)">
          <img :src="chestImages[37]" alt="Baú" />
              <div class="chest-text-2" v-if="valuesToShow[37] !== undefined">
      {{ valuesToShow[37] }}
    </div>
          <div class="chest-text">
            <p>300 pessoas</p>
          </div>
          <div class="chest-value">{{ (bauValue * 20).toFixed(2) }}</div>
        </div>
       
        <div class="chest" id="chest38" @click="verificarBau(38)">
          <img :src="chestImages[38]" alt="Baú" />
              <div class="chest-text-2" v-if="valuesToShow[38] !== undefined">
      {{ valuesToShow[38] }}
    </div>
          <div class="chest-text">
            <p>320 pessoas</p>
          </div>
          <div class="chest-value">{{ (bauValue * 20).toFixed(2) }}</div>
        </div>
       
        <div class="chest" id="chest39" @click="verificarBau(39)">
          <img :src="chestImages[39]" alt="Baú" />
              <div class="chest-text-2" v-if="valuesToShow[39] !== undefined">
      {{ valuesToShow[39] }}
    </div>
          <div class="chest-text">
            <p>340 pessoas</p>
          </div>
          <div class="chest-value">{{ (bauValue * 20).toFixed(2) }}</div>
        </div>
       
        <div class="chest" id="chest40" @click="verificarBau(40)">
          <img :src="chestImages[40]" alt="Baú" />
          <div class="chest-text-2" v-if="valuesToShow[40] !== undefined">
          {{ valuesToShow[40] }}
        </div>
          <div class="chest-text">
            <p>360 pessoas</p>
          </div>
          <div class="chest-value">{{ (bauValue * 20).toFixed(2) }}</div>
        </div>
      </div>
    </div>

    <div class="details  text-color">
      <h3>I. Condições do Evento:</h3>
      <p>
        Somente o Convidado recém-registrado, atendem aos
        requisitos de atividade
      </p>
      <h3>II. Instruções Do Evento:</h3>
      <p>
        1. Convite amigos para abrir o Baú de Tesouros. Conclua com diferentes
        quantidades de pessoas para receber baús correspondentes, Quanto mais amigos você convidar, maior será a
        recompensa;
      </p>
      <p>
        2. Essa promoção é um bônus adicional da plataforma, e você também pode
        desfrutar de outras recompensas e comissões.;
      </p>
      <p>
        3. A recompensa é limitada à coleta manual e o expirado será distribuído automaticamente;
      </p>
      <p>
        4. O bônus é creditado automaticamente em sua conta de saque!;
      </p>
      <p>
        5. Este evento é limitado a operações normais realizadas pelo titular
        da conta. É proibido alugar, usar plug-ins externos, robôs, apostar em
        contas diferentes, brushing mútuo, arbitragem, interface, protocolo,
        exploração de vulnerabilidades, controle de grupo ou outros meios
        técnicos para participar. Caso contrário, as recompensas serão
        canceladas ou deduzidas, a conta será congelada ou até mesmo adicionada
        à lista negra;
      </p>
    </div>
  </div>

  <audio id="openSound">
  <source src="/public/storage/som/sombauopen.mp3" type="audio/mpeg">
  Seu navegador não suporta áudio.
</audio>
</template>


<script>
import QrcodeVue from 'qrcode.vue';
import BauLayout from "@/Layouts/BauLayout.vue";
import HttpApi from "@/Services/HttpApi.js";
import { useAuthStore } from "@/Stores/Auth.js";
import { useSettingStore } from "@/Stores/SettingStore.js";
import { useRouter } from 'vue-router';

export default {
    name: "AffiliatePage",
  components: { BauLayout, QrcodeVue },
  data() {
    return {
      referencecode: '',
      referencelink: '',
      indications: 0,
      validIndications: 0, // Adicionado para armazenar o número de indicações válidas
      bauValue: 0,
      ApostaNecessaria: 0,
      chestImages: {},
      valuesToShow: {}, // Novo objeto para armazenar os valores a serem mostrados
      bauId: 'ID_DO_BAU', // Substitua 'ID_DO_BAU' pelo valor real do ID do baú
      intervalId: null // Para armazenar o ID do setInterval
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
  },
    methods: {
        downloadQRCode() {
    const qrCodeElement = this.$refs.qrcode.$el; // Obtém o elemento do QR code
    const qrCodeDataURL = qrCodeElement.toDataURL(); // Converte o QR code em uma URL de dados

    const downloadLink = document.createElement('a');
    downloadLink.href = qrCodeDataURL;
    downloadLink.download = 'qrcode.png'; // Nome do arquivo a ser salvo
    downloadLink.click();
   
    },
    playOpenSound() {
    const openSound = document.getElementById('openSound');
    if (openSound) {
      openSound.play();
    }
  },
  // Se precisar parar o som em algum momento:
  stopOpenSound() {
    const openSound = document.getElementById('openSound');
    if (openSound) {
      openSound.pause();
      openSound.currentTime = 0;
    }
  },
    copyToClipboard(text) {
      navigator.clipboard.writeText(text).then(
        () => {
          console.log("Text copied to clipboard");
        },
        (err) => {
          console.error("Could not copy text: ", err);
        }
      );
    },
    getCode() {
      HttpApi.get('profile/affiliates/')
        .then(response => {
          if(response.data.code !== '' && response.data.code !== undefined && response.data.code !== null) {
            this.referencecode = response.data.code;
            this.referencelink = response.data.url;
          }
          this.indications = response.data.indications;
          this.validIndications = response.data.validIndications; // Atualizando o valor das indicações válidas
          this.bauValue = Number(response.data.bau_value);
          if(response.data.chest_images) {
            this.chestImages = response.data.chest_images;
          }
          if(response.data.values_to_show) {
            this.valuesToShow = response.data.values_to_show;
          }
        })
        .catch(error => {
          console.error("Error fetching code: ", error);
        });
    },
    verificarBau(bauId) {
      HttpApi.post(`profile/verificar-bau/${bauId}`)
        .then(response => {
          if (response.data.status) {
            this.abrirBau(bauId);
          } else {
            console.error(response.data.error);
          }
        })
        .catch(error => {
          console.error("Error verifying chest: ", error);
        });
    },
    abrirBau(bauId) {
      HttpApi.post(`profile/abrir-bau/${bauId}`)
        .then(response => {
          console.log(response.data.message);
            this.getCode(); 
          this.playOpenSound();
        })
        .catch(error => {
          console.error("Error opening chest: ", error);
        });
    },
    goHome() {
      console.log("Redirecting to home...");
      this.$router.push({ name: 'home' });
    },
  },
  created() {
    this.getCode();
  
  },
    mounted() {
    
  },
  beforeDestroy() {
  
  }
}
</script>

<style scoped>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

#affiliate-page {
    font-family: Arial, sans-serif;
    background-color: var(--background-color-cassino);
    color: var(--text-color);
    padding-left: 10px;
    padding-right: 10px;
    overflow-x: hidden;
    
}

.scroll-container {
    display: flex;
    overflow-x: auto;
    scrollbar-width: none; /* Para navegadores Firefox */
}

.scroll-container::-webkit-scrollbar {
    display: none; /* Para navegadores Chrome, Safari e Opera */
}

.promo-info {
    display: flex;
    flex-direction: column;
}

.promo-title {
    margin-bottom: 12px;
}

.promo-title h3 {
    margin: 0;
    color: var(--title-color);
    font-size: 16px;
    margin-top: 1px;
    margin-left: 10px;
}

.title-line {
    width: 100%;
    height: 1px;
    background-color: var(--borders-and-dividers-colors);
    margin-top: 5px;
    transform: scaleY(0.5); /* Reduz a altura pela metade */
}

.info, .container, .promo-info {
    background-color: var(--background-bottom-navigation);
    border-radius: 6px;
    padding: 10px;
    margin-bottom: 10px;
}
.details {
    background-color: var(--background-bottom-navigation);
    border-radius: 6px;
    padding: 10px;
    margin-bottom: 60px;
}

.promo-content {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.promo-left {
    margin-left: 8px;
    display: flex;
    flex-direction: column;
    align-items: center;
    height: 100%;
}

.promo-left img {
    width: 75px;
    height: 75px;
    margin-bottom: 10px;
}

.qr-save-container {
    display: flex;
    flex-direction: column;
    align-items: center;
}

.qr-save-container img {
    width: 65px;
    height: 68px;
    display: block;
    margin-bottom: 0;
    border-radius: 7px 7px 0px 0px;
    border: 5px solid #ffffff;
}

.save-btn {
    background-color: #a00bc6;
    color: var(--text-color);
    font-size: 12px;
    border: none;
    padding: 2px 0;
    border-radius: 0px 0px 8px 8px;
    cursor: pointer;
    width: 85px;
    height: 30px;
    text-align: center;
    display: block;
    margin-top: 0px;
}

.link-text {
    margin-left: 0px;
    color: var(--text-color);
    font-size: 12px;
}

.save-btn i {
    margin-right: 5px;
}

.share-icons {
    display: flex;
    justify-content: space-around;
    overflow-x: auto;
    padding: 10px 0;
}

.share-item {
    flex: 0 0 auto;
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-right: 10px;
    padding: 5px;
}

.custom-icon-container {
    padding: 10px;
}

.custom-icon {
    width: 45px;
    height: 45px;
    object-fit: cover;
}

.icon-circle {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 45px;
    height: 45px;
    border-radius: 50%;
    border-color: var(--borders-and-dividers-colors);
    border-width: 1px;
    border-width: solid;
}

.icon-circle i {
    color: var(--borders-and-dividers-colors);
}

.share-item img {
    width: 45px;
    height: 45px;
    object-fit: cover;
}

.share-item span {
    font-size: 11px;
    margin-top: 5px;
}

.valid-info {
    color: var(--text-color);
    font-size: 12px;
    padding-left: 2px;
    padding-top: 2px;
}

.blue-number {
    color: var(--borders-and-dividers-colors);
}

.valid-info a.details-link {
    color: var(--borders-and-dividers-colors);
    text-decoration: underline;
    margin-left: 5px;
}

.promo-right {
  width: 100%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    margin-left: 10px;
    margin-top: -1px;
    margin-right: 8px;
}

.link-section {
    width: 100%;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
}

.link-text {
   color: var(--text-color);
   font-size: 14px;
}

.link-input {
    display: flex;
    align-items: center;
    width: 100%;
    margin-top: 5px;
    margin-bottom: 15px;
    font-size: 12px;
}

.link-display {
    flex: 1;
    padding: 5px;
    border-color: var(--borders-and-dividers-colors);
    border-width: 1px;
    border-width: solid;
    border-radius: 5px;
    background-color: var(--background-color-cassino);
    box-sizing: border-box;
    height: auto;
    min-height: 50px;
    display: flex;
    align-items: center;
    position: relative;
    padding-right: 40px;
    padding-left: 5px;
    max-width: 100%;
    overflow-wrap: break-word;
}

.link-content {
    flex: 1;
    word-break: break-word;
}

.copy-btn {
    background: none;
    border: none;
    color: var(--text-color);
    cursor: pointer;
    position: absolute;
    right: 5px;
    font-size: 12px;
    padding: 5px;
}

.info-section {
    flex-direction: column;
    margin-bottom: 5px;
    color: var(--borders-and-dividers-colors);
    font-size: 12px;
}

.info-section span {
    display: inline-block;
    margin-bottom: 5px;
}

.info-section .number {
    color: var(--text-color);
}

.copy-btn-id {
    background: none;
    border: none;
    color: var(--text-color);
    cursor: pointer;
    font-size: 12px;
    margin-left: 7px;
    vertical-align: middle;
}

.info p {
    text-align: center;
    color: var(--text-color);
    font-size: 16px;
    margin-bottom: 10px;
}

.info-item-top, .info-item-bottom {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 5px;
    background-color: var(--background-color-cassino);
    border-radius: 6px;
    margin-bottom: 5px;
    font-size: 12px;
    white-space: nowrap;
}

.info-item-bottom {
    background-color: transparent;
}

.info-label, .info-value {
    margin: 0;
    padding: 0;
}

.info-item-top span, .info-item-bottom span {
    margin-left: 0;
    margin-right: 0;
    flex: 1;
    text-align: left;
}

.info-item-top span:last-child, .info-item-bottom span:last-child {
    text-align: right;
    color: var(--text-color);
}

.container {
    display: flex;
    flex-direction: column;
    gap: 5px;
}

.row {
    display: flex;
    justify-content: space-between;
    gap: 5px;
}

.chest {
    position: relative;
    padding: 0vw;
    text-align: center;
    flex: 1;
    min-width: 0;
    max-width: 100%;
    box-sizing: border-box;
}

.chest img {
    width: 100%;
    height: auto;
}

.chest-text {
    position: absolute;
    bottom: 35%;
    left: 50%;
    transform: translate(-50%, -50%);
    color: var(--text-color);
    font-size: 7px;
    text-align: center;
    white-space: nowrap;
    
}
.chest-text-2 {
    position: absolute;
    top: 35%;
    left: 50%;
    transform: translate(-50%, -50%);
    color: var(--text-color);
    font-size: 16px;
    text-align: center;
    white-space: nowrap;
    font: bold;
}

.chest-value {
    margin-top: 2px;
    color: var(--text-color);
    font-size: 12px;
    white-space: nowrap;
}

.arrow {
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 10px;
    color: var(--text-color);
    padding: 0 0vw;
    margin: 0 2px;
    white-space: nowrap;
}

.row-arrow-down {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 0vw;
    margin-bottom: 0vw;
}

.details h3 {
    margin-bottom: 5px;
    color: var(--text-color);
   font-size: 12px;
}

.details p {
    text-align: left;
    margin-bottom: 10px;
    font-size: 10px;
}

</style>
