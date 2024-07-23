export function validationFields (cliente, confimPass, generos, errors) {
    errors.errorConf = errors.errorGene = "";
    errors.errorLast = errors.errorName = "";
    errors.errorPass = errors.errorUser = "";

    if (!cliente.Nombre) {
      errors.errorName = "Ingrese un nombre";
    }
    if (!cliente.Apellido) {
      errors.errorLast = "Ingrese un apellido";
    }
    if (!cliente.Users) {
      errors.errorUser = "Ingrese un correo";
    }
    if (!cliente.Contraseña) {
      errors.errorPass = "Ingrese una contraseña";
    }
    
    if (cliente.Contraseña.length < 8) {
      errors.errorPass = 'La contraseña debe tener mínimo 8 caracteres';
    }

    if (!confimPass) {
      errors.errorConf = "Confirme su contraseña";
    }
    if (!generos) {
      errors.errorGene = "Ingrese un género";
    }
    
    return errors.errorConf || errors.errorGene || errors.errorLast || errors.errorName || errors.errorPass || errors.errorUser;
}
