import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:place/place.dart';

class GetPlacesNames {
  GetPlacesNames({required IPlaceRepository repository})
      : _repository = repository;

  final IPlaceRepository _repository;

  Future<Either<Failure, List<String>>> call() async =>
      _repository.getPlacesNames();
}
