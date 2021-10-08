import 'package:admin/src/features/registro/logic/select_places/select_places_provider.dart';
import 'package:admin/src/features/registro/logic/select_workers/select_workers_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'select_workers_widget.dart';

class DropDownWorkersWidget extends ConsumerWidget {
  const DropDownWorkersWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(selectWorkersNotifer);
    final placeSelected = watch(selectPlacesProvider);

    return state.when(
        initial: () => SelectWorkersWidget(places: ['']),
        error: (error) => SelectWorkersWidget(
              places: ['Error al cargar trabajadores'],
              colorSelected: Colors.red,
            ),
        data: (places) {
          return SelectWorkersWidget(
              places: places
                  .where((element) =>
                      element.namePlace.contains(placeSelected.state))
                  .map((e) => e.workerName)
                  .toList());
        });
  }
}
