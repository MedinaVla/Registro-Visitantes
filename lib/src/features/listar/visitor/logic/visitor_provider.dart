import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

import 'visitor_state.dart';
import 'package:place/place.dart';
export 'package:place/place.dart';

part 'visitor_state_notifier.dart';
part 'visitor_update_notifier.dart';

/// Provider to use the VisitorStateNotifier
final visitorNotifierProvider =
    StateNotifierProvider.autoDispose<VisitorNotifier, VisitorState>(
  (ref) => VisitorNotifier(visitors: ref.watch(_getVisitorsProvider)),
);

final visitorNotifierUpdateProvider =
    StateNotifierProvider.family<VisitorUpdateNotifier, VisitorState, Visitor>(
        (ref, visitor) => VisitorUpdateNotifier(
            visitors: ref.watch(_updateVisitorProvider(visitor))));

/// Repositories Providers
final _visitorRepositoryProvider = Provider<IPlaceRepository>(
    (_) => PlaceRepository(localDBDataSource: DBDatasources()));

/// Use Cases Providers
final _getVisitorsProvider = Provider<GetVisitorsByDate>((ref) {
  final repository = ref.watch(_visitorRepositoryProvider);
  final dateSelected = ref.watch(dateSelectedSateProvider).state;
  return GetVisitorsByDate(repository: repository, dateSelected: dateSelected);
});

///Uses Cases Update Visitor
final _updateVisitorProvider =
    Provider.family<UpdateVisitor, Visitor>((ref, visitor) {
  final repository = ref.watch(_visitorRepositoryProvider);
  final updateVisitor = VisitorModel(
    id: visitor.id,
    name: visitor.name,
    spell: visitor.spell,
    ci: visitor.ci,
    solapin: visitor.solapin,
    namePlace: visitor.namePlace,
    nameWorker: visitor.nameWorker,
    dateInVisit: visitor.dateInVisit,
    timeInVisit: visitor.timeInVisit,
    dateOnVisit: DateFormat('dd-MM-yyyy').format(DateTime.now()),
    timeOnVisit: DateFormat('kk:mm').format(DateTime.now()),
  );
  // visitor.copyWith(timeOnVisit: DateFormat('kk:mm').format(DateTime.now()));

  return UpdateVisitor(repository: repository, visitor: updateVisitor);
});

///State provider to change date
final dateSelectedSateProvider = StateProvider<String>((ref) {
  return '';
});

///TextField to filtring Visitors
final searchStateProvider = StateProvider<String>((ref) => '');
