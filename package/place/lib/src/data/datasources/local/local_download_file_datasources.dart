import 'dart:io';

import 'package:place/src/data/datasources/local/local_data_sources.dart';
import 'package:place/src/domain/entities/visitor.dart';
import 'package:intl/intl.dart';
import 'package:csv/csv.dart';

abstract class LocalDownloadExcelDataSources extends ILocalDataSources {
  Future<String> exportExcel(List<Visitor> visitors, String pathProvider);
}

class LocalExportExcelDataSources implements LocalDownloadExcelDataSources {
  @override
  Future<String> exportExcel(List<Visitor> visitors, String pathProvider) {
    String hora = DateFormat('mm-ss').format(DateTime.now());
    String fecha = DateFormat('dd-MM-yyyy').format(DateTime.now());

    final String savePath =
        pathProvider + '/Visitantes' + '$fecha' + '-' + '$hora' + '.csv';
    return _startDownload(savePath, visitors);
  }
}

Future<String> _startDownload(String savePath, List<Visitor> visitors) async {
  Map<String, dynamic> result = {
    'isSuccess': false,
    'filePath': null,
    'error': null,
  };

  try {
    final File file = File(savePath);

    // var visitante = await getListVisitantes(selectedDate.value);
    List<List<String>> excelData = [
      [
        "No.",
        "Nombre",
        "Apellidos",
        "CI",
        "# de Solapin",
        "Oficina",
        "Trabajador",
        "Fecha Entrada",
        "Fecha Salida"
      ]
    ];
    for (int i = 0; i < visitors.length; i++) {
      int? id = visitors[i].id;
      String name = visitors[i].name;
      String spell = visitors[i].spell;
      int ci = visitors[i].ci;
      int solapin = visitors[i].solapin;
      String place = visitors[i].namePlace;
      String worker = visitors[i].nameWorker;
      String dateInVisitor =
          visitors[i].dateInVisit + ' ' + visitors[i].timeInVisit;
      String dateOutVisitor =
          visitors[i].dateOnVisit! + ' ' + visitors[i].timeOnVisit!;

      List<String> listVisitante = [
        id.toString(),
        name,
        spell,
        ci.toString(),
        solapin.toString(),
        place,
        worker,
        dateInVisitor,
        dateOutVisitor
      ];

      excelData.add(listVisitante);
    }
    print(excelData.first);
    print("1-El excel es $result");

    String csvData = ListToCsvConverter().convert(excelData);
    await file.writeAsString(csvData);
    result['isSuccess'] = true;
    // print(savePath)
    result['filePath'] = savePath;
    print("2-El excel es $result");
  } catch (ex) {
    result['error'] = ex.toString();
  } finally {
    if (result['isSuccess']) {
      return 'Archivo Descargado';
    } else {
      return 'Error al descargar archivo';
    }
  }
}
