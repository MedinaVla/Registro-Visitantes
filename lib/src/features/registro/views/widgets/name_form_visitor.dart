import 'package:admin/src/features/registro/logic/registro_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NameVisitor extends ConsumerWidget {
  NameVisitor({Key? key}) : super(key: key);
  final name = TextEditingController();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final switchValue = watch(swtichProvider);
    return TextFormField(
        readOnly: !switchValue.state,
        controller: name,
        maxLength: 30,
        textInputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor introduzca un nombre';
          }
          return null;
        },
        decoration: InputDecoration(
          icon: Icon(Icons.perm_identity),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          labelText: "Nombre",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          errorStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ));
  }
}
