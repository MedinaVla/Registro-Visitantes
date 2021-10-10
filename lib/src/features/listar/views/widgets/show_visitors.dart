import 'package:admin/src/core/colors.dart';
import 'package:admin/src/core/shared_widgets/button_icon.dart';
import 'package:admin/src/core/styles.dart';
import 'package:admin/src/features/listar/visitor/logic/visitor_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShowVisitors extends ConsumerWidget {
  const ShowVisitors({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final allVisitors = watch(visitorNotifierProvider);
    final StateController<String> search = watch(searchStateProvider);
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: allVisitors.when(
              initial: () => Text(''),
              data: (visitors) => Theme(
                data: Theme.of(context).copyWith(cardColor: secondaryColor),
                child: dataTableVisitors(visitors, search),
              ),
              loading: () => Text(''),
              error: (error) => Text(
                error.toString(),
              ),
              updated: () {},
            ),
          )
        ],
      ),
    );
  }
}

Widget dataTableVisitors(
    List<Visitor> visitors, StateController<String> search) {
  ///Filtro los nombres de los visitantes para mostrar en la tabla
  final List<Visitor> filtredListVisitors = visitors
      .where((element) =>
          element.name.toLowerCase().contains(search.state.toLowerCase()))
      .toList();
  DataTableSource _data = MyData(visitors: filtredListVisitors);

  return PaginatedDataTable(
    source: _data,
    header: Text('Visitantes'),
    columns: [
      DataColumn(label: Text('Nombre')),
      DataColumn(label: Text('Apellidos')),
      DataColumn(label: Text('CI')),
      DataColumn(label: Text('Solapin')),
      DataColumn(label: Text('Area')),
      DataColumn(label: Text('Trabajador')),
      DataColumn(label: Text('Fecha Entrada')),
      DataColumn(label: Text('Hora Entrada')),
      DataColumn(label: Text('Hora Salida')),
    ],
    columnSpacing: 0,
    horizontalMargin: 40,
    rowsPerPage: 10,
    showCheckboxColumn: false,
  );
}

class MyData extends DataTableSource {
  MyData({required this.visitors});

  final List<Visitor> visitors;

  bool get isRowCountApproximate => false;
  int get rowCount => visitors.length;
  int get selectedRowCount => 0;

  ///Get Rows of Visitors
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(visitors[index].name)),
      DataCell(Text(visitors[index].spell)),
      DataCell(Text(visitors[index].ci.toString())),
      DataCell(Text(visitors[index].solapin.toString())),
      DataCell(Text(visitors[index].namePlace)),
      DataCell(Text(visitors[index].nameWorker)),
      DataCell(Text(visitors[index].dateInVisit)),
      DataCell(Text(visitors[index].timeInVisit)),
      DataCell(_buidExit(visitors[index])),
    ]);
  }

  _buidExit(Visitor visitor) {
    return visitor.timeOnVisit!.isEmpty
        ? _ExitButtonVisitor(visitor: visitor)
        : Text(visitor.timeOnVisit!);
  }
}

class _ExitButtonVisitor extends ConsumerWidget {
  const _ExitButtonVisitor({Key? key, required this.visitor}) : super(key: key);
  final Visitor visitor;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return ElevatedButtonIcon(
      icon: Icons.outbond,
      label: Text('Salida'),
      onPressed: () {
        ///Update the dateOnVisitor and timeOnVisitor
        context
            .read(visitorNotifierUpdateProvider(visitor).notifier)
            .updateVisitor();

        ///Update datatable
        context.read(visitorNotifierProvider.notifier).getVisitors();
      },
    );
  }
}
