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

//  Provider to use the VisitorStateNotifier
final visitorNotifierProvider =
    StateNotifierProvider<VisitorNotifier, RegistroState>(
  (ref) => VisitorNotifier(visitor: ref.watch(insertVisitorProvider)),
);

/// Repositories Providers
final registroProvider = Provider<IPlaceRepository>(
    (ref) => PlaceRepository(localDBDataSource: DBDatasources()));

/// Use Cases Providers
final insertVisitorProvider = Provider<InsertVisitor>((ref) {
  final repository = ref.watch(registroProvider);
  final visitor = ref.watch(visitorStateProvider);
  print(visitor.state);
  return InsertVisitor(repository: repository, visitor: visitor.state);
});

///Switch Provider for Button
final swtichProvider = StateProvider((ref) => false);

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
  print('VISITOR  $vi');
  return vi;
});

// final nameStateProvider = StateProvider<String>((ref) => '');
// final spellStateProvider = StateProvider<String>((ref) => '');
// final ciStateProvider = StateProvider<int>((ref) => 0);
// final solapinStateProvider = StateProvider<int>((ref) => 0);
final barcodeStateProvider = StateProvider<String>((ref) => '');

// final registroFileProvider = FutureProvider<void>((ref) async {
//   final name = ref.watch(nameStateProvider);
//   final spell = ref.watch(spellStateProvider);
//   final ci = ref.watch(ciStateProvider);
//   final barcode = ref.watch(barcodeStateProvider);
//   // const oneSec = const Duration(seconds: 1);
//   //  new Timer.periodic(oneSec, (Timer t) async {
//   var externalAssetBundle = ExternalAssetBundle("assets/scanning_qrcode");
//   var datos = await externalAssetBundle.loadString("barcode_result.txt");
//   if (datos != barcode.state) {
//     barcode.state = datos;
//     LineSplitter ls = new LineSplitter();
//     List<String> lines = ls.convert(datos);
//     name.state = lines[0].replaceAll("N:", "");
//     spell.state = lines[2].replaceAll("A:", "");
//     ci.state = int.parse(lines[4].replaceAll("CI:", ""));
//     print(ci.state);
//   }
// });

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
      print('switchValue==true');
      if (datos != barcode.state) {
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
