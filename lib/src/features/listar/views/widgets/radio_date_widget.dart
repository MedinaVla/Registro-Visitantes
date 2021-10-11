import 'package:admin/src/features/listar/visitor/logic/visitor_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RadioDateWidget extends ConsumerWidget {
  const RadioDateWidget({Key? key}) : super(key: key);

  ValueChanged<String?> _valueChangedHandler(_radioButton) {
    return (value) {
      _radioButton.state = value!;
    };
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final StateController<String> _radioButton =
        watch(radioButtonStateProvider);
    return Column(
      children: <Widget>[
        Row(
          children: [
            Text('Fecha por Dia '),
            Radio<String>(
              value: 'day',
              groupValue: _radioButton.state,
              toggleable: true,
              onChanged: _valueChangedHandler(_radioButton),
              activeColor: Colors.blue,
            ),
          ],
        ),
        Row(
          children: [
            Text('Fecha por Mes'),
            Radio<String>(
              value: 'month',
              groupValue: _radioButton.state,
              toggleable: true,
              onChanged: _valueChangedHandler(_radioButton),
              activeColor: Colors.blue,
            ),
          ],
        ),
      ],
    );
  }
}
