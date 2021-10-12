import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:place/src/domain/entities/visitor.dart';
import 'package:place/src/domain/repositories/iplace_repository.dart';

class ExportExcelVisitors {
  ExportExcelVisitors(
      {required IPlaceRepository repository,
      required List<Visitor> visitors,
      required String? pathProvider})
      : _repository = repository,
        _visitors = visitors,
        _pathProvider = pathProvider;

  final IPlaceRepository _repository;
  final List<Visitor> _visitors;
  final String? _pathProvider;

  Future<Either<Failure, String>> call() async =>
      _repository.exportExcelVisitor(_visitors, _pathProvider!);
}
