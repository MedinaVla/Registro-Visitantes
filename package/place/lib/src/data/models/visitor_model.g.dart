// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisitorModel _$VisitorModelFromJson(Map<String, dynamic> json) => VisitorModel(
      id: json['id'] as int,
      name: json['name'] as String,
      spell: json['spell'] as String,
      ci: json['ci'] as int,
      solapin: json['solapin'] as int,
      namePlace: json['namePlace'] as String,
      nameWorker: json['nameWorker'] as String,
      dateInVisit: json['dateInVisit'] as String,
      timeInVisit: json['timeInVisit'] as String,
      dateOnVisit: json['dateOnVisit'] as String,
      timeOnVisit: json['timeOnVisit'] as String,
    );

Map<String, dynamic> _$VisitorModelToJson(VisitorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'spell': instance.spell,
      'ci': instance.ci,
      'solapin': instance.solapin,
      'namePlace': instance.namePlace,
      'nameWorker': instance.nameWorker,
      'dateInVisit': instance.dateInVisit,
      'timeInVisit': instance.timeInVisit,
      'dateOnVisit': instance.dateOnVisit,
      'timeOnVisit': instance.timeOnVisit,
    };
