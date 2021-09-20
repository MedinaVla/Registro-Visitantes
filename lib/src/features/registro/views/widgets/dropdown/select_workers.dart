import 'package:admin/src/core/shared_widgets/select_widget.dart';
import 'package:admin/src/features/registro/logic/dropdown_places_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectWorkers extends ConsumerWidget {
  const SelectWorkers({
    Key? key,
    required this.places,
  }) : super(key: key);
  final List<String> places;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final selectWorker = watch(selectWorkerProvider);

    return AppDropdownInput(
      hintText: "Trabajador:",
      options: places,
      value: selectWorker.state.isEmpty ? places.first : selectWorker.state,
      icon: Icon(Icons.work),
      onChanged: (value) {
        selectWorker.state = '';
        selectWorker.state = value.toString();
      },
      getLabel: (value) => value.toString(),
    );
  }
}
