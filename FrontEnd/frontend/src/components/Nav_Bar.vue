<template>
  <div 
    id="header"
    class=" py-2 shadow-sm"
  >    
    <slot></slot>
  </div>
</template>

<script>

export default {
  name: "Nav_BarCopy",

  data() {
    return {
    };
  },

  components: {
  },

}
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Comfortaa:wght@700&display=swap");
@import url("https://fonts.googleapis.com/css2?family=Comfortaa:wght@300..700&display=swap");

#name {
  font-weight: bold;
  font-size: 24px;
}
#header {
  background-color: white;
  /* background-color: rgb(255, 255, 255, 60%);
  backdrop-filter: blur(10px);
  -webkit-backdrop-filter: blur(10px); */
  font-family: Comfortaa;
  border-radius: 5px;
}

</style>
