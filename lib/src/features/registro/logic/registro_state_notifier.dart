part of 'registro_provider.dart';

/// Defines all the Visitor logic the app will use
class VisitorNotifier extends StateNotifier<RegistroState> {
  final InsertVisitor _visitor;

  /// Base constructor expects StateNotifier use_cases to
  /// read its usecases and also defines inital state
  VisitorNotifier({required InsertVisitor visitor, RegistroState? initialState})
      : _visitor = visitor,
        super(
          initialState ?? RegistroState.initial(),
        );

  Future<void> insertVisitor() async {
    final result = await _visitor();
    result.fold(
      (error) => state = RegistroState.error(error.toString()),
      (message) => state = RegistroState.data(message),
    );
  }
}
