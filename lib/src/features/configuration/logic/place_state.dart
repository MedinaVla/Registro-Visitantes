import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_state.freezed.dart';

extension PlaceGetters on PlaceState {
  bool get isLoading => this is _Loading;
}

@freezed
abstract class PlaceState with _$PlaceState {
  const factory PlaceState.data(String message) = _Data;

  const factory PlaceState.initial() = _Initial;
  const factory PlaceState.loading() = _Loading;
  const factory PlaceState.error([String? message]) = _Error;
}
