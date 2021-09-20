import 'package:place/src/domain/entities/place_to_go.dart';
import 'package:place/src/domain/repositories/iplace_repository.dart';

class GetPlaces {
  GetPlaces({required IPlaceRepository repository}) : _repository = repository;

  final IPlaceRepository _repository;

  //Callable class method
  Future<List<PlaceToGo>> call() async => _repository.getPlaces();
}
