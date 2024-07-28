<template>
  <div
    class="modal fade show"
    tabindex="-1"
    role="dialog"
    style="display: block; background: rgba(0, 0, 0, 0.3)"
    @click.self="closeSideBar()"
  >
    <div
      class="d-flex flex-column flex-shrink-0 p-3 vh-100 shadow"
      style="width: 280px"
      id="sidebar"
      ref="sidebar"
    >
      <a
        href="/"
        class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none"
      >
        <img
          src="../assets/imgs/icon-modified.png"
          width="50px"
          class="me-3 shadow-sm rounded-circle"
        />
        <span class="fs-4">E & B</span></a
      >
      <hr />

      <ul class="nav nav-pills flex-column mb-auto">
        <li class="nav-item">
          <a href="#" class="nav-link link-dark">
            <i class="bi bi-house me-2"></i>
            Home
          </a>
        </li>
        <li class="nav-item">
          <a href="#" class="nav-link link-dark">
            <i class="bi bi-speedometer2 me-2"></i>
            Shop
          </a>
        </li>
        <li class="nav-item">
          <a href="#" class="nav-link link-dark">
            <i class="bi bi-table me-2"></i>
            About
          </a>
        </li>
        <li class="nav-item">
          <a href="#" class="nav-link link-dark">
            <i class="bi bi-grid me-2"></i>
            Contact
          </a>
        </li>
        <li @click="handleClick" class="nav-item">
          <a href="#" class="nav-link link-dark">
            <i class="bi bi-person-circle me-2"></i>
            Collaborators
          </a>
        </li>
      </ul>
      <hr />
      <div class="d-flex flex-column text-center">
        <div class="info">
          <p>@2024 Exotic Boutique</p>
        </div>
        <div>
          <div class="redes">
            <a href=""><i class="bi bi-instagram"></i></a>
            <a href=""><i class="bi bi-facebook"></i></a>
            <a href=""><i class="bi bi-whatsapp"></i></a>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "SideBar",

  data() {
    return {
      isVisible: true,
    };
  },

  methods: {
    closeSideBar() {
      this.$emit("close");
    },
    handleClick() {
      this.$router.push({name: 'login_emp'});
    },
  },
};
</script>

<style scoped>
#sidebar {
  border-top-right-radius: 10px;
  border-bottom-right-radius: 10px;
  /* background-color: rgb(255, 255, 255, 60%);
  backdrop-filter: blur(20px);
  -webkit-backdrop-filter: blur(20px); */
  background-color: white;
}

.redes {
  display: flex;
  gap: 0.5rem;
  font-size: 15px;
  /* width: 100%; */
  justify-content: center;
  /* margin-top: 5px; */
}
.redes .bi {
  font-size: 20px;
  color: black;
  transition: 0.5s;
}
.redes .bi:hover {
  color: white;
  transition: 0.5s;
}
.redes a {
  transition: 0.5s;
}
.redes a:hover {
  transform: scale(1.1);
  transition: 0.5s;
}
.info {
  font-family: Comfortaa;
  font-weight: bold;
  align-items: center;
  font-size: 18px;
}
.info p {
  margin-bottom: 0;
  font-size: 14px;
  font-weight: 900;
}
</style>
