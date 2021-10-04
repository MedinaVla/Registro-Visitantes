import 'package:admin/src/core/shared_widgets/responsive.dart';
import 'package:admin/src/core/shared_widgets/text_form_widget.dart';
import 'package:admin/src/core/utils/validartor.dart';
import 'package:admin/src/features/registro/logic/registro_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SpellVisitor extends ConsumerWidget {
  SpellVisitor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final double errorFont = Responsive.isMobile(context) ? 10.0 : 15.0;
    final switchValue = watch(swtichProvider);
    final spellController = watch(spellControllerProvider);

    return TextFormWidget(
      controller: spellController.state,
      switchValue: !switchValue.state,
      errorFont: errorFont,
      labelText: 'Apellidos',
      validator: validateSpell(),
      iconValue: Icons.supervisor_account_outlined,
      maxLength: 60,
    );
  }
}
