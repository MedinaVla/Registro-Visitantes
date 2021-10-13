import 'package:admin/src/features/listar/logic/export_visitor/logic/export_visitor_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:place/place.dart';

import 'select_places_state.dart';

export 'select_places_state.dart';
part 'select_places_notifier.dart';

///SelectPlacesNotifier
final selectPlacesNotifier =
    StateNotifierProvider<SelectPlacesNotifier, SelectPlacesState>((ref) =>
        SelectPlacesNotifier(placesNames: ref.watch(_getPlacesNamesProvider)));

//Inyeccion de Dependencia
final _getDBRepositoryProvider = Provider<IPlaceRepository>(
    (_) => PlaceRepository(localDBDataSource: DBDatasources()));

//Uses Cases that return Future<Either<Failure, List<String>>>
final _getPlacesNamesProvider = Provider<GetPlacesNames>((ref) {
  //cargo path_provider

  final repository = ref.watch(_getDBRepositoryProvider);
  return GetPlacesNames(repository: repository);
});

final selectPlacesProvider = StateProvider<String>(
  (ref) => ref.watch(selectPlacesNotifier).when(
        initial: () => '',
        data: (places) => places.first,
        error: (_) => '',
      ),
);
