import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:place/place.dart';

import 'select_workers_state.dart';

export 'select_workers_state.dart';
part 'select_workers_notifer.dart';

///SelectWorkersNotifer
final selectWorkersNotifer =
    StateNotifierProvider<SelectWorkersNotifer, SelectWorkersState>(
        (ref) => SelectWorkersNotifer(places: ref.watch(_getPlacesProvider)));

///Inyeccion Dependencias
final _getPlacesRepository = Provider<IPlaceRepository>(
    (ref) => PlaceRepository(localDBDataSource: DBDatasources()));

/// Uses Cases GetPlaces
final _getPlacesProvider = Provider<GetPlaces>((ref) {
  final repository = ref.watch(_getPlacesRepository);
  return GetPlaces(repository: repository);
});

/// Set Selected Worker
final selectWorkerProvider = StateProvider<String>((ref) {
  return ref.watch(selectWorkersNotifer).when(
        initial: () => '',
        data: (workers) {
          return workers.first.workerName;
        },
        error: (_) => '',
      );
});

final selectedDefaultWorkerProvider = StateProvider<String>((ref) {
  return '';
});
