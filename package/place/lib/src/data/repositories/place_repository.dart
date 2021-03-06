import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:place/place.dart';
import 'package:place/src/data/datasources/local/local_download_file_datasources.dart';

import '../../domain/domain.dart';

/// Place repository implementation

class PlaceRepository implements IPlaceRepository {
  PlaceRepository(
      {LocalOpenFileDataSources? localDataSource,
      LocalDBDataSources? localDBDataSource,
      LocalDownloadExcelDataSources? localDownloadExcelDataSource})
      : _localDataSource = localDataSource,
        _localDBDataSource = localDBDataSource,
        _localDownloadExcelDataSource = localDownloadExcelDataSource;

  final LocalOpenFileDataSources? _localDataSource;
  final LocalDBDataSources? _localDBDataSource;
  final LocalDownloadExcelDataSources? _localDownloadExcelDataSource;

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
      if (place.isEmpty) {
        return Left(ServerFailure());
      }
      return Right(place);
    } catch (e) {
      throw Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<String>>> getPlacesNames() async {
    try {
      final placesNames = await _localDBDataSource!.getPlacesNames();
      if (placesNames.isEmpty) {
        return Left(ServerFailure());
      }
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

  @override
  Future<Either<Failure, String>> updateVisitor(VisitorModel visitor) async {
    try {
      final message = await _localDBDataSource!.updateVisitor(visitor);
      return Right(message);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Visitor>>> getVisitorsByDate(
      String dateSelected) async {
    try {
      final result = await _localDBDataSource!.getVisitorsByDate(dateSelected);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> exportExcelVisitor(
      List<Visitor> visitors, String pathProvider) async {
    try {
      final place = await _localDownloadExcelDataSource!
          .exportExcel(visitors, pathProvider);
      return Right(place);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
