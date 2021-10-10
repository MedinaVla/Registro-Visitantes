part of 'registro_provider.dart';

/// Defines all the Visitor logic the app will use
class VisitorNotifier extends StateNotifier<RegistroState> {
  /// Base constructor expects StateNotifier use_cases to
  /// read its usecases and also defines inital state
  VisitorNotifier(
      {required StateController<TextEditingController> name,
      required StateController<TextEditingController> spell,
      required StateController<TextEditingController> ci,
      required StateController<TextEditingController> solapin,
      required InsertVisitor useCasesInsertVisitor,
      RegistroState? initialState})
      : _useCasesInsertVisitor = useCasesInsertVisitor,
        _name = name,
        _spell = spell,
        _ci = ci,
        _solapin = solapin,
        super(
          initialState ?? RegistroState.initial(),
        );

  final InsertVisitor _useCasesInsertVisitor;
  final StateController<TextEditingController> _name;
  final StateController<TextEditingController> _spell;
  final StateController<TextEditingController> _ci;
  final StateController<TextEditingController> _solapin;

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

  ///Limpio los datos del formulario Visitante
  clearRegistrationForm() {
    _name.state.clear();
    _name.state.text = '';
    _spell.state.clear();
    _spell.state.text = '';
    _ci.state.clear();
    _ci.state.text = '';
    _solapin.state.clear();
    _solapin.state.text = '';
  }
}
