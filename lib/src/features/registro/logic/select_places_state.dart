import 'package:freezed_annotation/freezed_annotation.dart';

part 'select_places_state.freezed.dart';

@freezed
abstract class SelectPlacesState with _$SelectPlacesState {
  /// Initial state
  const factory SelectPlacesState.initial() = _Initial;

  /// Error state
  const factory SelectPlacesState.error(String? message) = _Error;
}
