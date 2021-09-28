import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:place/place.dart';

final selectPlacesProvider = StateProvider<String>((ref) => ref.watch(place));
final selectWorkerProvider = StateProvider<String>((ref) => ref.watch(worker));

//Inyeccion de Dependencia
final getDBRepositoryProvider = Provider<IPlaceRepository>(
    (_) => PlaceRepository(localDBDataSource: DBDatasources()));

//Uses Cases that return Future<Either<Failure, List<String>>>
final getPlacesProvider = Provider<GetPlacesNames>((ref) {
  final repository = ref.watch(getDBRepositoryProvider);
  return GetPlacesNames(repository: repository);
});

//Uses Cases that return Future<Either<Failure, List<PlaceToGo>>>
final getWorkersNamesProvider = Provider<GetPlaces>((ref) {
  final repository = ref.watch(getDBRepositoryProvider);
  return GetPlaces(repository: repository);
});

//Obtengo nombre de los lugares
final getPlacesNamesProvider = FutureProvider<List<String>>((ref) async {
  final getPlacesNames = ref.watch(getPlacesProvider).call();
  return getPlacesNames;
});

//Obtengo nombre de los trabajadores
final getWorkersPlacesNamesProvider =
    FutureProvider<List<PlaceToGo>>((ref) async {
  final getWorkersPlacesNames = ref.watch(getWorkersNamesProvider).call();
  final result = await getWorkersPlacesNames.then((value) => value);
  return result;
});
final place = Provider<String>((ref) {
  return ref.watch(getPlacesNamesProvider).when(
        data: (value) => value.first,
        loading: () => '',
        error: (_, __) => 'Error',
      );
});
final worker = Provider<String>((ref) {
  return ref.watch(getWorkersPlacesNamesProvider).when(
        data: (value) => value.first.workerName,
        loading: () => '',
        error: (_, __) => 'Error',
      );
});
