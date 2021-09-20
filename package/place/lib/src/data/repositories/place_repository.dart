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
  Future<List<PlaceToGo>> getPlaces() async {
    try {
      final place = await _localDBDataSource!.getPlaces();
      return place;
    } catch (e) {
      throw ServerFailure();
    }
  }

  @override
  Future<List<String>> getPlacesNames() async {
    try {
      final placesNames = await _localDBDataSource!.getPlacesNames();
      return placesNames;
    } catch (e) {
      throw ServerFailure();
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
}
