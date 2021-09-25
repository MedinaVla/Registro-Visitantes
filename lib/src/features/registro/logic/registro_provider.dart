import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:place/place.dart';
import 'registro_state.dart';
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
  final visitor = ref.watch(visitorStateProvider(VisitorModel(
    id: 1,
    name: 'Yesenia',
    spell: 'Tabio Miguel',
    ci: 90030546101,
    namePlace: 'Dopi',
    nameWorker: 'Isarelis Medina Miguel',
    solapin: 10,
    dateInVisit: '21-09-2021',
    dateOnVisit: '11:30',
    timeInVisit: '',
    timeOnVisit: '',
  )));
  return InsertVisitor(repository: repository, visitor: visitor.state);
});

final swtichProvider = StateProvider((ref) => false);

final visitorStateProvider =
    StateProvider.family<VisitorModel, VisitorModel>((ref, visitor) {
  final switchValue = ref.watch(swtichProvider).state;
  if (switchValue == false) {
    return VisitorModel(
        id: 1,
        name: 'Vladimir',
        spell: 'Medina Miguel',
        ci: 90030546101,
        namePlace: 'Informatica',
        nameWorker: 'Vladimir Medina Miguel',
        solapin: 10,
        dateInVisit: '22-09-2021',
        dateOnVisit: '10:30',
        timeInVisit: '',
        timeOnVisit: '');
  } else {
    return visitor;
  }
});
