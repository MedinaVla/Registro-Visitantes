import 'package:admin/src/core/shared_widgets/responsive.dart';
import 'package:admin/src/core/shared_widgets/text_form_widget.dart';
import 'package:admin/src/core/utils/validartor.dart';
import 'package:admin/src/features/registro/logic/registro_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SolapinVisitor extends ConsumerWidget {
  SolapinVisitor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final double errorFont = Responsive.isMobile(context) ? 10.0 : 15.0;
    final solapinController = watch(solapinControllerProvider);

    return TextFormWidget(
      controller: solapinController.state,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      errorFont: errorFont,
      labelText: '# Solapín',
      validator: (value) => validateName(value),
      iconValue: Icons.credit_card_outlined,
      maxLength: 3,
    );
  }
}
