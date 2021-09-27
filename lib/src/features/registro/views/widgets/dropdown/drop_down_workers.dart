import 'package:admin/src/features/registro/logic/dropdown_places_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'select_workers.dart';

class DropDownWorkers extends ConsumerWidget {
  const DropDownWorkers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(getWorkersPlacesNamesProvider);
    final placeSelected = watch(selectPlacesProvider);

    return state.when(
      data: (places) => places.isEmpty
          ? SelectWorkers(places: ['No existe trabajadores'])
          : SelectWorkers(
              places: places
                  .where((element) =>
                      element.namePlace.contains(placeSelected.state))
                  .map((e) => e.workerName)
                  .toList()),
      error: (Object error, StackTrace? stackTrace) => Text(''),
      loading: () => Text(''),
    );
  }
}
