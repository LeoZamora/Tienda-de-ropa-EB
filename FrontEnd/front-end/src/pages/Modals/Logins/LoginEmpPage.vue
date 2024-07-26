<template>
  <div class="login-container">
    <div class="login-card shadow">
      <h3 class="login-title">BIENVENIDO</h3>
      <form>
        <div class="form-group">
          <label for="user" id="label"><i class="bi bi-person-fill"></i></label>
          <input id="user" type="text" class="form-control" placeholder="User" />
        </div>
        <div class="form-group">
          <label for="pass" id="label"><i class="bi bi-key-fill"></i></label>
          <input id="pass" type="password" class="form-control" placeholder="Password" />
        </div>
        <button type="submit" class="btn btn-primary btn-block mt-3">Login</button>
      </form>
      <!-- <p class="register-link">
        ¿No tienes una cuenta?... <a id="register" href="#" class="">Registrarse</a>
      </p> -->
    </div>
    <div class="footer">
      <Footer_Comp />
    </div>
  </div>
</template>

<script>
import Footer_Comp from "@/components/Footer_Comp.vue";

export default {
  name: "LoginEmp",

  components: {
    Footer_Comp,
  },
};
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Comfortaa:wght@700&display=swap");
@import url("https://fonts.googleapis.com/css2?family=Comfortaa:wght@300..700&display=swap");

.login-container {
  position: relative;
  width: 100%;
  min-height: 100vh;
  background: url("@/assets/Fondos/pexels-curtis-adams-1694007-8031888.jpg") no-repeat center center fixed;
  background-size: cover;
  background-position: center;
  font-family: Comfortaa;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

.login-card {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background-color: rgb(255, 255, 255);
  padding: 1.5rem;
  border-radius: 15px;
  max-width: 350px;
  width: 100%;
}

.login-title {
  margin-bottom: 1rem;
  text-align: center;
  color: #800080;
  font-size: 1.25rem;
  font-weight: 900;
}

.form-group {
  margin-bottom: 0.75rem;
}

label {
  font-size: 0.875rem;
  color: #333;
}

.form-control {
  padding: 0.5rem;
  border-radius: 0.25rem;
  border: 1px solid #ccc;
  font-size: 0.875rem;
  width: 100%;
}

.form-control.is-invalid {
  border-color: #dc3545;
}

.invalid-feedback {
  color: #dc3545;
  font-size: 0.75rem;
  margin-top: 0.25rem;
}

.btn-primary {
  background-color: #800080;
  border: 1px solid #800080;
  padding: 0.5rem;
  border-radius: 0.25rem;
  width: 100%;
  font-size: 0.875rem;
}

.btn-primary:hover {
  background-color: #660066;
}

.register-link {
  text-align: center;
  margin-top: 0.75rem;
  font-size: 0.75rem;
}

.text-primary {
  color: #800080;
}

.text-primary:hover {
  color: #660066;
}

.bi {
  font-size: 24px;
}

#register {
  text-decoration: none;
  font-weight: bold;
}
</style>
