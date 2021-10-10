import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:place/place.dart';

abstract class IPlaceRepository {
  Future<Either<Failure, List<PlaceToGo>>> getPlaces();
  Future<Either<Failure, List<String>>> getPlacesNames();
  Future<Either<Failure, List<String>>> getWorkersNames();
  Future<Either<Failure, String>> uploadPlaces();
  Future<Either<Failure, String>> insertVisitor(VisitorModel visitor);
  Future<Either<Failure, String>> updateVisitor(VisitorModel visitor);
  Future<Either<Failure, List<Visitor>>> getVisitorsByDate(String date);
}
