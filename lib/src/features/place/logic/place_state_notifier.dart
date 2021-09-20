part of 'place_provider.dart';

class PlaceNotifier extends StateNotifier<PlaceState> {
  final UploadPlaces _uploadPlaces;

  PlaceNotifier({required UploadPlaces uploadPlaces, PlaceState? initialState})
      : _uploadPlaces = uploadPlaces,
        super(initialState ?? PlaceState.initial());

  void reset() => state = PlaceState.initial();

  Future<void> uploadPlaces() async {
    state = PlaceState.loading();

    final result = await _uploadPlaces();

    result.fold(
      (error) => state = PlaceState.error(error.toString()),
      (message) => state = PlaceState.data(message),
    );
  }

  Future<void> getPlaces() async {}
}
