<template>
  <div class="wrapper-footer ms-4 me-4 px-2 shadow">
    <div class="info">
      <p>@2024 Exotic Boutique</p>
    </div>
    <div class="redes">
      <a href=""><i class="bi bi-instagram"></i></a>
      <a href=""><i class="bi bi-facebook"></i></a>
      <a href=""><i class="bi bi-whatsapp"></i></a>
    </div>
  </div>
</template>

<script>
export default {
  name: "Footer_Comp",
};
</script>

<style scoped>
.wrapper-footer {
  background-color: rgb(255, 255, 255, 40%);
  backdrop-filter: blur(10px);
  -webkit-backdrop-filter: blur(10px);
  display: flex;
  justify-content: space-between;
  align-items: center;
  align-items: center;
  font-size: 14px;
  color: black;
  border-radius: 10px;
  padding-top: 6px;
  padding-bottom: 6px;
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
  /* width: 300px; */
  align-items: center;
  font-size: 18px;
}
.info p {
  margin-bottom: 0;
  font-size: 14px;
  font-weight: 900;
}
</style>
