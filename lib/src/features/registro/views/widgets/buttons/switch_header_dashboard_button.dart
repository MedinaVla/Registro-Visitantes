import 'package:admin/src/features/registro/logic/registro_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SwitchHeaderDashboardButton extends ConsumerWidget {
  const SwitchHeaderDashboardButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final switchValue = watch(swtichProvider);
    final name = watch(nameControllerProvider);
    final spell = watch(spellControllerProvider);
    final ci = watch(ciControllerProvider);
    final solapin = watch(solapinControllerProvider);
    return Switch(
        value: switchValue.state,
        onChanged: (bool value) {
          // print(switchValue.state);
          switchValue.state = value;
          _clearTextForm(name, spell, ci, solapin);
        });
  }

  _clearTextForm(name, spell, ci, solapin) {
    name.state.clear();
    spell.state.clear();
    ci.state.clear();
    solapin.state.clear();
  }
}
