// import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'select_places_state.freezed.dart';

@freezed
abstract class SelectPlacesState with _$SelectPlacesState {
  /// Initial state
  const factory SelectPlacesState.initial() = _Initial;

  ///Data state
  const factory SelectPlacesState.data(List<String> places) = _Data;

  /// Error state
  const factory SelectPlacesState.error([String? message]) = _Error;
}
