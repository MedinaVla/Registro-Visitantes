import 'package:admin/src/core/shared_widgets/responsive.dart';
import 'package:admin/src/core/shared_widgets/text_form_widget.dart';
import 'package:admin/src/core/utils/validartor.dart';
import 'package:admin/src/features/registro/logic/registro_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// badge_outlined
class CiVisitor extends ConsumerWidget {
  CiVisitor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final double errorFont = Responsive.isMobile(context) ? 10.0 : 15.0;
    final ciController = watch(ciControllerProvider);

    return TextFormWidget(
      controller: ciController.state,
      errorFont: errorFont,
      labelText: 'CI',
      validator: validateCi(),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      iconValue: Icons.badge_outlined,
      maxLength: 11,
    );
  }
}
