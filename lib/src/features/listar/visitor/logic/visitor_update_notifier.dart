part of 'visitor_provider.dart';

/// Defines all the Visitor logic the app will use
class VisitorUpdateNotifier extends StateNotifier<VisitorState> {
  /// Base constructor expects StateNotifier use_cases to
  /// read its usecases and also defines inital state
  VisitorUpdateNotifier({required UpdateVisitor visitors})
      : _visitors = visitors,
        super(VisitorState.initial()) {
    updateVisitor();
  }

  final UpdateVisitor _visitors;

  ///Get all Visitors and send message if error
  Future<void> updateVisitor() async {
    final result = await _visitors();
    result.fold(
      (error) => state = VisitorState.error('Ha ocurrido un error'),
      (visitors) {
        state = VisitorState.updated();
      },
    );
  }
}
