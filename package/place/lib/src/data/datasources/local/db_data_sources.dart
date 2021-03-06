import 'package:place/place.dart';
import 'package:place/src/data/datasources/local/local_db_datasources.dart';

import 'sqlite_database.dart';

class DBDatasources implements LocalDBDataSources {
  @override
  Future<List<PlaceToGo>> getPlaces() async {
    return DatabaseHandler.instance.getAllPlaces();
  }

  @override
  Future<List<String>> getPlacesNames() async {
    List<String> placesNames = [];
    List<PlaceToGo> result = await getPlaces();

    result.forEach((element) {
      placesNames.add(element.namePlace);
    });

    return placesNames;
  }

  @override
  Future<List<String>> getWorkersNames() async {
    List<String> workerNames = [];
    List<PlaceToGo> result = await getPlaces();

    result.forEach((element) {
      workerNames.add(element.workerName);
    });

    return workerNames;
  }

  @override
  Future<String> insertVisitor(VisitorModel visitor) async {
    return await DatabaseHandler.instance.insertVisitor(visitor).toString();
  }

  @override
  Future<String> updateVisitor(VisitorModel visitor) async {
    return await DatabaseHandler.instance.updateVisitante(visitor).toString();
  }

  @override
  Future<List<VisitorModel>> getVisitorsByDate(dateSelected) async {
    return await DatabaseHandler.instance.getVisitorsByDate(dateSelected);
  }
}
