import 'package:admin/src/core/shared_widgets/responsive.dart';
import 'package:admin/src/core/styles.dart';
import 'package:admin/src/features/registro/logic/registro_provider.dart';
import 'package:admin/src/features/registro/logic/select_places/select_places_provider.dart';
import 'package:admin/src/features/registro/logic/select_workers/select_workers_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:place/place.dart';
import 'package:intl/intl.dart';

class SaveButtonForm extends ConsumerWidget {
  const SaveButtonForm({Key? key, required this.formKey}) : super(key: key);

  final formKey;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final name = watch(nameControllerProvider);
    final spell = watch(spellControllerProvider);
    final ci = watch(ciControllerProvider);
    final solapin = watch(solapinControllerProvider);
    final namePlace = watch(selectPlacesProvider);
    final nameWorker = watch(selectWorkerProvider);
    final dateInVisit = DateFormat('dd-MM-yyyy').format(DateTime.now());
    final timeInVisit = DateFormat('kk:mm').format(DateTime.now());

    return ElevatedButton.icon(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: defaultPadding * 1.5,
          vertical: defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
        ),
      ),
      onPressed: () {
        print('El area es : ${namePlace.state}');
        if (formKey.currentState!.validate() &&
            namePlace.state.isNotEmpty &&
            nameWorker.state.isNotEmpty) {
          final visitor = watch(visitorStateProvider);
          print('El area es : ${namePlace.state}');

          visitor.state = VisitorModel(
              name: name.state.text,
              spell: spell.state.text,
              ci: int.parse(ci.state.text),
              solapin: int.parse(solapin.state.text),
              namePlace: namePlace.state,
              nameWorker: nameWorker.state,
              dateInVisit: dateInVisit,
              timeInVisit: timeInVisit,
              dateOnVisit: '',
              timeOnVisit: '');
          // If the form is valid, display a snackbar. In the real world,
          // you'd often call a server or save the information in a database.
          context.read(visitorNotifierProvider.notifier).insertVisitor();
          _clearTextForm(name, spell, ci, solapin);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Guardado Correctamente')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Revise los campos'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      icon: Icon(Icons.add),
      label: Text("Guardar"),
    );
  }

  _clearTextForm(name, spell, ci, solapin) {
    name.state.clear();
    spell.state.clear();
    ci.state.clear();
    solapin.state.clear();
  }
}
