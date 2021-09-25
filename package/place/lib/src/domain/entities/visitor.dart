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
  final String name;
  final String spell;
  final int ci;
  final int solapin;
  final String namePlace;
  final String nameWorker;
  final String dateInVisit;
  final String timeInVisit;
  final String? dateOnVisit;
  final String? timeOnVisit;
}
