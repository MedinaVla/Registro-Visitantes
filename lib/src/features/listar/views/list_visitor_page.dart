import 'package:admin/src/core/styles.dart';
import 'package:admin/src/features/listar/views/widgets/header_list_visitor_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/show_visitors.dart';

class ListVisitorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            HeaderListVisitorsWidget(),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      SizedBox(height: defaultPadding),
                      ShowVisitors(),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
