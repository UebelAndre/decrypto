<template>
  <div id="comp-end">
    <button v-on:click="quit">Quit</button>
    <button v-on:click="play">Play Again</button>
  </div>
</template>

<script>
import * as wasm from "decrypto-wasm";

export default {
  name: "comp-end",
  props: ["app"],
  methods: {
    play: function (event) {
      if (event) {
        this.$emit("trigger", wasm.AppState.GAME);
      }
    },
    quit: function (event) {
      if (event) {
        this.$emit("trigger", wasm.AppState.PRE);
      }
    },
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
