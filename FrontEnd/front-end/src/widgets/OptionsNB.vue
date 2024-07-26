<template>
    <div
      class="d-flex justify-content-between align-items-center"
    >
      <transition name="modal">
        <RegisterModal v-if="modalRegister" @close="modalRegister = false"/>
      </transition>
      <transition name="modal">
        <LoginModal  v-if="modalLogin" @close="modalLogin = false"/>
      </transition>
        <Side_Bar v-if="isVisible" @close="isVisible = false" />

      <div><h1 id="name" class="mb-0 ms-5">{{ namePage }}</h1></div>
      <div>
        <nav class="d-flex">
          <ul id="nav" class="nav">
            <li v-for="ls in list" :key="ls.ID_Option">
              <router-link :to="getRoute(ls.OptionNav)">
                <button id="btn-nv" class="btn">{{ ls.OptionNav }}</button>
              </router-link>
            </li>
          </ul>
        </nav>
      </div>
      <div class="shopping-cart d-flex justify-content-between">
        <button
          id="btn-in"
          type="button"
          class="btn btn-block me-3"
          @click="modalLogin = true"
        >
          <i id="person" class="bi bi-person"></i>
        </button>
        <button
          id="btn-up"
          type="button"
          class="btn btn-block me-5 shadow-sm"
          @click="modalRegister = true"
        >
          Sing Up
        </button>
        <button id="btn-op" class="btn btn-block me-2" @click="isVisible = true">
          <i class="bi bi-list"></i>
        </button>
      </div>
    </div>
</template>

<script>
import Side_Bar from '@/components/Side_Bar.vue';
import LoginModal from '@/pages/Logins/LoginModal.vue';
import RegisterModal from '@/pages/Registers/RegisterCliente.vue'
import { getInfoNB, getNamePage } from "@/services/RequestsHttp.js";

export default {
    name: "OptionNB",

  data() {
    return {
      list: [],
      namePage: '',
      error: "",
      isVisible: false,
      modalLogin: false,
      modalRegister: false
    };
  },

  components: {
    Side_Bar,
    LoginModal,
    RegisterModal
  },

  methods: {
    getRoute(name) {
      switch (name) {
        default:
          return { name: "pagina_principal" }; // Default route in case no match is found
      }
    },

    async loadItems() {
      try {
        const list = await getInfoNB();
        const name = await getNamePage();

        this.namePage = name
        this.list = list
      } catch (error) {
        console.log(error);
      }
    }
  },

  created() {
    this.loadItems()
  }
}
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Comfortaa:wght@700&display=swap");
@import url("https://fonts.googleapis.com/css2?family=Comfortaa:wght@300..700&display=swap");

#name {
  font-weight: bold;
  font-size: 32px;
  margin-left: 10px;
  color: black;
}
.nav li {
  font-size: 10px;
}
.nav li a {
  color: black;
}
.nav {
  margin-right: 60px;
  font-family: Comfortaa;
}

#nav{
  flex-grow: 1;
}

#btn-up {
  color: white;
  background-color: #503459;
  font-size: 10px;
  font-weight: bold;
  border: none;
}

#btn-in {
  background: transparent;
  font-size: 25px;
  font-weight: bold;
  border: none;
  padding: 0;
}

#btn-op {
  background: transparent;
  color: black;
  font-size: 16px;
  font-weight: bold;
  border: none;
}

#btn-nv{
  border: none;
  font-size: 12px;
}
</style>