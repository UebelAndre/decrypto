import Vue from "vue";

Vue.config.productionTip = false;

const renderDOM = document.querySelector("#app");

// Remove this if you don't want any loading message
// Because sometimes it is too fast and it just flashes, giving a bad experience
// renderDOM.innerHTML = "loading...";

// Load Vue application asynchronous.
// This will allow us to use web assembly within the app since it isn't in the main bundle anymore.
const LoadApp = () => import("./App.vue");
LoadApp().then((App) =>

  // Once the app is loaded, then render
  new Vue({
    render: (h) => h(App.default),
  }).$mount(renderDOM)
);
