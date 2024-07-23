<template>
  <div id="container" class="d-flex flex-column vh-100">
    <Nav_Bar>
      <OptionsDB />
    </Nav_Bar>
    <div class="container"></div>
    <div class="footer">
      <Footer_Comp />
    </div>
  </div>
</template>

<script>
import Nav_Bar from "@/components/Nav_Bar.vue";
import Footer_Comp from "@/components/Footer_Comp.vue";
import { mapGetters } from "vuex";
import OptionsDB from "@/widgets/OptionsDB.vue";

export default {
  name: "DashboardPage",

  components: {
    Nav_Bar,
    Footer_Comp,
    OptionsDB
  },

  computed: {
    ...mapGetters(["isLoggedIn"]),
  },
};
</script>

<style>
.footer {
  flex: 0 0 0; /* 10% del alto del viewport */
  position: absolute;
  bottom: 0;
  width: 100%;
  text-align: center;
  /* padding: 1rem 0; */
}

#container {
  background: url("../assets/Fondos/pexels-laurachouette-21839235.jpg") no-repeat center center fixed;
  background-size: cover;
} 
</style>
