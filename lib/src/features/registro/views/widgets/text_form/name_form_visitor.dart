import 'package:admin/src/core/shared_widgets/responsive.dart';
import 'package:admin/src/core/shared_widgets/text_form_widget.dart';
import 'package:admin/src/core/utils/validartor.dart';
import 'package:admin/src/features/registro/logic/registro_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NameVisitor extends ConsumerWidget {
  NameVisitor({Key? key}) : super(key: key);
  final name = TextEditingController();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final double errorFont = Responsive.isMobile(context) ? 10.0 : 15.0;
    final switchValue = watch(swtichProvider);
    return TextFormWidget(
      switchValue: !switchValue.state,
      nameController: name,
      errorFont: errorFont,
      labelText: 'Nombre',
      validator: (value) => validateName(value),
      iconValue: Icons.perm_identity,
      maxLength: 30,
    );
  }
}