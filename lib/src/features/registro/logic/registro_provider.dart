import 'dart:async';
import 'dart:convert';

import 'package:admin/src/features/listar/logic/export_visitor/logic/export_visitor_provider.dart';
import 'package:external_asset_bundle/external_asset_bundle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:place/place.dart';

import 'registro_state.dart';
import 'select_places/select_places_provider.dart';
import 'select_workers/select_workers_provider.dart';

export 'registro_state.dart';

part 'registro_state_notifier.dart';

/// Provider que administra los datos y el state del visitante
final visitorNotifierProvider =
    StateNotifierProvider.family<VisitorNotifier, RegistroState, VisitorModel>(
        (ref, visitor) {
  return VisitorNotifier(
    useCasesInsertVisitor: ref.watch(insertVisitorProvider(visitor)),
  );
});

/// Repositories Providers
final registroProvider = Provider<IPlaceRepository>(
    (ref) => PlaceRepository(localDBDataSource: DBDatasources()));

/// Use Cases Insert Visitors
final insertVisitorProvider =
    Provider.family<InsertVisitor, VisitorModel>((ref, visitor) {
  final repository = ref.watch(registroProvider);
  return InsertVisitor(repository: repository, visitor: visitor);
});

///Switch Provider for Button
final swtichStateProvider = StateProvider((ref) => false);

///Provider that managment the state of Object Visitor
///to use in Use Cases InsertVisitor
final visitorStateProvider =
    StateProvider.family<VisitorModel, List<String>?>((ref, listPlaces) {
  String nameWorker = '';
  final selectedWorker = ref.watch(selectWorkerProvider);

  /// Si el selectedWorker es default le asigno el valor del primer trabajador segun el area
  if (listPlaces!.isNotEmpty) {
    nameWorker = selectedWorker.state.isEmpty
        ? listPlaces.first.toString()
        : selectedWorker.state;
  }

  final vi = VisitorModel(
      name: ref.watch(nameControllerProvider).state.text,
      spell: ref.watch(spellControllerProvider).state.text,
      ci: int.parse(ref.watch(ciControllerProvider).state.text),
      solapin: int.parse(ref.watch(solapinControllerProvider).state.text),
      namePlace: ref.watch(selectPlacesProvider).state,
      nameWorker: nameWorker,
      dateInVisit: DateFormat('dd-MM-yyyy').format(DateTime.now()),
      timeInVisit: DateFormat('kk:mm').format(DateTime.now()),
      dateOnVisit: '',
      timeOnVisit: '');
  return vi;
});

///Variable que guarda informacion del carnet escaneado y cargado por el file scanning_qrcode
final barcodeStateProvider = StateProvider<String>((ref) => '');

/// Get Visitor Data from file with Stream
final fileStreamProvider = StreamProvider.autoDispose<void>((ref) async* {
  final name = ref.watch(nameControllerProvider);
  final spell = ref.watch(spellControllerProvider);
  final ci = ref.watch(ciControllerProvider);
  final barcode = ref.watch(barcodeStateProvider);
  final switchValue = ref.watch(swtichStateProvider);
  const oneSec = const Duration(seconds: 1);
  final _pathProvider = ref.watch(pathStateProvider);
  print('Cargando ruta de export ${_pathProvider.state}');

  if (switchValue.state == false) {
    ///Cargo el archivo barcode_result cada segundo
    ///si es diferente asigno los valores al formulario
    ///en caso de que ocurra un dispose se cancela el Timer
    new Timer.periodic(oneSec, (Timer t) async {
      var externalAssetBundle = ExternalAssetBundle("scanning_qrcode");
      var datos = await externalAssetBundle.loadString("barcode_result.txt");
      if (datos != barcode.state && name.state.text.isEmpty) {
        barcode.state = datos;

        /// Variable that convert datos in line splitter
        LineSplitter ls = new LineSplitter();
        List<String> lines = ls.convert(datos);

        ///Asigno los valores nombre, apellidos y CI
        name.state.text = lines[0].replaceAll("N:", "");
        spell.state.text = lines[2].replaceAll("A:", "");
        ci.state.text = lines[4].replaceAll("CI:", "");
      }
      ref.onDispose(() {
        t.cancel();
        print('CERRANDO EL STREAM');
      });
    });
  }
});

///TextEditingController of Form Registration Visitors
final nameControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());
final ciControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());
final spellControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());
final solapinControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());

///Clean textFormField of Visitors Registration
final clearProvider = Provider<void>((ref) {
  ref.watch(nameControllerProvider).state.clear();
  ref.watch(spellControllerProvider).state.clear();
  ref.watch(ciControllerProvider).state.clear();
  ref.watch(solapinControllerProvider).state.clear();
  print('Campos limpiados');
});

final updateTextControllerFormProvider =
    Provider.family<void, Visitor>((ref, visitor) {
  ref.watch(nameControllerProvider).state.text = visitor.name;
  ref.watch(spellControllerProvider).state.text = visitor.spell;
  ref.watch(ciControllerProvider).state.text = visitor.ci.toString();
  ref.watch(solapinControllerProvider).state.text = visitor.solapin.toString();

  // ref.watch(selectPlacesProvider).state = visitor.namePlace;
  // ref.watch(selectWorkerProvider).state = visitor.nameWorker;
});
