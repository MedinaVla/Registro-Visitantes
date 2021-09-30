import 'package:admin/src/core/shared_widgets/select_widget.dart';
import 'package:admin/src/features/registro/logic/select_places/select_places_provider.dart';
import 'package:admin/src/features/registro/logic/select_workers/select_workers_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectPlaces extends ConsumerWidget {
  const SelectPlaces({
    Key? key,
    required this.places,
  }) : super(key: key);
  final List<String> places;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final selectPlace = watch(selectPlacesProvider);
    final selectWorker = watch(selectWorkerProvider);

    return AppDropdownInput(
      hintText: "Area:",
      options: places,
      value: selectPlace.state.isEmpty ? places.first : selectPlace.state,
      icon: Icon(Icons.place_outlined),
      onChanged: (value) {
        selectWorker.state = '';

        selectPlace.state = value.toString();
      },
      getLabel: (value) => value.toString(),
    );
  }
}
