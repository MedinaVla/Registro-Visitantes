import 'package:admin/src/features/registro/logic/select_places/select_places_provider.dart';
import 'package:admin/src/features/registro/logic/select_workers/select_workers_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:place/place.dart';

import 'select_workers.dart';

class DropDownWorkers extends ConsumerWidget {
  const DropDownWorkers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(selectWorkersNotifer);
    final placeSelected = watch(selectPlacesProvider);

    return state.when(
        initial: () => SelectWorkers(places: ['']),
        error: (error) =>
            SelectWorkers(places: ['Error al cargar trabajadores']),
        data: (places) {
          return SelectWorkers(
              places: places
                  .where((element) =>
                      element.namePlace.contains(placeSelected.state))
                  .map((e) => e.workerName)
                  .toList());
        });
  }
}
