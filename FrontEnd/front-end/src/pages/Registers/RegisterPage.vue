<template>
  <div class="register-container">
    <Nav_BarCopy>
      <div><h1 id="name" class="mb-0 ms-5">Exotic Boutique</h1></div>
    </Nav_BarCopy>
    <div class="container d-flex justify-content-center">
      <div class="card shadow w-100" style="max-width: 900px">
        <div id="exit">
          <p><i class="bi bi-x-circle"></i></p>
        </div>
        <div class="card-body pt-0 d-flex justify-content-between">
          <div class="body col-6">
            <h2 class="card-title d-flex justify-content-center">Registro</h2>
            <p id="required" class="card-subtitle mb-2">Campos obligatorios *</p>
            <form class="pe-4">
              <div class="form-row d-flex justify-content-around">
                <div class="form-group col-md-6 pr-2">
                  <label for="nombre">Nombre <span id="req">*</span></label>
                  <input
                    type="text"
                    class="form-control"
                    id="nombre"
                    placeholder="Nombre"
                    v-model="cliente.Nombre"
                    :class="{ 'is-invalid': errors.errorName }"
                  />
                  <div v-if="errors.errorName" class="invalid-feedback">
                    {{ errors.errorName }}
                  </div>
                </div>
                <div id="names" class="form-group col-md-6 pr-2">
                  <label for="apellido">Apellido <span id="req">*</span></label>
                  <input
                    type="text"
                    class="form-control"
                    id="apellido"
                    placeholder="Apellido"
                    v-model="cliente.Apellido"
                    :class="{ 'is-invalid': errors.errorLast }"
                  />
                  <div v-if="errors.errorLast" class="invalid-feedback">
                    {{ errors.errorLast }}
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label for="gmail">Correo electrónico <span id="req">*</span></label>
                <div class="input-group">
                  <input
                    type="text"
                    class="form-control"
                    id="gmail"
                    placeholder="G-mail"
                    v-model="userInput"
                    :class="{ 'is-invalid': errors.errorUser }"
                  />
                  <div class="input-group-append">
                    <span class="input-group-text">{{ gmail }}</span>
                  </div>
                  <div v-if="errors.errorUser" class="invalid-feedback">
                    {{ errors.errorUser }}
                  </div>
                </div>
              </div>
              <div class="form-row d-flex" :class="{ 'is-invalid': errors.errorContras }">
                <div class="form-group col-md-6 pr-2">
                  <label for="contrasena">Contraseña <span id="req">*</span></label>
                  <input
                    type="password"
                    class="form-control"
                    id="contrasena"
                    placeholder="Contraseña"
                    v-model="cliente.Contraseña"
                    :class="{ 'is-invalid': errors.errorPass }"
                  />
                  <div v-if="errors.errorPass" class="invalid-feedback">
                    {{ errors.errorPass }}
                  </div>
                  <p id="small-text" class="form-text text-muted">
                    Utiliza ocho caracteres como mínimo con una combinación de letras,
                    números y símbolos
                  </p>
                </div>
                <div id="names" class="form-group col-md-6 pr-2">
                  <label for="confirmarContrasena"
                    >Confirmar la contraseña <span id="req">*</span></label
                  >
                  <input
                    type="password"
                    class="form-control"
                    id="confirmarContrasena"
                    placeholder="Contraseña"
                    v-model="confimPass"
                    :class="{ 'is-invalid': errors.errorConf }"
                  />
                  <div v-if="errors.errorConf" class="invalid-feedback">
                    {{ errors.errorConf }}
                  </div>
                </div>
              </div>
              <div v-if="errors.errorContras" class="invalid-feedback">
                  {{ errors.errorContras }}
              </div>
              <label for="genero">Genero <span id="req">*</span></label>
              <div class="form-group d-flex justify-content-between align-items-center">
                <div>
                  <select
                    class="form-control"
                    id="genero"
                    v-model="generos"
                    :class="{ 'is-invalid': errors.errorGene }"
                  >
                    <option value="" disabled selected>Selecione un genero</option>
                    <option value="Masculino">Masculino</option>
                    <option value="Femenino">Femenino</option>
                    <!-- <option value="Otro">Otro</option> -->
                  </select>
                </div>
                <div v-if="errors.errorGene" class="invalid-feedback">
                  {{ errors.errorGene }}
                </div>
                <div>
                  <button
                    type="submit"
                    class="btn btn-primary btn-block"
                    @click.prevent="saveUser"
                  >
                    Registrar
                  </button>
                </div>
              </div>
            </form>
            <div class="mt-4 text-start">
              <a id="iniciar" href="#" @click="backToLogin">Iniciar sesión...</a>
            </div>
          </div>
          <div id="img" class="col-4 me-5 d-none d-md-block">
            <img
              src="@/assets//imgs/icon.jpg"
              class="shadow w-100 rounded-circle"
              alt=""
            />
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Nav_BarCopy from "@/components/Nav_Bar.vue";
import { postCliente } from "@/services/RequestsHttp.js";
import { validationFields } from "@/Validations/validation.js";

