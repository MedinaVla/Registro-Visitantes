import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NameVisitor extends ConsumerWidget {
  const NameVisitor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return TextFormField(
        // readOnly: !controller.isSwitched.value,
        // controller: controller.name.value,
        maxLength: 30,
        textInputAction: TextInputAction.next,
        // focusNode: controller.nameFN,
        // validator: (value) {
        //   return controller.validateName(value!);
        // },
        // onFieldSubmitted: (_) {
        //   controller.spellFN.requestFocus();
        // },
        decoration: InputDecoration(
          icon: Icon(Icons.perm_identity),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          labelText: "Nombre",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        ));
  }
}
