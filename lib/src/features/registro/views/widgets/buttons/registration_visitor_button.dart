import 'package:admin/src/core/shared_widgets/responsive.dart';
import 'package:admin/src/core/styles.dart';
import 'package:admin/src/features/registro/logic/registro_provider.dart';
import 'package:admin/src/features/registro/logic/select_places/select_places_provider.dart';
import 'package:admin/src/features/registro/logic/select_workers/select_workers_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:place/place.dart';
import 'package:intl/intl.dart';

///Widget to save Form
class SaveButtonForm extends ConsumerWidget {
  const SaveButtonForm({Key? key, required this.formKey}) : super(key: key);

  final formKey;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    ///Obtengo las datos del Visitante
    final name = watch(nameControllerProvider);
    final spell = watch(spellControllerProvider);
    final ci = watch(ciControllerProvider);
    final solapin = watch(solapinControllerProvider);
    final namePlace = watch(selectPlacesProvider);
    final nameWorker = watch(selectWorkerProvider);
    final dateInVisit = DateFormat('dd-MM-yyyy').format(DateTime.now());
    final timeInVisit = DateFormat('kk:mm').format(DateTime.now());
    final placeSelected = watch(selectPlacesProvider);
    final state = watch(selectWorkersNotifer);

    ///Obtengo la Lista de los trabajadores que estan por defecto asignados al Selected Worker
    final listPlacesWorkerName = state.maybeWhen(
        data: (places) => places
            .where((element) => element.namePlace.contains(placeSelected.state))
            .map((e) => e.workerName)
            .toList(),
        orElse: () {});

    return ElevatedButton.icon(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: defaultPadding * 1.5,
          vertical: defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
        ),
      ),
      icon: Icon(Icons.add),
      label: Text("Guardar"),
      onPressed: () => _registrationButton(
          context: context,
          watch: watch,
          nameWorker: nameWorker,
          listPlaces: listPlacesWorkerName,
          name: name,
          spell: spell,
          ci: ci,
          solapin: solapin,
          namePlace: namePlace,
          dateInVisit: dateInVisit,
          timeInVisit: timeInVisit),
    );
  }

  ///Limpio los valores de Nombre Apellidos CI y Solapin
  _clearTextForm(name, spell, ci, solapin) {
    name.state.clear();
    spell.state.clear();
    ci.state.clear();
    solapin.state.clear();
  }

  ///Function para guardar el Visitador
  _registrationButton({
    required context,
    required ScopedReader watch,
    required nameWorker,
    required listPlaces,
    required name,
    required spell,
    required ci,
    required solapin,
    required namePlace,
    required dateInVisit,
    required timeInVisit,
  }) {
    ///Si no se da onTap en SelectWorker
    ///entonces el nombre del trabajador sera el primero
    ///de la lista de trabajadores por area
    ///
    nameWorker.state =
        nameWorker.state.isEmpty ? listPlaces!.first : nameWorker.state;

    ///Si el formulario es valido guardo los datos
    if (formKey.currentState!.validate()) {
      final visitor = watch(visitorStateProvider);

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
        const SnackBar(
          content: Text('Guardado Correctamente'),
          duration: Duration(milliseconds: 50),
        ),
      );
    }
  }
}
