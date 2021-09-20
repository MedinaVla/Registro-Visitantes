import 'package:admin/src/features/registro/logic/dropdown_places_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'select_places.dart';

class DropDownPlaces extends ConsumerWidget {
  const DropDownPlaces({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(getPlacesNamesProvider);

    return state.when(
      data: (places) => places.isEmpty
          ? Center(
              child: Text(
              'Ha ocurrido un error al conectarse con la base de datos',
              style: TextStyle(fontSize: 30),
            ))
          : SelectPlaces(
              places: places.map((e) => e).toSet().toList(),
            ),
      loading: () => Text(''),
      error: (Object error, StackTrace? stackTrace) {
        return Text('');
      },
    );
  }
}
