// src/store/index.js
import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
    state: {
        currentTrackIndex: 0,
        isPlaying: false,
    },
    mutations: {
        setCurrentTrackIndex(state, index) {
            state.currentTrackIndex = index;
        },
        setIsPlaying(state, isPlaying) {
            state.isPlaying = isPlaying;
        },
    },
    actions: {
        updateTrackIndex({ commit }, index) {
            commit("setCurrentTrackIndex", index);
        },
        updateIsPlaying({ commit }, isPlaying) {
            commit("setIsPlaying", isPlaying);
        },
    },
    getters: {
        currentTrackIndex: (state) => state.currentTrackIndex,
        isPlaying: (state) => state.isPlaying,
    },
});
