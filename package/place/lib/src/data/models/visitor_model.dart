import 'package:place/src/domain/entities/visitor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'visitor_model.g.dart';

@JsonSerializable()
class VisitorModel implements Visitor {
  VisitorModel({
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
  }) : super();

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

  factory VisitorModel.fromJson(Map<String, dynamic> json) =>
      _$VisitorModelFromJson(json);

  Map<String, dynamic> toJson() => _$VisitorModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        spell,
        ci,
        solapin,
        namePlace,
        nameWorker,
        dateInVisit,
        timeInVisit,
        dateOnVisit,
        timeOnVisit
      ];

  @override
  bool? get stringify => true;
}
