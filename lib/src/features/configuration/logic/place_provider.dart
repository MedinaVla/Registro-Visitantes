import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:place/place.dart';
import 'place_state.dart';
export 'place_state.dart';

part 'place_state_notifier.dart';

/// Provider to use the PlaceStateNotifier

final placeNotifierProvider = StateNotifierProvider<PlaceNotifier, PlaceState>(
  (ref) => PlaceNotifier(uploadPlaces: ref.watch(uploadPlacesProvider)),
);

/// Repositories Providers
final placeOpenFileRepositoryProvider = Provider<IPlaceRepository>(
    (_) => PlaceRepository(localDataSource: OpenFileDataSource()));

final getPlacesRepositoryProvider = Provider<IPlaceRepository>(
    (_) => PlaceRepository(localDBDataSource: DBDatasources()));

// * Use cases
final uploadPlacesProvider = Provider<UploadPlaces>(
  (ref) {
    final repository = ref.watch(placeOpenFileRepositoryProvider);
    return UploadPlaces(repository: repository);
  },
);
