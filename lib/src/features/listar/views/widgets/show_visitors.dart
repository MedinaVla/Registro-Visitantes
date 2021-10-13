import 'package:admin/src/core/colors.dart';
import 'package:admin/src/core/shared_widgets/button_icon.dart';
import 'package:admin/src/core/styles.dart';
import 'package:admin/src/features/listar/logic/visitor_provider.dart';
import 'package:admin/src/features/listar/views/widgets/export_excel_visitor.dart';
import 'package:admin/src/features/registro/logic/select_places/select_places_provider.dart';
import 'package:admin/src/features/registro/logic/select_workers/select_workers_provider.dart';
import 'package:admin/src/features/registro/views/update_visitor_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ShowVisitors extends ConsumerWidget {
  const ShowVisitors({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final allVisitors = watch(visitorDataTableNotifierProvider);
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
    header: Row(
      children: [
        Text('Visitantes'),
        Spacer(),
        ExportExcelVisitorWidget(visitors: visitors),
      ],
    ),
    columns: [
      DataColumn(label: Text('Nombre')),
      DataColumn(label: Text('Apellidos')),
      DataColumn(label: Text('CI')),
      DataColumn(label: Text('Solapin')),
      DataColumn(label: Text('Area')),
      DataColumn(label: Text('Trabajador')),
      DataColumn(label: Text('Fecha Entrada')),
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
      DataCell(DialogEditVisitor(
        visitor: visitors[index],
      )),
      DataCell(Text(visitors[index].spell)),
      DataCell(Text(visitors[index].ci.toString())),
      DataCell(Text(visitors[index].solapin.toString())),
      DataCell(Text(visitors[index].namePlace)),
      DataCell(Text(visitors[index].nameWorker)),
      DataCell(Text(
          '${visitors[index].dateInVisit}  ${visitors[index].timeInVisit}')),
      // DataCell(Text(visitors[index].timeInVisit)),
      DataCell(_buidExit(visitors[index])),
    ]);
  }

  _buidExit(Visitor visitor) {
    return visitor.timeOnVisit!.isEmpty
        ? _ExitButtonVisitor(visitor: visitor)
        : Text('${visitor.dateOnVisit}  ${visitor.timeOnVisit!}');
  }
}

class DialogEditVisitor extends ConsumerWidget {
  const DialogEditVisitor({Key? key, required this.visitor}) : super(key: key);
  final Visitor visitor;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final selectPlace = watch(selectPlacesProvider);
    final selectWorker = watch(selectWorkerProvider);
    return TextButton(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white)),
        onPressed: () {
          selectPlace.state = visitor.namePlace;
          selectWorker.state = visitor.nameWorker;

          return _showMaterialDialog(context);
        },
        child: Text(visitor.name));
  }

  void _showMaterialDialog(context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Editar Visitante'),
            content: UpdateVisitorFormWidget(
              visitor: visitor,
            ),
          );
        });
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
      colorButton: Colors.red,
      onPressed: () {
        ///Update visitorModel with data of Visitor
        final newVisitor = VisitorModel(
          id: visitor.id,
          name: visitor.name,
          spell: visitor.spell,
          ci: visitor.ci,
          solapin: visitor.solapin,
          namePlace: visitor.namePlace,
          nameWorker: visitor.nameWorker,
          dateInVisit: visitor.dateInVisit,
          timeInVisit: visitor.timeInVisit,
          dateOnVisit: DateFormat('dd-MM-yyyy').format(DateTime.now()),
          timeOnVisit: DateFormat('kk:mm').format(DateTime.now()),
        );

        ///Update the dateOnVisitor and timeOnVisitor
        context
            .read(visitorNotifierUpdateProvider(newVisitor).notifier)
            .updateVisitor();

        ///Update datatable
        context.read(visitorDataTableNotifierProvider.notifier).getVisitors();
      },
    );
  }
}
