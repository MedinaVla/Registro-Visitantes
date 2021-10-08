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
class SaveButtonFormWidget extends ConsumerWidget {
  const SaveButtonFormWidget({Key? key, required this.formKey})
      : super(key: key);

  final formKey;
  static const int _snackBarDuration = 200;

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
      ),
    );
  }

  ///Function para guardar el Visitador
  _registrationButton({
    required BuildContext context,
    required ScopedReader watch,
    required nameWorker,
    required List<String>? listPlaces,
  }) {
    ///Si el formulario es valido guardo los datos
    if (formKey.currentState!.validate()) {
      // final visitor = watch(visitorStateProvider);
      context.read(changeVisitorProvider(listPlaces));

      ///Inserto los datos del visitante
      context.read(visitorNotifierProvider.notifier).insertVisitor(listPlaces);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Guardado Correctamente'),
          duration: Duration(milliseconds: _snackBarDuration),
        ),
      );
    }
  }
}
