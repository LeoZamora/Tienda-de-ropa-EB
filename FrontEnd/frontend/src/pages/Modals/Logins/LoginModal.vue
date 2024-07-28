<template>
    <div
      id="login-container"
      class="modal fade show"
      tabindex="-1"
      role="dialog"
      style="display: block;"
      @click.self="closeModal"
      >
  
      <div class="login-card shadow d-flex flex-column px-4 py-4">
        <div id="head">
          <h3 class="login-title pt-4">Welcome Back!!</h3>
          <h6 id="small-text" class="login-title">Enter your Credentials to access your account.</h6>
        </div>
        <form id="form" class="pt-2 px-5" @submit.prevent="validateForm">
          <div class="form-group">
            <label for="user" id="label">Email</label>
            <input 
              id="user" 
              type="email" 
              class="form-control form-control-sm" 
              placeholder="Enter your email"
              v-model="username"
              :class="{ 'is-invalid': usernameError }"/>
            <div v-if="usernameError" class="invalid-feedback">{{ usernameError }}</div>
          </div>
          <div class="form-group">
            <label for="password" id="label">Password</label>
            <div class="input-group">
              <input 
                type="password"
                id="password" 
                class="form-control form-control-sm"
                placeholder="Enter your password"
                v-model="password"
                :class="{ 'is-invalid': passwordError }"/>
              <div v-if="passwordError" class="invalid-feedback">{{ passwordError }}</div>

              <div class="input-group-append">
                <span class="input-group-text"><i class="bi bi-eye"></i></span>
              </div>
            </div>
          </div>
          <a href="#" id="forgot" class="py-2">Forgot Password?</a>
          <div>
            <button id="btn" type="submit">LOGIN</button>
          </div>
          <div id="or" class="pt-2">
            <div class="divider">Or</div>
          </div>
        </form>
        <div id="Options" class="d-flex justify-content-around">
            <div class="opc">
              <button 
                id="btn-opc" 
                type="button" 
                class="btn btn-secondary">
                  <i class="bi bi-google"></i>
                  Log in with Google
              </button>
            </div>
            <div class="opc">
              <button  
                id="btn-opc" 
                type="button" 
                class="btn btn-secondary">
                  <i class="bi bi-facebook"></i>
                  Log in with Facebook
              </button>
            </div>
        </div>
        <p id="register" class="register-link py-4 m-0">
          Don’t have an account? <a 
            href="#"
            id="register"
            @click="isVisible = true">Sign Up</a>
        </p>
      </div>
      <RegisterCliente v-if="isVisible" @close="isVisible = false"/>
    </div>
</template>

<script>
import { getUser, loginUser } from "@/services/RequestsHttp.js";
import { mapActions } from "vuex";
import RegisterCliente from "../Registers/RegisterCliente.vue";

export default {
    name: 'LoginModal',

    data() {
      return {
        username: "",
        password: "",
        usernameError: "",
        passwordError: "",
        loginError: "",

        isVisible: false,
        loginVisible: true
      }
    },

    components: {
      RegisterCliente
    },

    methods: {
      ...mapActions(["login"]),

      closeModal() {
        this.$emit('close');
      },

      async validateForm() {
        this.usernameError = this.passwordError = "";

        if (!this.username) {
          this.usernameError = "El nombre de usuario es obligatorio.";
        }
        if (!this.password) {
          this.passwordError = "La contraseña es obligatoria.";
        }

        if (this.usernameError || this.passwordError) {
          return;
        }

        try {
          const token = await loginUser(this.username, this.password);
          console.log(token);

          if (token) {
            localStorage.setItem("token", token);

            this.login();
            this.$router.push({ name: "dashboard" });
          } else {
            this.usernameError = "Nombre de usuario o contraseña incorrectos.";
          }
        } catch (error) {
          console.log("Error: " + error);
          this.usernameError =
            "Hubo un problema con el inicio de sesión. Por favor, intente de nuevo más tarde.";
        }
      },

      handleRegister() {
        try {
          this.$router.push({name: 'register'})
        } catch (error) {
          console.log(error);
        }
      },
    },

    created() {
      getUser()
    }
}
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Comfortaa:wght@700&display=swap");
@import url("https://fonts.googleapis.com/css2?family=Comfortaa:wght@300..700&display=swap");

#login-container{
  width: 100%;
  height: 100vh;
  background-color: rgba(41, 41, 41, 0.6);
}

.login-card{
  position: absolute;
  top: 42%;
  left: 50%;
  transform: translate(-50%, -50%);
  background-color: white;
  border-radius: 10px;
  max-width: 500px;
  width: 100%;
  font-family: Comfortaa;
  margin-top: 4rem;
  transition: all 250ms ease-in-out;
}

.login-title{
  text-align: center;
  font-weight: bold;
}

#small-text{
  font-size: 12px;
}

#sep{
  height: 5px;
  background-color: grey;
  border: 1px solid black;
}

.divider {
  display: flex;  
  align-items: center;
  text-align: center;
  margin: 20px 0;
  font-size: 10px;
  color: #ccc;
  font-weight: bold;
}
.divider::before, .divider::after {
  content: '';
  flex: 1;
  border-bottom: 2px solid #ccc;
}
.divider:not(:empty)::before {
  margin-right: 2em;
}
.divider:not(:empty)::after {
  margin-left: 2em;
}

#btn-opc{
  font-size: 10px;
  color: black;
  background-color: transparent;
}

#register{
  text-align: center;
  font-size: 12px;
  font-weight: bold;
  text-decoration: none
}

#btn{
  margin-top: 20px;
  width: 100%;
  background-color: #25082E;
  color: white;
  align-items: center;
  padding: .25rem;
  border: 1px solid #25082E;
  border-radius: 8px;
  font-size: 12px;
}

#forgot{
  display: flex;
  justify-content: end;
  font-size: 10px;
  text-decoration: none;
}

.form-group{
  padding-top: 20px;
  display: flex;
  flex-direction: column;
}

#label{
  font-size: 14px;
  font-weight: bold;
}

.invalid-feedback {
  color: #dc3545;
  font-size: 0.75rem;
  margin-top: 0.25rem;
}

.modal-enter,
.modal-leave-to{
  opacity: 0;

}

.modal-enter-active,
.modal-leave-active{
  transition: all 150ms ease-in-out;
}
</style>