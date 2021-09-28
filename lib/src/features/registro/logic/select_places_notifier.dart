part of 'select_places_provider.dart';

class SelectPlacesNotifier extends StateNotifier<SelectPlacesState> {
  SelectPlacesNotifier({required this.placesNames})
      : super(SelectPlacesState.initial());

  final GetPlacesNames placesNames;
}
