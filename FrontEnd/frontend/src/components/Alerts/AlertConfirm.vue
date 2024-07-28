<template>
  <div 
    class="modal fade show"
    tabindex="-1"
    role="dialog"
    style="display: block; background: rgba(0, 0, 0, 0.5)"
  >
    <div id="modal" class="modal-dialog" role="document">
      <div class="modal-content shadow p-3">
        <div class="modal-header d-flex flex-column justify-content-center px-5 pb-0 pt-4">
          <div>
            <img src="../../assets/Icons/checked.png" width="30px" alt="">
          </div>
          <div class="mt-2">
            <h4 id="success">Successfully!</h4>
          </div>
        </div>
        <div class="modal-body">
          <div class="align-items-center">
            <p id="info" class="text-center">Usuario creado correctamente. Ya puedes iniciar sesion en nuestra pagina web.</p>
          </div>
          <div>
            <button id="btn-sc" class="btn" @click="closeModal">Aceptar</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'AlertSuccess',

  methods: {
    closeModal() {
      this.$emit('close')
    }
  }
}
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Comfortaa:wght@700&display=swap");
@import url("https://fonts.googleapis.com/css2?family=Comfortaa:wght@300..700&display=swap");

#modal{
  position: absolute;
  top: 45%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 400px;
  font-family: Comfortaa;
}

#btn-sc{
  width: 100%;
  color: white;
  font-weight: bold;
  background-color: #25082E;
}

#success{
  font-size: 18px;
  font-weight: bold;
}

#info{
  color: grey;
  font-size: 12px;
}
</style>