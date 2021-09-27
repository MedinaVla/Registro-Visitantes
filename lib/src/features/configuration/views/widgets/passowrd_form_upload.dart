import 'package:admin/src/core/shared_widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordFormUpload extends ConsumerWidget {
  PasswordFormUpload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return TextFormWidget(
      errorFont: 15,
      labelText: 'Contraseña',
      validator: (value) {},
      iconValue: Icons.password,
      maxLength: 10,
      obscureText: true,
    );
  }
}
