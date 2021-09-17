import 'package:flutter/material.dart';

class SpellVisitor extends StatelessWidget {
  const SpellVisitor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        // readOnly: !controller.isSwitched.value,
        // controller: controller.spell.value,
        maxLength: 60,
        // focusNode: controller.spellFN,
        textInputAction: TextInputAction.next,
        // validator: (value) {
        //   return controller.validateSpell(value!);
        // },
        // onFieldSubmitted: (_) {
        //   controller.ciFN.requestFocus();
        // },
        decoration: InputDecoration(
          icon: Icon(Icons.supervisor_account_outlined),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          labelText: "Apellidos",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        ));
  }
}
