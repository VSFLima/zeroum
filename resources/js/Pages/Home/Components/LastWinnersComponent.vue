<template>
  <div class="container-fluid">
    <div class="row">
      <div class="col-12">
        <div class="gains-slider-container">
          <div class="gains-section">
            <div class="icon-trofeu ml-2">
              <img src="/assets/images/trofeu.webp" alt="">
            </div>
            <div class="title-gains">
              <h1>ÚLTIMOS <br> GANHOS</h1>
            </div>
          </div>
          <div class="gains-con rounded-lg">
            <div class="gains-slider">
              <div class="logos-slide">
                <div class="slide-gains" v-for="(gain, index) in gains" :key="index">
                  <img :src="gain.image" :alt="gain.game">
                  <div class="status-gains">
                    <p class="player">{{ gain.player }}</p>
                    <p class="game">{{ gain.game }}</p>
                    <p class="valor">{{ gain.amount }}</p>
                  </div>
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
export default {
  data() {
    return {
      names: ['Camila', 'Guilherme', 'Rafaela', 'Hugo', 'Fernando', 'Isabela', 'Gabriela', 'Thales', 'Maria', 'Vitor', 'Vinícius', 'Aline', 'Priscila', 'Mariana', 'Rodrigo', 'Carla', 'Renato', 'Fernanda', 'Lucas', 'Ana', 'Pedro', 'Juliana', 'Matheus', 'Gabriel', 'Isabella', 'Amanda', 'Patrícia'],
      lastNames: ['Si****', 'Sa****', 'Ol****', 'Li****', 'Pe****', 'Fe****', 'Al****', 'So****', 'Co****', 'Ro****', 'Ma****', 'Ro****', 'Al****', 'Me****', 'Ca****', 'Go****', 'Ar****', 'Fe****', 'Ba****', 'Ri****', 'Ca****', 'Na****', 'Ca****', 'Di****', 'Mo****', 'Cr****', 'Co****'],
      games: [
        { name: 'Fortune Tiger', image: '/assets/images/games/tigre.webp' },
        { name: 'Big Bass', image: '/assets/images/games/big.png' },
        { name: 'The Dog House', image: '/assets/images/games/dog.png' },
        { name: 'Fruit Party', image: '/assets/images/games/fruit.png' },
        { name: 'Ganesha Gold', image: '/assets/images/games/gold.webp' },
        { name: 'Gates of Olympus', image: '/assets/images/games/gates.webp' },
        { name: 'Ganesha Fortune', image: '/assets/images/games/ganesha.webp' },
        { name: 'Fortune Mouse', image: '/assets/images/games/mouse.webp' },
        { name: 'Fortune Ox', image: '/assets/images/games/ox.webp' },
        { name: 'Fortune Rabbit', image: '/assets/images/games/rabbit.webp' },
        { name: 'Prosperity Fortune', image: '/assets/images/games/tree.webp' },
        { name: 'Sugar Rush', image: '/assets/images/games/sugar.png' },
      ],
      gains: [], // Lista vazia para armazenar os ganhos gerados aleatoriamente
    };
  },
  methods: {
    generateRandomName() {
      const randomName = this.names[Math.floor(Math.random() * this.names.length)];
      const randomLastName = this.lastNames[Math.floor(Math.random() * this.lastNames.length)];
      return `${randomName} ${randomLastName}`;
    },
    generateRandomGains() {
      const gains = [];
      for (let i = 0; i < 25; i++) {
        const randomGame = this.games[Math.floor(Math.random() * this.games.length)];
        const randomAmount = (Math.random() * (500 - 10) + 10).toFixed(2); // Gera valores entre R$ 10,00 e R$ 500,00
        gains.push({
          player: this.generateRandomName(),
          game: randomGame.name,
          amount: `R$ ${randomAmount}`,
          image: randomGame.image,
        });
      }
      return gains;
    },
  },
  created() {
    // Gerar ganhos aleatórios no momento de criação do componente
    this.gains = this.generateRandomGains();
  },
};
</script>
  
 
<style scoped>

.container {
  display: flex;
  justify-content: center;
}

.gains-slider-container {
  width: 100%;
  height: auto;
  display: flex;
  justify-content: space-between;
}

.gains-section {
  width: 220px;
  height: 100px;
  background: linear-gradient(90deg, #42EAA9 0%, #35AB7D 50%, #1D533E 100%);
  z-index: 10;
  display: flex;
  align-items: center;
  gap: 15px;
  border-top-left-radius: 6px;
  border-bottom-left-radius: 6px;
}

.icon-trofeu img {
  width: 90px;
}

.title-gains h1 {
  color: #fff;
  font-weight: 800;
  font-size: 25px;
}

.gains-con {
  width: calc(100% - 220px);
  overflow: hidden;
}

.gains-slider {
  overflow: hidden;
  padding-left: 220px;
  white-space: nowrap;
  position: relative;
  display: flex;
}

.gains-slider:before,
.gains-slider:after {
  position: absolute;
  top: 0;
  width: 220px;
  height: 100%;
  content: "";
  z-index: 2;
}

.gains-slider:before {
  left: 0;
}

.gains-slider:after {
  right: 0;
}

.gains-slider:hover .logos-slide {
  animation-play-state: paused;
}

.logos-slide {
  display: flex;
  animation: slide 35s infinite linear;
}

.slide-gains {
  background: linear-gradient(90deg, #42EAA9 0%, #2B8B66 25%, #1D533E 75%);
  margin-right: 15px;
  width: 200px;
  overflow: hidden;
  border-radius: 6px;
  display: flex;
  align-items: center;
  gap: 10px;
  height: 100%;
}

.slide-gains .player {
  font-family: Arial, sans-serif;
  color: #fff;
  font-weight: 500;
  font-size: 14px;
}

.slide-gains .game {
  font-family: Arial, sans-serif;
  color: #fff;
  font-size: 14px;
  margin: 0;
}

.slide-gains img {
  height: 100%;
  border-radius: 6px;
}

.slide-gains .valor {
  font-size: 19px;
  color: #ff0;
}

.logos-slide img {
  height: 100px;
}
@keyframes slide {
  0% {
    transform: translate(0);
  }
  to {
    transform: translate(-100%);
  }
}

@media only screen and (max-width: 600px) {
  .gains-section {
    width: 170px;
    height: 85px;
  }

  .icon-trofeu img {
    width: 60px;
  }

  .title-gains h1 {
    font-size: 14px;
  }

  .gains-slider {
    padding-left: 170px;
  }

  .slide-gains {
    height: 85px;
  }

  .gains-con {
    width: calc(100% - 170px);
    overflow: hidden;
  }
}
</style>