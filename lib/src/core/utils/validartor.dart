import 'package:wc_form_validators/wc_form_validators.dart';

validateName() {
  return Validators.compose([
    Validators.patternRegExp(
        RegExp(r"[a-zA-ZñÑáéíóúÁÉÍÓÚ]+\s*[a-zA-ZñÑáéíóúÁÉÍÓÚ]*$"),
        'Solo se permite letras'),
    Validators.required('Introduzca el nombre')
  ]);
}

validateSpell() {
  return Validators.compose([
    Validators.patternRegExp(
        RegExp(r"[a-zA-ZñÑáéíóúÁÉÍÓÚ]+\s*[a-zA-ZñÑáéíóúÁÉÍÓÚ]*$"),
        'Solo se permite letras'),
    Validators.required('Introduzca el apellido')
  ]);
}

validateNumeber() {
  return Validators.compose([
    Validators.patternRegExp(RegExp(r"^\d+$"), 'Solo se permite números'),
    Validators.required('Introduzca el # solapín')
  ]);
}

validateCi() {
  return Validators.compose([
    Validators.patternRegExp(RegExp(r"^\d+$"), 'Solo se permite números'),
    Validators.minLength(11, 'El CI debe tener 11 digitos'),
    Validators.required('Introduzca el CI')
  ]);
}
