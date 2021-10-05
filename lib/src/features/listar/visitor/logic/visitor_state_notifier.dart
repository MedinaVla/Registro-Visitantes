part of 'visitor_provider.dart';

/// Defines all the Visitor logic the app will use
class VisitorNotifier extends StateNotifier<VisitorState> {
  /// Base constructor expects StateNotifier use_cases to
  /// read its usecases and also defines inital state
  VisitorNotifier({required GetVisitors visitors})
      : _visitors = visitors,
        super(VisitorState.initial()) {
    getVisitors();
  }

  final GetVisitors _visitors;

  ///Get all Visitors and send message if error
  Future<void> getVisitors() async {
    state = VisitorState.loading();
    final result = await _visitors();
    result.fold(
      (error) => state = VisitorState.error('Ha ocurrido un error'),
      (visitors) => state = VisitorState.data(visitors),
    );
  }
}
