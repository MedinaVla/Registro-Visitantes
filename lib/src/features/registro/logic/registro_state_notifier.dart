part of 'registro_provider.dart';

/// Defines all the Visitor logic the app will use
class VisitorNotifier extends StateNotifier<RegistroState> {
  /// Base constructor expects StateNotifier use_cases to
  /// read its usecases and also defines inital state
  VisitorNotifier(
      {required InsertVisitor useCasesInsertVisitor,
      RegistroState? initialState})
      : _useCasesInsertVisitor = useCasesInsertVisitor,
        super(
          initialState ?? RegistroState.initial(),
        );

  final InsertVisitor _useCasesInsertVisitor;

  ///Function that insertVisisitor show error
  Future<void> insertVisitor() async {
    final result = await _useCasesInsertVisitor();

    result.fold(
      (error) {
        return state = RegistroState.error(error.toString());
      },
      (message) {
        state = RegistroState.data(message);
      },
    );
  }
}
