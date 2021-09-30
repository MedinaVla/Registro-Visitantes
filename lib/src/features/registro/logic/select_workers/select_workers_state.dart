import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:place/place.dart';

part 'select_workers_state.freezed.dart';

@freezed
abstract class SelectWorkersState with _$SelectWorkersState {
  ///Initial state
  const factory SelectWorkersState.initial() = _Initial;

  ///Data state
  const factory SelectWorkersState.data(List<PlaceToGo> places) = _Data;

  const factory SelectWorkersState.error(String? message) = _Error;
}
