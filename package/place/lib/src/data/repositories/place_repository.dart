import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:place/place.dart';

import '../../domain/domain.dart';

/// Place repository implementation

class PlaceRepository implements IPlaceRepository {
  PlaceRepository({
    LocalOpenFileDataSources? localDataSource,
    LocalDBDataSources? localDBDataSource,
  })  : _localDataSource = localDataSource,
        _localDBDataSource = localDBDataSource;

  final LocalOpenFileDataSources? _localDataSource;
  final LocalDBDataSources? _localDBDataSource;

  @override
  Future<Either<Failure, String>> uploadPlaces() async {
    try {
      final place = await _localDataSource!.uploadPlaces();
      return Right(place);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<PlaceToGo>>> getPlaces() async {
    try {
      final place = await _localDBDataSource!.getPlaces();
      return Right(place);
    } catch (e) {
      throw Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<String>>> getPlacesNames() async {
    try {
      final placesNames = await _localDBDataSource!.getPlacesNames();
      return Right(placesNames);
    } catch (e) {
      throw Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<String>>> getWorkersNames() async {
    try {
      final workersNames = await _localDBDataSource!.getWorkersNames();
      return Right(workersNames);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> insertVisitor(VisitorModel visitor) async {
    try {
      final message = await _localDBDataSource!.insertVisitor(visitor);
      return Right(message);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
