// import 'dart:convert';

// import 'package:place/src/domain/entities/place.dart';
// import 'package:place/src/domain/entities/place_to_go.dart';

// class PlaceModel implements Place {
//   PlaceModel({required this.placeToGo});

//   @override
//   List<Object?> get props => [placeToGo];

//   @override
//   bool? get stringify => true;

//   @override
//   final List<PlaceToGo> placeToGo;

//   Map<String, dynamic> toMap() {
//     return {
//       'placeToGo': placeToGo?.map((x) => x.toMap())?.toList(),
//     };
//   }

//   factory PlaceModel.fromMap(Map<String, dynamic> map) {
//     return PlaceModel(
//       placeToGo: List<PlaceToGo>.from(
//           map['placeToGo']?.map((x) => PlaceToGoModel.fromMap(x))),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory PlaceModel.fromJson(String source) =>
//       PlaceModel.fromMap(json.decode(source));
// }
