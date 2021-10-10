import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:place/place.dart';

part 'visitor_state.freezed.dart';

@freezed
abstract class VisitorState with _$VisitorState {
  /// Initial/default state
  const factory VisitorState.initial() = _Initial;

  /// Data is present state
  const factory VisitorState.data(List<Visitor> visitors) = _Data;

  /// Data is loading state
  const factory VisitorState.loading() = _Loading;
  const factory VisitorState.updated() = _Updated;

  /// Error when loading data state
  const factory VisitorState.error([String? message]) = _Error;
}
