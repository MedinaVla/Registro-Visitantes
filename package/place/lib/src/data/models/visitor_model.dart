import 'package:place/src/domain/entities/place_to_go.dart';
import 'package:place/src/domain/entities/visitor.dart';

class VisitorModel extends Visitor {
  VisitorModel({
    required this.id,
    required this.name,
    required this.spell,
    required this.ci,
    required this.solapin,
    required this.namePlace,
    required this.nameWorker,
    required this.placeToGoId,
    required this.dateInVisit,
    required this.timeInVisit,
    required this.dateOnVisit,
    required this.timeOnVisit,
  }) : super(
          id: id,
          name: name,
          spell: spell,
          ci: ci,
          solapin: solapin,
          namePlace: namePlace,
          nameWorker: nameWorker,
          dateInVisit: dateInVisit,
          timeInVisit: timeInVisit,
          dateOnVisit: dateOnVisit,
          timeOnVisit: timeOnVisit,
        );

  final int id;
  final String name, spell;
  final int ci, solapin;
  final String namePlace, nameWorker;

  final PlaceToGo placeToGoId;
  final String dateInVisit, timeInVisit, dateOnVisit, timeOnVisit;

  @override
  List<Object?> get props => [
        id,
        name,
        spell,
        ci,
        solapin,
        placeToGoId,
        dateInVisit,
        timeInVisit,
        dateOnVisit,
        timeOnVisit
      ];

  @override
  bool? get stringify => true;
}
