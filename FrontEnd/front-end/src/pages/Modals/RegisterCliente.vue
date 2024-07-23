<template>
  <div 
    id="register"
    class="modal fade show shadow"
    tabindex="-1"
    role="dialog"
    style="display: block;"
    @click.self="closeModal"
    >
    <div class="register-card d-flex flex-column px-4 py-4">
      <div class="head">
        <h2 id="title" class="register-title">Create an account</h2>
        <h6 id="sub-title" class="register-title">Register your details to log in</h6>
      </div>
      <form id="form" class="px-5 pt-3">
        <div v-if="!showPasswordFields">
          <div class="row">
            <p id="required" class="mb-0">Required fields *</p>
            <div id="first-group" class="form-group col-md-6">
              <label for="name">Name <span id="req">*</span></label>
              <input 
                type="text"
                id="name"
                class="form-control form-control-sm"
                placeholder="Enter your name"
              >
            </div>
            <div id="first-group" class="form-group col-md-6">
              <label for="lastname">Lastname <span id="req">*</span></label>
              <input 
                type="text"
                id="lastname"
                class="form-control form-control-sm"
                placeholder="Enter your lastname"
              >
            </div>
          </div>
          <div class="row">
            <div class="form-group col-md-6">
              <label for="phone">Phone number <span id="req">*</span></label>
              <input 
                type="text"
                id="phone"
                class="form-control form-control-sm"
                placeholder="Enter your phone number"
              >
            </div>
            <div class="form-group col-md-6">
              <label for="id">Identification <span id="req">*</span></label>
              <select
                class="form-control form-control-sm"
                id="id"
                >
                <option value="" disabled selected>Select an identification</option>
                <option value="International">International</option>
                <option value="National">National</option>
              </select>
            </div>
          </div>
          <div class="form-group col-md-12">
            <label for="email">Email <span id="req">*</span></label>
            <input 
              type="email"
              id="email"
              class="form-control form-control-sm"
              placeholder="Enter your email"
            >
          </div>
          <div class="row">
            <div class="form-group col-md-6">
              <label for="genero">Genero <span id="req">*</span></label>
              <select
                class="form-control form-control-sm"
                id="genero"
                >
                <option value="" disabled selected>Select a genero</option>
                <option value="Masculino">Masculino</option>
                <option value="Femenino">Femenino</option>
              </select>
            </div>
            <div class="form-group col-md-6">
              <label for="born">Fecha de Nac <span id="req">*</span></label>
              <input 
                type="date"
                id="born"
                class="form-control form-control-sm"
                placeholder="Enter your date born"
              >
            </div>
          </div>
        </div>
        
        <div v-if="showPasswordFields" class="row">
          <div class="form-group col-md-12">
            <label for="password">Password <span id="req">*</span></label>
            <input 
              type="password"
              id="password"
              class="form-control form-control-sm"
              placeholder="Enter your password"
            >
          </div>
          <div class="form-group col-md-12">
            <label for="confirmPassword">Confirm Password <span id="req">*</span></label>
            <input 
              type="password"
              id="confirmPassword"
              class="form-control form-control-sm"
              placeholder="Confirm your password"
            >
          </div>
          <div class="d-flex justify-content-center pt-2">
            <button id="btn" type="button">Save</button>
        </div>
        </div>

        <div class="d-flex justify-content-center pt-2" v-if="!showPasswordFields">
          <button id="btn" type="button" @click="handleNext">Next</button>
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
      <p id="sing" class="register-link pt-4 m-0" v-if="!showPasswordFields">
        Don’t have an account? 
        <a 
          href="#"
          id="sing"
          >Log In</a>
      </p>
    </div>
  </div>
</template>

<script>
export default {
    name: 'RegisterCliente',
    data() {
      return {
        showPasswordFields: false
      };
    },
    methods: {
      closeModal() {
        this.$emit('close');
      },
      handleNext() {
        this.showPasswordFields = true;
      }
    }
}
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Comfortaa:wght@700&display=swap");
@import url("https://fonts.googleapis.com/css2?family=Comfortaa:wght@300..700&display=swap");

#register{
  width: 100%;
  height: 100vh;
  background-color: rgba(41, 41, 41, 0.6);
}

.register-card{
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background-color: white;
  border-radius: 5px;
  max-width: 600px;
  width: 100%;
  font-family: Comfortaa;
}

.register-title{
  text-align: center;
}

#title{
  font-size: 24px;
  font-weight: bold;
}

#sub-title{
  font-size: 12px;
  font-weight: bold;
  color: #ccc;
}

.divider {
  display: flex;  
  align-items: center;
  text-align: center;
  margin: 20px 0;
  font-size: 10px;
  color: #8e8c8c;
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

form label{
  font-weight: bold;
  font-size: 14px;
}

#or{
  padding-right: 6rem;
  padding-left: 6rem;
}

#btn{
  margin-top: 20px;
  width: 50%;
  background-color: #25082E;
  color: white;
  align-items: center;
  padding: .25rem;
  border: 1px solid #25082E;
  border-radius: 5px;
  font-size: 12px;
}

#btn-opc{
  font-size: 10px;
  color: black;
  background-color: transparent;
}

#sing{
  text-align: center;
  font-size: 12px;
  font-weight: bold;
  text-decoration: none
}

#first-group{
  padding-top: 0;
}

.form-group{
  padding-top: 20px;
}

#required{
  color: red;
  font-size: 8px;
  font-weight: bold;
}

#req{
  color: red;
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
