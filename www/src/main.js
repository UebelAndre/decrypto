import Vue from "vue";

const LoadApp = () => import("./App.vue");

Vue.config.productionTip = false;

LoadApp().then((App) =>
  new Vue({
    render: (h) => h(App.default),
  }).$mount("#app")
);
