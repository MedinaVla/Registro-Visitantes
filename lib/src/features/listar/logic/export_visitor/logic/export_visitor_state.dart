import 'package:freezed_annotation/freezed_annotation.dart';

part 'export_visitor_state.freezed.dart';

@freezed
abstract class ExportVisitorState with _$ExportVisitorState {
  /// Initial/default state
  const factory ExportVisitorState.initial() = Initial;

  /// Data is loading state
  const factory ExportVisitorState.exported(String message) = Exported;

  /// Error when loading data state
  const factory ExportVisitorState.error([String? message]) = Error;
}
