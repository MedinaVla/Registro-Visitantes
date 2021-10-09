import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:place/place.dart';

class GetVisitorsByDate {
  GetVisitorsByDate({
    required IPlaceRepository repository,
    required String dateSelected,
  })  : _repository = repository,
        _dateSelected = dateSelected;

  final IPlaceRepository _repository;
  final String _dateSelected;

  ///Callalbe class
  Future<Either<Failure, List<Visitor>>> call() async =>
      _repository.getVisitorsByDate(_dateSelected);
}
