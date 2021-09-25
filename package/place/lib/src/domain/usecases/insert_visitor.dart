import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:place/place.dart';

class InsertVisitor {
  InsertVisitor(
      {required IPlaceRepository repository, required VisitorModel visitor})
      : _repository = repository,
        _visitor = visitor;

  final IPlaceRepository _repository;
  final VisitorModel _visitor;

  Future<Either<Failure, String>> call() async =>
      _repository.insertVisitor(_visitor);
}
