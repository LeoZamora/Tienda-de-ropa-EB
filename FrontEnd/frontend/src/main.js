import '../public/animation.js'
import { createApp } from 'vue'
import App from './App.vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap/dist/js/bootstrap.min.js'
import 'bootstrap-icons/font/bootstrap-icons.css'

import { routers } from './routers/routes.js'
import store from './store'

createApp(App).use(store).use(routers).mount('#app')
