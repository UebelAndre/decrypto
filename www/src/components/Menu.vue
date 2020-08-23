<template>
  <div id="comp-menu">
    <button v-on:click="click">Play</button>
  </div>
</template>

<script>
import * as wasm from "decrypto-wasm";

export default {
  name: "comp-menu",
  props: ["app"],
  methods: {
    click: function (event) {
      if (event) {
        this.$emit("trigger", wasm.AppState.GAME);
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
