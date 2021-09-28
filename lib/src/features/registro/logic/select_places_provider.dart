import 'package:admin/src/features/registro/views/widgets/dropdown/select_places.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:place/place.dart';

import 'select_places_state.dart';

export 'select_places_state.dart';
part 'select_places_notifier.dart';

// final visitorNotifierProvider =
//     StateNotifierProvider<VisitorNotifier, RegistroState>(
//   (ref) => VisitorNotifier(visitor: ref.watch(insertVisitorProvider)),
// );

final selectPlacesProvider =
    StateNotifierProvider<SelectPlacesNotifier, SelectPlacesState>((ref) =>
        SelectPlacesNotifier(placesNames: ref.watch(_getPlacesNamesProvider)));

//Inyeccion de Dependencia
final _getDBRepositoryProvider = Provider<IPlaceRepository>(
    (_) => PlaceRepository(localDBDataSource: DBDatasources()));

//Uses Cases that return Future<Either<Failure, List<String>>>
final _getPlacesNamesProvider = Provider<GetPlacesNames>((ref) {
  final repository = ref.watch(_getDBRepositoryProvider);
  return GetPlacesNames(repository: repository);
});
