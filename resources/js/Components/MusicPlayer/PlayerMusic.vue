<template>
  <div class="music-player w-full p-1 site-menu-item">
    <div class="flex justify-around items-center">
      <button @click="previousTrack" class="btn">
        <i class="fa-solid fa-backward-step colors-players"></i>
      </button>
      <button @click="togglePlay" class="btn">
        <i v-if="isPlaying" class="fa-solid fa-pause colors-players"></i>
        <i v-else class="fa-solid fa-play colors-players"></i>
      </button>
      <button @click="nextTrack" class="btn">
        <i class="fa-solid fa-forward-step colors-players"></i>
      </button>
      <button @click="restartTrack" class="btn">
        <i class="fa-solid fa-repeat colors-players"></i>
      </button>
    </div>
    <div class="flex fgd mt-1 justify-center items-center text-color" style="font-family: 'Helvetica', sans-serif;">
      <span>{{ currentTrackTitle }}</span>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      tracks: [],
      currentTrackIndex: 0,
      audio: null,
      isPlaying: false,
      isFetching: false,
    };
  },
  computed: {
    currentTrackTitle() {
      return this.tracks.length > 0 ? this.tracks[this.currentTrackIndex].name : '';
    },
  },
  methods: {
    async fetchTracks() {
      if (this.isFetching) return;
      this.isFetching = true;

      try {
        const response = await fetch('/api/musics');
        this.tracks = await response.json();
        console.log('Tracks fetched:', this.tracks);
        if (this.tracks.length > 0) {
          this.currentTrackIndex = 0;
          this.loadCurrentTrack();
          this.isPlaying = false;
        }
      } catch (error) {
        console.error('Error fetching tracks:', error);
      } finally {
        this.isFetching = false;
      }
    },
    loadCurrentTrack() {
      if (this.tracks.length === 0) return;
      if (this.audio) {
        const trackUrl = `/storage/${this.tracks[this.currentTrackIndex].path}`;
        console.log('Loading track:', trackUrl);
        this.audio.src = trackUrl;
        this.audio.load();
        console.log('Track loaded');
      }
    },
    playTrack() {
      if (this.tracks.length === 0) return;
      if (this.audio) {
        this.audio.play()
          .then(() => {
            this.isPlaying = true;
            console.log('Track playing');
          })
          .catch((error) => {
            console.error('Play error:', error);
          });
      }
    },
    togglePlay() {
      if (!this.audio) return;

      if (this.audio.paused) {
        this.playTrack();
      } else {
        this.audio.pause();
        this.isPlaying = false;
        console.log('Track paused');
      }
    },
    nextTrack() {
      this.currentTrackIndex = (this.currentTrackIndex + 1) % this.tracks.length;
      this.loadCurrentTrack();
      if (this.isPlaying) {
        this.playTrack();
      }
    },
    previousTrack() {
      this.currentTrackIndex = (this.currentTrackIndex - 1 + this.tracks.length) % this.tracks.length;
      this.loadCurrentTrack();
      if (this.isPlaying) {
        this.playTrack();
      }
    },
    restartTrack() {
      if (this.audio) {
        this.audio.currentTime = 0;
        if (this.isPlaying) {
          this.playTrack();
        }
      }
    },
    stopTrack() {
      if (this.audio) {
        this.audio.pause();
        // Do not clear the src here; keep it set to the current track URL
        // this.audio.src = ''; // Avoid this line
        this.audio.load(); // Just reset the load state if needed
      }
    },
  },
  mounted() {
    console.log('Mounted');
    this.audio = new Audio();
    this.audio.addEventListener('ended', this.nextTrack);
    this.audio.addEventListener('error', (e) => {
      console.error('Audio error:', e);
    });
    this.fetchTracks();
  },
  beforeDestroy() {
    if (this.audio) {
      this.audio.removeEventListener('ended', this.nextTrack);
      this.stopTrack();
    }
  },
};

</script>

<style scoped>
.music-player {
  border-radius: 8px;
}

.fgd {
  font-size: 10px;
}
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

body {
  font-family: 'Helvetica', sans-serif; /* Define a fonte Helvetica para todo o documento */
}
</style>
