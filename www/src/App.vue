<template>
  <div id="app">
    <img alt="Vue logo" src="./assets/logo.png" />
    <h1>{{ msg }}</h1>
    <comp-menu v-if="app.get_state() == AppState.PRE" v-on:trigger="trigger"></comp-menu>
    <comp-game v-if="app.get_state() == AppState.GAME" v-on:trigger="trigger"></comp-game>
    <comp-end v-if="app.get_state() == AppState.END" v-on:trigger="trigger"></comp-end>
  </div>
</template>

<script>
import * as wasm from "decrypto-wasm";

import Menu from "./components/Menu.vue";
import Game from "./components/Game.vue";
import End from "./components/End.vue";

wasm.init();

export default {
  name: "App",
  components: {
    "comp-menu": Menu,
    "comp-game": Game,
    "comp-end": End,
  },
  methods: {
    trigger: function (new_state) {
      if (new_state != null && new_state != undefined) {
        this.app.trigger(new_state);
        this.tick();
      }
    },
    tick: function () {
      this.app.tick();
      this.$forceUpdate();
    },
  },
  data() {
    return {
      msg: wasm.hello_world(),
      app: new wasm.App(),
      AppState: wasm.AppState,
    };
  },
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
