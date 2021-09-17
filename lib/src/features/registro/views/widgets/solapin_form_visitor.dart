import 'package:flutter/material.dart';

class SolapinVisitor extends StatelessWidget {
  const SolapinVisitor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        //  controller: controller.number.value,
        keyboardType: TextInputType.number,
        // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        textInputAction: TextInputAction.next,
        // focusNode: controller.solapinFN,
        maxLength: 3,
        validator: (value) {
          // return controller.validateSolapin(value);
        },
        onFieldSubmitted: (_) {
          // controller.solapinFN.unfocus();
        },
        decoration: InputDecoration(
          icon: Icon(Icons.credit_card_outlined),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          labelText: "# Solapin",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        ));
  }
}
