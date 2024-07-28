<template>
  <div id="container" class="d-flex flex-column ">
    <Nav_BarCopy>
      <OptionsNB />
    </Nav_BarCopy>
    <div>
      <div id="cont-info">
        <div class="h-100" id="info" >
          <div id="info-content">
            <h2 id="title" class="text mb-2">Fashion & Style</h2>
            <p id="text" class="mb-4">
              Lorem ipsum dolor sit amet, consectetur adipisicing elit. Officiis natus
              voluptate id omnis earum delectus necessitatibus quam consectetur mollitia
            </p>
            <div id="btns" class="d-flex">
              <button id="btn-qs" type="button" class="btn shadow-sm">
                ¿Quienes somos?
              </button>
              <button id="btn-sn" type="button" class="btn shadow-sm">
                Sobre Nosotros
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- <div class="footer mt-auto">
      <Footer_Comp />
    </div> -->
  </div>
</template>

<script>
import Nav_BarCopy from "@/components/Nav_Bar.vue";
// import Footer_Comp from "../components/Footer_Comp.vue";
import { deleteConfigAuth } from "@/variables/APILogic";
import OptionsNB from "@/widgets/OptionsNB.vue";

export default {
  name: "Principal_Page",

  data() {
    return {
      list: []
    };
  },

  components: {
    Nav_BarCopy,
    OptionsNB
    // Footer_Comp,
  },

  methods: {
  },

  created() {
    deleteConfigAuth();
  },
};
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Comfortaa:wght@700&display=swap");
@import url("https://fonts.googleapis.com/css2?family=Comfortaa:wght@300..700&display=swap");

*{
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

#title {
  font-weight: bold;
  font-family: Georgia, "Times New Roman", Times, serif;
  font-style: italic;
  font-size: 32px;
}

#container {
  font-family: Comfortaa;
  /* margin: auto; */
}

#info {
  background: url("../assets/Fondos/pexels-laurachouette-21839235.jpg") no-repeat center center ; /* imagen de fondo */
  background-size: cover;
}

.main {
  overflow: auto;
}

#btn-qs {
  background-color: white;
  border: none;
  color: black;
  font-weight: bold;
  font-size: 16px;
  padding: 5px;
}
#btn-sn {
  background-color: rgb(255, 255, 255, 60%);
  backdrop-filter: blur(10px);
  -webkit-backdrop-filter: blur(10px);
  border: none;
  color: black;
  padding: 5px;
}

#cont-info{
  height: 92vh;
}

#text{
  font-size: 14px;
}

#info-content{
  position: absolute;
  width: 28%;
  top: 50%;
  left: 18%;
  transform: translate(-50%, -50%);
}

#btns{
  gap: 1rem;
}
</style>
