// import store from "@/store";

export function deleteConfigAuth() {
    localStorage.removeItem('token');
    return;
}

export default {deleteConfigAuth}