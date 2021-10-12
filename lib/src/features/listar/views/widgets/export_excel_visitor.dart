import 'package:admin/src/core/shared_widgets/button_icon.dart';
import 'package:admin/src/features/listar/logic/export_visitor/logic/export_visitor_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:place/place.dart';

class ExportExcelVisitorWidget extends ConsumerWidget {
  const ExportExcelVisitorWidget({Key? key, required this.visitors})
      : super(key: key);
  final List<Visitor> visitors;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return ElevatedButtonIcon(
        colorButton: Colors.green,
        onPressed: () {
          context
              .read(exportVisitorNotifierProvider(visitors).notifier)
              .exportExcel();
        },
        icon: Icons.download,
        label: Text('Exportar Excel'));
  }
}
