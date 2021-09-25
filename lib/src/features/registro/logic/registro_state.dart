import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:place/place.dart';

part 'registro_state.freezed.dart';

@freezed
abstract class RegistroState with _$RegistroState {
  /// Data is present state
  const factory RegistroState.data(String message) = Data;

  /// Initial/default state
  const factory RegistroState.initial() = Initial;

  /// Error when loading data state
  const factory RegistroState.error([String? message]) = Error;
}
