import 'package:equatable/equatable.dart';

abstract class Visitor extends Equatable {
  Visitor(
      this.id,
      this.name,
      this.spell,
      this.ci,
      this.credentialNumber,
      this.placeToGo,
      this.workerName,
      this.dateOfVisit,
      this.timeOfVisit,
      this.timeEnd);

  final int id;
  final String name, spell;
  final int ci, credentialNumber;
  final String placeToGo, workerName;
  final DateTime dateOfVisit, timeOfVisit, timeEnd;
}
