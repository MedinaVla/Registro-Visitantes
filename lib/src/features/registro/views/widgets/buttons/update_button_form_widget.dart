import 'package:admin/src/core/shared_widgets/responsive.dart';
import 'package:admin/src/core/styles.dart';
import 'package:admin/src/features/listar/logic/visitor_provider.dart';
import 'package:admin/src/features/registro/logic/registro_provider.dart';
import 'package:admin/src/features/registro/logic/select_places/select_places_provider.dart';
import 'package:admin/src/features/registro/logic/select_workers/select_workers_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:place/place.dart';

///Widget to save Form
class UpdateButtonFormWidget extends ConsumerWidget {
  const UpdateButtonFormWidget({
    Key? key,
    required this.formKey,
    required this.visitor,
  }) : super(key: key);

  final formKey;
  final Visitor visitor;
  static const int _snackBarDuration = 500;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    ///Obtengo las datos del Visitante
    final workerSelected = watch(selectWorkerProvider);
    final placeSelected = watch(selectPlacesProvider);
    final selectWorkerList = watch(selectWorkersNotifer);
    final name = watch(nameControllerProvider);
    final spell = watch(spellControllerProvider);
    final ci = watch(ciControllerProvider);
    final solapin = watch(solapinControllerProvider);

    ///Obtengo la Lista de los trabajadores que estan por defecto asignados al Selected Worker
    final listPlacesWorkerName = selectWorkerList.maybeWhen(
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
          listPlaces: listPlacesWorkerName,
          name: name,
          spell: spell,
          ci: ci,
          solapin: solapin,
          workerSelected: workerSelected,
          placeSelected: placeSelected),
    );
  }

  ///Function para guardar el Visitador
  _registrationButton(
      {required BuildContext context,
      required ScopedReader watch,
      required List<String>? listPlaces,
      required name,
      required spell,
      required ci,
      required solapin,
      required workerSelected,
      required placeSelected}) {
    ///Si el formulario es valido guardo los datos
    if (formKey.currentState!.validate()) {
      ///Inserto los datos del visitante
      ///
      final nameWorker = workerSelected.state.isEmpty
          ? listPlaces!.first.toString()
          : workerSelected.state;

      final VisitorModel visitante = VisitorModel(
          id: visitor.id,
          name: name.state.text,
          spell: spell.state.text,
          ci: int.parse(ci.state.text),
          solapin: int.parse(solapin.state.text),
          namePlace: placeSelected.state,
          nameWorker: nameWorker,
          dateInVisit: visitor.dateInVisit,
          timeInVisit: visitor.timeInVisit,
          dateOnVisit: visitor.dateOnVisit,
          timeOnVisit: visitor.timeOnVisit);

      ///Update the dateOnVisitor and timeOnVisitor
      context
          .read(visitorNotifierUpdateProvider(visitante).notifier)
          .updateVisitor();

      ///Update datatable
      context.read(visitorDataTableNotifierProvider.notifier).getVisitors();
      Navigator.pop(context);
      // switchValue.state = false;
      name.state.clear();
      spell.state.clear();
      ci.state.clear();
      solapin.state.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Guardado Correctamente'),
          duration: Duration(milliseconds: _snackBarDuration),
        ),
      );
    }
  }
}
