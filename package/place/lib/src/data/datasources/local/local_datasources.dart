import 'package:place/src/domain/domain.dart';

abstract class ILocalDataSource {
  Future<String> uploadPlaces();
  Future<List<PlaceToGo>> getPlaces();
}
