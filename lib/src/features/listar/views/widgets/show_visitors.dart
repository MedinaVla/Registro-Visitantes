import 'package:admin/src/core/colors.dart';
import 'package:admin/src/core/styles.dart';
import 'package:admin/src/features/listar/visitor/logic/visitor_provider.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import 'recent_file_model.dart';

class ShowVisitors extends ConsumerWidget {
  ShowVisitors({
    Key? key,
  }) : super(key: key);
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final allVisitors = watch(visitorNotifierProvider);

    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Files",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            width: double.infinity,
            child: allVisitors.when(
              initial: () => Text(''),
              data: (visitors) => dataTableVisitors(visitors, _controller),
              loading: () => Text(''),
              error: (error) => Text(
                error.toString(),
              ),
            ),
          ),
          _ScrollUpButton(
            controller: _controller,
          )
        ],
      ),
    );
  }
}

Widget dataTableVisitors(visitors, _controller) {
  return DataTable2(
    scrollController: _controller,
    columnSpacing: defaultPadding,
    minWidth: 600,
    columns: [
      DataColumn(
        label: Text("Nombre"),
      ),
      DataColumn(
        label: Text("Apellidos"),
      ),
      DataColumn(
        label: Text("CI"),
      ),
      DataColumn(
        label: Text("Solapin"),
      ),
      DataColumn(
        label: Text("Area"),
      ),
      DataColumn(
        label: Text("Trabajador"),
      ),
    ],
    rows: List.generate(
      visitors.length,
      (index) => recentFileDataRow(visitors[index]),
    ),
  );
}

DataRow recentFileDataRow(Visitor visitor) {
  return DataRow(
    cells: [
      DataCell(Text(visitor.name)),
      DataCell(Text(visitor.spell)),
      DataCell(Text(visitor.ci.toString())),
      DataCell(Text(visitor.solapin.toString())),
      DataCell(Text(visitor.namePlace)),
      DataCell(Text(visitor.nameWorker)),
    ],
  );
}

class _ScrollUpButton extends StatefulWidget {
  _ScrollUpButton({required this.controller});

  final ScrollController controller;

  @override
  _ScrollUpButtonState createState() => _ScrollUpButtonState();
}

class _ScrollUpButtonState extends State<_ScrollUpButton> {
  bool _showScrollUp = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      if (widget.controller.position.pixels > 20 && !_showScrollUp) {
        setState(() {
          _showScrollUp = true;
        });
      } else if (widget.controller.position.pixels < 20 && _showScrollUp) {
        setState(() {
          _showScrollUp = false;
        });
      }
      // On GitHub there was a question on how to determine the event
      // of widget being scrolled to the bottom. Here's the sample
      // if (widget.controller.position.hasViewportDimension &&
      //     widget.controller.position.pixels >=
      //         widget.controller.position.maxScrollExtent - 0.01) {
      //   print('Scrolled to bottom');
      //}
    });
  }

  @override
  Widget build(BuildContext context) {
    return _showScrollUp
        ? Positioned(
            right: 10,
            bottom: 10,
            child: OutlinedButton(
              child: Text('↑↑ go up ↑↑'),
              onPressed: () => widget.controller.animateTo(0,
                  duration: Duration(milliseconds: 300), curve: Curves.easeIn),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey[800]),
                  foregroundColor: MaterialStateProperty.all(Colors.white)),
            ))
        : SizedBox();
  }
}
