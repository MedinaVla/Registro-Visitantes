import 'package:admin/src/core/shared_widgets/select_widget.dart';
import 'package:admin/src/features/registro/logic/select_workers/select_workers_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectWorkers extends ConsumerWidget {
  const SelectWorkers({
    this.colorSelected,
    Key? key,
    required this.places,
  }) : super(key: key);
  final List<String> places;
  final Color? colorSelected;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final selectWorker = watch(selectWorkerProvider);

    return AppDropdownInput(
      colorSelected: colorSelected,
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
