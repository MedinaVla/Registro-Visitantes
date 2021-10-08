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
      required selectedWorker,
      required visitorState,
      required InsertVisitor useCasesInsertVisitor,
      RegistroState? initialState})
      : _useCasesInsertVisitor = useCasesInsertVisitor,
        _name = name,
        _spell = spell,
        _ci = ci,
        _solapin = solapin,
        _selectedWorker = selectedWorker,
        _visitorState = visitorState,
        super(
          initialState ?? RegistroState.initial(),
        );

  final InsertVisitor _useCasesInsertVisitor;
  final StateController<TextEditingController> _name;
  final StateController<TextEditingController> _spell;
  final StateController<TextEditingController> _ci;
  final StateController<TextEditingController> _solapin;
  final _selectedWorker;
  final _visitorState;

  ///Function that insertVisisitor show error
  Future<void> insertVisitor(listPlaces) async {
    ///Si no se da onTap en SelectWorker
    ///entonces el nombre del trabajador sera el primero
    ///de la lista de trabajadores por area
    ///
    print('----------------------------------------');
    _selectedWorker.state = _selectedWorker.state.isEmpty
        ? listPlaces!.first
        : _selectedWorker.state;
    print('----------------------------------------');

    _visitorState.state =
        _visitorState.state.copyWith(nameWorker: _selectedWorker.state);
    print(_visitorState.state.nameWorker);

    final result = await _useCasesInsertVisitor();

    result.fold(
      (error) => state = RegistroState.error(error.toString()),
      (message) {
        state = RegistroState.data(message);
        clearRegistrationForm();
      },
    );
  }

  ///Limpio los datos del formulario Visitante
  clearRegistrationForm() {
    _name.state.clear();
    _spell.state.clear();
    _ci.state.clear();
    _solapin.state.clear();
  }
}
