part of 'select_places_provider.dart';

class SelectPlacesNotifier extends StateNotifier<SelectPlacesState> {
  SelectPlacesNotifier({required GetPlacesNames placesNames})
      : _placesNames = placesNames,
        super(SelectPlacesState.initial()) {
    getPlacesNames();
  }

  final GetPlacesNames _placesNames;

  Future<void> getPlacesNames() async {
    final result = await _placesNames();

    return result.fold(
      (message) => state = SelectPlacesState.error(message.toString()),
      (places) => state = SelectPlacesState.data(places),
    );
  }
}
