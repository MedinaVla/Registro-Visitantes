import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:place/place.dart';
export 'package:place/place.dart';
import 'export_visitor_state.dart';
import 'package:path_provider_windows/path_provider_windows.dart';

part 'export_visitor_state_notifier.dart';

/// Provider to use the ExportVisitorStateNotifier
final exportVisitorNotifierProvider = StateNotifierProvider.family<
    ExportVisitorNotifier, ExportVisitorState, List<Visitor>>(
  (ref, visitors) => ExportVisitorNotifier(
      useCasesExport: ref.watch(_exportExcelVisitorsProvider(visitors))),
);

/// Repositories Providers
final _repositoryExportExcelProvider = Provider<IPlaceRepository>((ref) =>
    PlaceRepository(
        localDownloadExcelDataSource: LocalExportExcelDataSources()));

/// Use Cases Providers
final _exportExcelVisitorsProvider =
    Provider.family<ExportExcelVisitors, List<Visitor>>((ref, visitors) {
  final _pathProvider = ref.watch(pathStateProvider);

  final _repository = ref.watch(_repositoryExportExcelProvider);

  return ExportExcelVisitors(
    repository: _repository,
    visitors: visitors,
    pathProvider: _pathProvider.state,
  );
});

final pathStateProvider = StateProvider<String>((ref) {
  final pathProvider = ref
      .watch(_pathDirectoryProvider)
      .maybeWhen(orElse: () => 'Vacio', data: (data) => data);
  return pathProvider!;
});

///Path to download Excel
final _pathDirectoryProvider = FutureProvider<String?>((_) async {
  final PathProviderWindows provider = PathProviderWindows();
  String? appSupportDirectory = await provider.getApplicationDocumentsPath();
  return appSupportDirectory;
});
