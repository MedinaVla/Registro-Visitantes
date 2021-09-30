part of 'select_workers_provider.dart';

class SelectWorkersNotifer extends StateNotifier<SelectWorkersState> {
  SelectWorkersNotifer({required GetPlaces places})
      : _places = places,
        super(SelectWorkersState.initial()) {
    getPlacesWorkers();
  }

  final GetPlaces _places;

  Future<void> getPlacesWorkers() async {
    final result = await _places();
    return result.fold(
        (error) => state = SelectWorkersState.error(error.toString()),
        (places) => state = SelectWorkersState.data(places));
  }
}
