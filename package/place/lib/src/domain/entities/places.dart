import 'dart:convert';

import 'place_to_go.dart';

class Places {
  final List<PlaceToGo> placeToGo;
  Places({
    this.placeToGo = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'placeToGo': placeToGo.map((x) => x.toMap()).toList(),
    };
  }

  factory Places.fromMap(Map<String, dynamic> map) {
    return Places(
      placeToGo: List<PlaceToGo>.from(
          map['placeToGo']?.map((x) => PlaceToGo.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Places.fromJson(String source) => Places.fromMap(json.decode(source));
}
