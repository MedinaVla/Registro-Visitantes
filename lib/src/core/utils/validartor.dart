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
    Validators.patternRegExp(RegExp(r"^\d+$"), 'Solo se permite numeros'),
    Validators.required('Introduzca el numero')
  ]);
}
