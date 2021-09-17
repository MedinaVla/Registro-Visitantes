import 'package:flutter/material.dart';

class CiVisitor extends StatelessWidget {
  const CiVisitor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        // readOnly: !controller.isSwitched.value,
        keyboardType: TextInputType.number,
        // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        textInputAction: TextInputAction.next,
        maxLength: 11,
        // focusNode: controller.ciFN,
        validator: (value) {
          // return controller.validateCi(value);
        },
        onFieldSubmitted: (_) {
          // controller.solapinFN.requestFocus();
        },
        // controller: controller.ci.value,
        decoration: InputDecoration(
          icon: Icon(Icons.badge_outlined),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          labelText: "CI",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        ));
  }
}
