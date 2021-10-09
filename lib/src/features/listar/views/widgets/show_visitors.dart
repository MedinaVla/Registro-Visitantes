// import 'package:admin/src/core/colors.dart';
// import 'package:admin/src/core/styles.dart';
// import 'package:admin/src/features/listar/visitor/logic/visitor_provider.dart';
// import 'package:data_table_2/data_table_2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_svg/svg.dart';

// import 'recent_file_model.dart';

// class ShowVisitors extends ConsumerWidget {
//   const ShowVisitors({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context, ScopedReader watch) {
//     final allVisitors = watch(visitorNotifierProvider);
//     return Container(
//       padding: EdgeInsets.all(defaultPadding),
//       decoration: BoxDecoration(
//         color: secondaryColor,
//         borderRadius: const BorderRadius.all(Radius.circular(10)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Recent Files",
//             style: Theme.of(context).textTheme.subtitle1,
//           ),
//           SizedBox(
//             width: double.infinity,
//             child: allVisitors.when(
//               initial: () => Text(''),
//               data: (visitors) => dataTableVisitors(visitors),
//               loading: () => Text(''),
//               error: (error) => Text(
//                 error.toString(),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// Widget dataTableVisitors(visitors) {
//   return DataTable2(
//     columnSpacing: defaultPadding,
//     minWidth: 600,
//     columns: [
//       DataColumn(
//         label: Text("Nombre"),
//       ),
//       DataColumn(
//         label: Text("Apellidos"),
//       ),
//       DataColumn(
//         label: Text("CI"),
//       ),
//       DataColumn(
//         label: Text("Solapin"),
//       ),
//       DataColumn(
//         label: Text("Area"),
//       ),
//       DataColumn(
//         label: Text("Trabajador"),
//       ),
//     ],
//     rows: List.generate(
//       visitors.length,
//       (index) => recentFileDataRow(visitors[index]),
//     ),
//   );
// }

// DataRow recentFileDataRow(Visitor visitor) {
//   return DataRow(
//     cells: [
//       DataCell(Text(visitor.name)),
//       DataCell(Text(visitor.spell)),
//       DataCell(Text(visitor.ci.toString())),
//       DataCell(Text(visitor.solapin.toString())),
//       DataCell(Text(visitor.namePlace)),
//       DataCell(Text(visitor.nameWorker)),
//     ],
//   );
// }

import 'package:admin/src/core/colors.dart';
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
    ]);
  }
}