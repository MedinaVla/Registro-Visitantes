import 'package:equatable/equatable.dart';

abstract class Visitor extends Equatable {
  Visitor({
    required this.id,
    required this.name,
    required this.spell,
    required this.ci,
    required this.solapin,
    required this.namePlace,
    required this.nameWorker,
    required this.dateInVisit,
    required this.timeInVisit,
    required this.dateOnVisit,
    required this.timeOnVisit,
  });

  final int id;
  final String name, spell;
  final int ci, solapin;
  final String namePlace, nameWorker;
  final String dateInVisit, timeInVisit, dateOnVisit, timeOnVisit;
}
