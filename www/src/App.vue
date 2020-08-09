<template>
  <div id="app">
    <img alt="Vue logo" src="./assets/logo.png" />
    <h1>{{ msg }}</h1>
  </div>
</template>

<script>
import * as wasm from "decrypto-wasm";

wasm.init();

export default {
  name: "App",
  data() {
    return {
      msg: wasm.hello_world(),
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
