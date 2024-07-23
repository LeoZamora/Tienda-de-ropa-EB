<template>
    <div
      class="d-flex justify-content-between align-items-center"
    >
      <Side_Bar v-if="isVisible" @close="closeSideBar" />

      <div><h1 id="name" class="mb-0 px-2">Exotic Boutique</h1></div>
      <div>
        <nav id="items">
          <ul id="nav" class="nav d-flex">
            <li class="nav-item">
              <a class="nav-link" href="">HOME</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="">SHOP</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="">ABOUT</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="">CONTACT</a>
            </li>
          </ul>
        </nav>
      </div>
      <div class="shopping-cart d-flex justify-content-between">
        <button id="btn-op" class="btn btn-block me-2" @click="handleVisible">
          <i class="bi bi-list"></i>
        </button>
      </div>
    </div>
</template>

<script>
import Side_Bar from '@/components/Side_Bar.vue';

export default {
    name: "OptionNB",

  data() {
    return {
      error: "",
      isVisible: false,
    };
  },

  components: {
    Side_Bar,
  },

  methods: {
    handleClickLogin() {
      try {
        this.$router.push({ name: "login" });
      } catch (error) {
        console.log(error);
      }
    },
    handleClickRegister() {
      try {
        this.$router.push({ name: "register" });
      } catch (error) {
        console.log(error);
      }
    },
    handleVisible() {
      this.isVisible = true;
    },
    closeSideBar() {
      this.isVisible = false;
    },
  },
}
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Comfortaa:wght@700&display=swap");
@import url("https://fonts.googleapis.com/css2?family=Comfortaa:wght@300..700&display=swap");

#name {
  font-weight: bold;
  font-size: 32px;
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

#btn-op {
  background: transparent;
  color: black;
  font-size: 20px;
  font-weight: bold;
  border: none;
}
</style>