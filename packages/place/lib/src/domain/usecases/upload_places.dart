import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:place/src/domain/repositories/iplace_repository.dart';

class UploadPlaces {
  UploadPlaces({required IPlaceRepository repository})
      : _repository = repository;

  final IPlaceRepository _repository;

  //Callable class method
  Future<Either<Failure, String>> call() async => _repository.uploadPlaces();
}
