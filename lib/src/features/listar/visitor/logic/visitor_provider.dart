import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'visitor_state.dart';
import 'package:place/place.dart';
export 'package:place/place.dart';

part 'visitor_state_notifier.dart';

/// Provider to use the VisitorStateNotifier
final visitorNotifierProvider =
    StateNotifierProvider.autoDispose<VisitorNotifier, VisitorState>(
  (ref) => VisitorNotifier(visitors: ref.watch(_getVisitorsProvider)),
);

/// Repositories Providers
final _visitorRepositoryProvider = Provider<IPlaceRepository>(
    (_) => PlaceRepository(localDBDataSource: DBDatasources()));

/// Use Cases Providers
final _getVisitorsProvider = Provider<GetVisitorsByDate>((ref) {
  final repository = ref.watch(_visitorRepositoryProvider);
  final dateSelected = ref.watch(dateSelectedSateProvider).state;
  return GetVisitorsByDate(repository: repository, dateSelected: dateSelected);
});

final dateSelectedSateProvider = StateProvider<String>((ref) {
  return '';
});

final searchStateProvider = StateProvider<String>((ref) => '');
