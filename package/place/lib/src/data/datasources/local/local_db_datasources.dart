import 'package:place/place.dart';

import 'local_data_sources.dart';

abstract class LocalDBDataSources extends ILocalDataSources {
  Future<List<PlaceToGo>> getPlaces();
  Future<List<String>> getPlacesNames();
  Future<List<String>> getWorkersNames();
  Future<String> insertVisitor(VisitorModel visitor);
  Future<List<VisitorModel>> getVisitorsByDate(String dateSelected);
}
