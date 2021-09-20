import 'dart:convert';

class PlaceToGo {
  final String namePlace;
  final String workerName;

  PlaceToGo({required this.namePlace, required this.workerName});

  Map<String, dynamic> toMap() {
    return {
      'namePlace': namePlace,
      'workerName': workerName,
    };
  }

  factory PlaceToGo.fromMap(Map<String, dynamic> map) {
    return PlaceToGo(
      namePlace: map['namePlace'],
      workerName: map['workerName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PlaceToGo.fromJson(String source) =>
      PlaceToGo.fromMap(json.decode(source));
}
