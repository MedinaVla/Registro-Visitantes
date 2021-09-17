import 'package:admin/src/core/colors.dart';
import 'package:admin/src/core/styles.dart';
import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class VisitorForm extends StatelessWidget {
  const VisitorForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: double.infinity, child: FormVisitor()),
        ],
      ),
    );
  }
}
