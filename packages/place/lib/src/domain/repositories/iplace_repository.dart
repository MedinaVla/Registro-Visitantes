import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:place/place.dart';

abstract class IPlaceRepository {
  Future<List<PlaceToGo>> getPlaces();
  Future<List<String>> getPlacesNames();
  Future<Either<Failure, List<String>>> getWorkersNames();
  Future<Either<Failure, String>> uploadPlaces();
}
