import 'dart:async';
import 'dart:convert';

import 'package:external_asset_bundle/external_asset_bundle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:place/place.dart';

// import 'dropdown_places_provider.dart';
import 'registro_state.dart';
import 'select_places/select_places_provider.dart';
import 'select_workers/select_workers_provider.dart';

export 'registro_state.dart';

part 'registro_state_notifier.dart';

/// Provider que administra los datos y el state del visitante
final visitorNotifierProvider =
    StateNotifierProvider<VisitorNotifier, RegistroState>(
  (ref) => VisitorNotifier(
      name: ref.watch(nameControllerProvider),
      spell: ref.watch(spellControllerProvider),
      ci: ref.watch(ciControllerProvider),
      solapin: ref.watch(solapinControllerProvider),
      useCasesInsertVisitor: ref.watch(insertVisitorProvider),
      selectedWorker: ref.watch(selectWorkerProvider),
      visitorState: ref.watch(visitorStateProvider)),
);

/// Repositories Providers
final registroProvider = Provider<IPlaceRepository>(
    (ref) => PlaceRepository(localDBDataSource: DBDatasources()));

/// Use Cases Insert Visitors
final insertVisitorProvider = Provider<InsertVisitor>((ref) {
  final repository = ref.watch(registroProvider);
  final visitor = ref.watch(visitorStateProvider);
  return InsertVisitor(repository: repository, visitor: visitor.state);
});

///Switch Provider for Button
final swtichProvider = StateProvider((ref) => false);

final changeVisitorProvider =
    Provider.family<void, List<String>?>((ref, listPlaces) {
  print(listPlaces!.first.toString());
  final visitorsChangeState = ref.watch(visitorStateProvider);
  final selectedWorker = ref.watch(selectWorkerProvider);
  selectedWorker.state = selectedWorker.state.isEmpty
      ? listPlaces.first.toString()
      : selectedWorker.state;
  visitorsChangeState.state =
      visitorsChangeState.state.copyWith(nameWorker: selectedWorker.state);
});

final visitorStateProvider = StateProvider<VisitorModel>((ref) {
  final vi = VisitorModel(
      name: ref.watch(nameControllerProvider).state.text,
      spell: ref.watch(spellControllerProvider).state.text,
      ci: int.parse(ref.watch(ciControllerProvider).state.text),
      solapin: int.parse(ref.watch(solapinControllerProvider).state.text),
      namePlace: ref.watch(selectPlacesProvider).state,
      nameWorker: ref.watch(selectWorkerProvider).state,
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
  final switchValue = ref.watch(swtichProvider);
  const oneSec = const Duration(seconds: 1);
  if (switchValue.state == false) {
    new Timer.periodic(oneSec, (Timer t) async {
      var externalAssetBundle = ExternalAssetBundle("assets/scanning_qrcode");
      var datos = await externalAssetBundle.loadString("barcode_result.txt");
      if (datos != barcode.state && name.state.text.isEmpty) {
        barcode.state = datos;
        LineSplitter ls = new LineSplitter();
        List<String> lines = ls.convert(datos);
        name.state.text = lines[0].replaceAll("N:", "");
        spell.state.text = lines[2].replaceAll("A:", "");
        ci.state.text = lines[4].replaceAll("CI:", "");
        print('CERRANDO');
      }
      ref.onDispose(() {
        t.cancel();
      });
    });
  }
});

final nameControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());
final ciControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());
final spellControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());
final solapinControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());
