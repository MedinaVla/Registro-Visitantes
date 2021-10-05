import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:place/place.dart';

class GetVisitors {
  GetVisitors({required IPlaceRepository repository})
      : _repository = repository;

  final IPlaceRepository _repository;

  ///Callalbe class
  Future<Either<Failure, List<Visitor>>> call() async =>
      _repository.getVisitors();
}
