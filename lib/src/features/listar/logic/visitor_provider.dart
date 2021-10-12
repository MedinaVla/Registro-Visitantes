import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

import 'visitor_state.dart';
import 'package:place/place.dart';
export 'package:place/place.dart';

part 'visitor_state_notifier.dart';
part 'visitor_update_notifier.dart';

/// Provider to use the VisitorStateNotifier
final visitorDataTableNotifierProvider =
    StateNotifierProvider.autoDispose<VisitorNotifier, VisitorState>(
  (ref) => VisitorNotifier(visitors: ref.watch(_getVisitorsProvider)),
);

final visitorNotifierUpdateProvider = StateNotifierProvider.family<
        VisitorUpdateNotifier, VisitorState, VisitorModel>(
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
    Provider.family<UpdateVisitor, VisitorModel>((ref, visitor) {
  final repository = ref.watch(_visitorRepositoryProvider);

  return UpdateVisitor(repository: repository, visitor: visitor);
});

///State provider to change date
final dateSelectedSateProvider = StateProvider<String>((ref) {
  return '';
});

///TextField to filtring Visitors
final searchStateProvider = StateProvider<String>((ref) => '');

///RadioButton Date Selected
final radioButtonStateProvider = StateProvider<String>((ref) => 'day');
