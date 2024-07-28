<template>
  <div id="container">
    <div class="container">
      <div id="card" class="card shadow">
        <div id="exit">
          <p><i class="bi bi-x-circle"></i></p>
        </div>
        <div class="card-body">
          <div id="header" class="d-flex justify-content-between align-items-center mb-2">
            <h4 id="title" class="card-title text-center">Registro de empleado</h4>
            <img src="/src/assets/imgs/icon.jpg" class="shadow-sm" width="50px" alt="" />
          </div>
          <div id="required">
            <p>Campos requeridos *</p>
          </div>
          <form>
            <div class="row">
              <div class="col-md-6">
                <label for="Nombre1_Empleado"
                  >Primer Nombre: <span id="req">*</span></label
                >
                <input
                  type="text"
                  id="Nombre1_Empleado"
                  class="form-control"
                  placeholder="Ingrese su primer nombre"
                />
              </div>
              <div class="col-md-6">
                <label for="Nombre2_Empleado"
                  >Segundo Nombre: <span id="req">*</span></label
                >
                <input
                  type="text"
                  id="Nombre2_Empleado"
                  class="form-control"
                  placeholder="Ingrese su segundo nombre"
                />
              </div>
            </div>
            <div class="row mt-3">
              <div class="col-md-6">
                <label for="Apellido1_Empleado"
                  >Primer Apellido: <span id="req">*</span></label
                >
                <input
                  type="text"
                  id="Apellido1_Empleado"
                  class="form-control"
                  placeholder="Ingrese su primer apellido"
                />
              </div>
              <div class="col-md-6">
                <label for="Apellido2_Empleado"
                  >Segundo Apellido: <span id="req">*</span></label
                >
                <input
                  type="text"
                  id="Apellido2_Empleado"
                  class="form-control"
                  placeholder="Ingrese su segundo apellido"
                />
              </div>
            </div>
            <div class="row mt-3">
              <div class="col-md-6">
                <label for="No_INSS">No. INSS <span id="req">*</span></label>
                <input type="text" id="No_INSS" class="form-control" placeholder="INSS" />
              </div>
              <div class="col-md-6">
                <label for="No_Cedula">No. Cedula: <span id="req">*</span></label>
                <input
                  type="text"
                  id="No_Cedula"
                  class="form-control"
                  placeholder="Cedula"
                />
              </div>
            </div>
            <div class="row mt-3">
              <div class="col-md-6">
                <label for="Genero_Empleado">Genero <span>*</span></label>
                <select class="form-control" id="Genero_Empleado" required>
                  <option value="" disabled selected>Seleccione género</option>
                  <option value="Masculino">Masculino</option>
                  <option value="Femenino">Femenino</option>
                  <option value="Otro">Otro</option>
                </select>
              </div>
              <div class="col-md-6">
                <label for="Fecha_Nacimiento"
                  >Fecha de Nacimiento <span id="req">*</span></label
                >
                <input type="date" class="form-control" id="Fecha_Nacimiento" required />
              </div>
            </div>
            <div class="d-flex justify-content-end mt-4">
              <button type="submit" id="btn" class="btn me-2">Registrar</button>
              <button type="submit" class="btn btn-secondary ml-2">Cancelar</button>
            </div>
          </form>
        </div>
      </div>
    </div>
    <div class="footer">
      <Footer_Comp />
    </div>
  </div>
</template>

<script>
import Footer_Comp from "@/components/Footer_Comp.vue";

export default {
  name: "RegisterGPage",

  components: {
    Footer_Comp,
  },
};
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Comfortaa:wght@300..700&display=swap");

#container {
  position: relative;
  font-family: Comfortaa;
  background: url("@/assets/imgs/bg/bg13.jpg") no-repeat center center fixed;
  background-size: cover;
  background-position: center;
  width: 100%;
  min-height: 100vh;
}
.form-group label {
  font-weight: bold;
  font-size: 0.875rem; /* Tamaño reducido */
}
.form-control {
  font-size: 0.875rem; /* Tamaño reducido */
  padding: 0.375rem 0.75rem; /* Ajuste de padding */
}
#card {
  width: 600px;
  background-color: #fff;
  border-radius: 8px;
  margin-top: 1rem;
  padding: 1rem;
  padding-top: 0;
  max-width: 900px;
  margin-left: auto;
  margin-right: auto;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}
#img {
  border-radius: 50%;
  margin-bottom: 1rem;
}
#title {
  margin-bottom: 0;
  font-weight: bold;
}
.btn-primary {
  font-size: 0.875rem; /* Tamaño reducido para el botón */
}
#card-body {
  padding-top: 0;
}

#exit {
  text-align: right;
  font-size: 16px;
  padding-top: 0.5rem;
  margin: 0;
}
#exit p {
  margin-bottom: 0;
}

#required {
  font-size: 10px;
  font-weight: bold;
  color: red;
}
#req {
  color: red;
}

#header {
  border-bottom: 1px solid rgb(200, 200, 200);
}
#btn {
  background-color: #b695c0;
  color: white;
}
</style>
