import 'package:place/place.dart';

class GetPlacesNames {
  GetPlacesNames({required IPlaceRepository repository})
      : _repository = repository;

  final IPlaceRepository _repository;

  Future<List<String>> call() async => _repository.getPlacesNames();
}
