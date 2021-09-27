import 'dart:io';

import 'package:errors/errors.dart';
import 'package:filepicker_windows/filepicker_windows.dart';
import 'package:place/src/data/data.dart';
import 'package:place/src/domain/domain.dart';
// import 'package:external_asset_bundle/external_asset_bundle.dart';

import 'local_data_sources.dart';

abstract class LocalOpenFileDataSources extends ILocalDataSources {
  Future<String> uploadPlaces();
}

class OpenFileDataSource implements LocalOpenFileDataSources {
  Future<String> uploadPlaces() async {
    try {
      final file = OpenFilePicker()
        ..filterSpecification = {
          'Json (*.json)': '*.json',
        }
        ..defaultFilterIndex = 0
        ..defaultExtension = 'json'
        ..title = 'Seleccione la lista de Trabajadores';
      final result = file.getFile();
      if (result != null) {
        String stringContent = '';
        Future<String> contents = new File(result.path).readAsString();
        await contents.then((value) => stringContent = value);

        var places = Places.fromJson(stringContent);
        DatabaseHandler.instance.deleteAllPlaces();
        ;
        places.placeToGo.forEach((element) {
          DatabaseHandler.instance.insertPlaceToGo(element);
        });

        return 'Archivo actualizado';
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  void addTrabajador(PlaceToGo place) async {
    await DatabaseHandler.instance.insertPlaceToGo(place);
  }

  void deleteAllPlaces() async {
    await DatabaseHandler.instance.deleteAllPlaces();
  }
}
