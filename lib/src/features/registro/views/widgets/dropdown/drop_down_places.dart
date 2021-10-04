import 'package:admin/src/features/registro/logic/select_places/select_places_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'select_places.dart';

class DropDownPlaces extends ConsumerWidget {
  const DropDownPlaces({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final places = watch(selectPlacesNotifier);

    return places.when(
        initial: () => SelectPlaces(places: ['']),
        data: (places) =>
            SelectPlaces(places: places.map((e) => e).toSet().toList()),
        error: (message) => SelectPlaces(
              places: ['Error al cargar areas'],
              colorSelected: Colors.red,
            ));
  }
}
