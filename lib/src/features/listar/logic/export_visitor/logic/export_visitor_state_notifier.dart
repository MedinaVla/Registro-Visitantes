part of 'export_visitor_provider.dart';

/// Defines all the ExportVisitor logic the app will use
class ExportVisitorNotifier extends StateNotifier<ExportVisitorState> {
  /// Base constructor expects StateNotifier use_cases to
  /// read its usecases and also defines inital state
  ExportVisitorNotifier({required ExportExcelVisitors useCasesExport})
      : _useCasesExport = useCasesExport,
        super(ExportVisitorState.initial()) {
    exportExcel();
  }

  final ExportExcelVisitors _useCasesExport;

  Future<void> exportExcel() async {
    final result = await _useCasesExport();

    result.fold(
      (error) => state = ExportVisitorState.error(),
      (message) => state = ExportVisitorState.exported(message),
    );
  }
}
