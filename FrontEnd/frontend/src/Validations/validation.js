export function validationFields (cliente, generos, errors) {
    errors.errorGene = errors.errorUser = "";
    errors.errorLast = errors.errorName = "";
    errors.Fecha = "";

    if (!cliente.Nombre) {
      errors.errorName = "Ingrese un nombre";
    }
    if (!cliente.Apellido) {
      errors.errorLast = "Ingrese un apellido";
    }
    if (!cliente.Users) {
      errors.errorUser = "Ingrese un correo";
    }
    if (!cliente.Fecha_Nac) {
      errors.errorFecha = "Ingrese su fecha de nacimiento";
    }
    if (!generos) {
      errors.errorGene = "Ingrese un género";
    }
    
    return errors.errorGene || errors.errorLast || errors.errorName || errors.errorUser || errors.errorFecha;
}

export function validationPass (cliente, confimPass, errors) {
  errors.errorConf = errors.confimPass = errors.errorContras = ''

  if (cliente.Contraseña !== confimPass) {
    errors.errorContras = "La contraseña no coincide";
  }

  if (!cliente.Contraseña) {
    errors.errorPass = "Ingrese una contraseña";
  }
    
  if (!confimPass) {
    errors.errorConf = "Confirme su contraseña";
  }

  if (cliente.Contraseña.length < 8) {
    errors.errorPass = 'La contraseña debe tener mínimo 8 caracteres';
  }

  return errors.errorPass || errors.errorConf || errors.errorContras; 
}
