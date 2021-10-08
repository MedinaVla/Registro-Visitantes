import 'package:admin/src/features/registro/logic/registro_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SwitchButtonHeaderWidget extends ConsumerWidget {
  const SwitchButtonHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final switchValue = watch(swtichProvider);

    return Switch(
        value: switchValue.state,
        onChanged: (bool value) {
          // print(switchValue.state);
          switchValue.state = value;

          ///Limpio los datos del formulario Visitante
          context
              .read(visitorNotifierProvider.notifier)
              .clearRegistrationForm();
        });
  }
}
