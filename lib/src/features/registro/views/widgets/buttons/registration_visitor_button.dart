import 'package:admin/src/core/shared_widgets/responsive.dart';
import 'package:admin/src/core/styles.dart';
import 'package:admin/src/features/registro/logic/registro_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SaveButtonForm extends ConsumerWidget {
  const SaveButtonForm({Key? key, required this.formKey}) : super(key: key);

  final formKey;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return ElevatedButton.icon(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: defaultPadding * 1.5,
          vertical: defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
        ),
      ),
      onPressed: () {
        // Validate returns true if the form is valid, or false otherwise.
        if (formKey.currentState!.validate()) {
          // If the form is valid, display a snackbar. In the real world,
          // you'd often call a server or save the information in a database.
          context.read(visitorNotifierProvider.notifier).insertVisitor();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Processing Data')),
          );
        }
      },
      icon: Icon(Icons.add),
      label: Text("Guardar"),
    );
  }
}
