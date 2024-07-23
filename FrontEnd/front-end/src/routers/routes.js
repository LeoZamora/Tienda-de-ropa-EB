import { createRouter, createWebHistory } from "vue-router";
import PrincipalPage from "@/pages/PrincipalPage.vue";
import DashboardPage from "@/pages/DashboardPage.vue"
import RegisterPage from '@/pages/Registers/RegisterPage.vue'
import LoginEmpPage from '@/pages/Logins/LoginEmpPage.vue'
import RegisterGeneralPage from '@/pages/Registers/RegisterGeneralPage.vue'
import LoginModal from '@/pages/Modals/LoginModal.vue'
import RegisterCliente from '@/pages/Modals/RegisterCliente.vue'

function isAuthenticated() {
    return !!localStorage.getItem('token');
}

export const routers = new createRouter({
    history: createWebHistory(),
    routes: [{
        path: '/',
        name: 'pagina_principal',
        component: PrincipalPage
    }, {
        path: '/exotic_boutique',
        name: 'dashboard',
        component: DashboardPage,
        meta: {requiresAuth: true}
    }, {
        path: '/exotic_boutique/register',
        name: 'register',
        component: RegisterPage
    }, {
        path: '/exotic_boutique/services/login_emp',
        name: 'login_emp',
        component: LoginEmpPage
    }, {
        path: '/exotic_boutique/services/register_emp',
        name: 'register_emp',
        component: RegisterGeneralPage
    }, {
        path: '/auth',
        component: LoginModal
    }, {
        path: '/reg',
        component: RegisterCliente
    }, {
        path: '/:pathMatch(.*)*',
        redirect: {name: 'login'}
    }]
})

routers.beforeEach((to, from, next) => {
    if (to.meta.requiresAuth && !isAuthenticated()) {
        next({name: 'login'})
    } else {
        next()
    }
})