export default {
  name: "RegisterUser",

  data() {
    return {
      gmail: "@gmail.com",
      userInput: "",
      cliente: {
        Nombre: "",
        Apellido: "",
        Genero: "",
        Users: "",
        Contraseña: "",
      },
      generos: "",
      confimPass: "",
      errors: {
        errorName: "",
        errorLast: "",
        errorPass: "",
        errorConf: "",
        errorGene: "",
        errorUser: "",
        errorContras: "",
      },
    };
  },

  components: {
    Nav_BarCopy,
  },

  watch: {
    userInput(val) {
      this.cliente.Users = val + this.gmail;
    }
  },

  methods: {
    backToLogin() {
      try {
        this.$router.push({ name: "login" });
      } catch (error) {
        console.log("Error: " + error);
      }
    },
    async saveUser() {
      const cliente = this.cliente
      const confimPass = this.confimPass
      const generos = this.generos
      const errors = this.errors

      const hasError = validationFields(cliente, confimPass, generos, errors)
      if (hasError) return;
      

      if (this.generos === "Masculino") {
        this.cliente.Genero = "M";
      } else {
        this.cliente.Genero = "F";
      }
      
      try {
        if (this.cliente.Contraseña !== this.confimPass) {
          this.errors.errorContras = "La contraseña no coincide";
          return;
        } else {
          postCliente(this.cliente);
          alert("Usuario registrado");
          this.$router.push({ name: "pagina_principal" });
        }
      } catch (error) {
        console.log("Error: " + error);
      }
    },
  },
};
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Comfortaa:wght@300..700&display=swap");

.register-container {
  position: relative;
  width: 100%;
  height: 100vh;
  background: url("/src/assets/imgs/bg/bg10.jpg") no-repeat center center fixed;
  background-size: cover;
  background-position: center;
}

label {
  font-size: 10px;
  font-weight: bold;
}

small {
  font-size: 8px;
  font-weight: bold;
}

.card {
  margin-top: 50px;
  font-family: Comfortaa;
  margin-top: 2%;
}

form {
  border-right: 1px solid rgb(161, 160, 160);
}

.body {
  padding: 1rem;
}

#required {
  color: red;
  font-size: 12px;
}

#req {
  color: red;
}

#img {
  margin-top: 60px;
}

#iniciar {
  text-decoration: none;
  color: blue;
}

#exit {
  text-align: right;
  font-size: 16px;
  padding: 0;
  margin: 0;
}

#exit p {
  margin-right: 2px;
  margin-bottom: 0;
}

#names {
  margin-left: 10px;
}

#small-text {
  font-size: 8px;
  font-weight: bold;
}

.invalid-feedback {
  color: #dc3545;
  font-size: 0.75rem;
  margin-top: 0.25rem;
}

#name {
  font-weight: bold;
  font-size: 32px;
  margin-left: 10px;
}
</style>
