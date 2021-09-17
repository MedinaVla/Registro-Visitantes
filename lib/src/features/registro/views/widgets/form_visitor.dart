import 'package:admin/models/RecentFile.dart';
import 'package:admin/src/core/shared_widgets/responsive.dart';
import 'package:admin/src/core/styles.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'ci_visitor.dart';
import 'name_visitor.dart';
import 'solapin_visitor.dart';
import 'spell_visitor.dart';

class FormVisitor extends StatelessWidget {
  FormVisitor({
    Key? key,
  }) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          if (Responsive.isMobile(context)) SizedBox(height: defaultPadding),
          if (Responsive.isMobile(context)) columnFormNameSpell(context, size),
          if (Responsive.isMobile(context)) SizedBox(height: defaultPadding),
          if (Responsive.isMobile(context)) columnFormCiSolapin(context, size),
          if (!Responsive.isMobile(context)) SizedBox(height: defaultPadding),
          if (!Responsive.isMobile(context)) rowFormNameSpell(context, size),
          if (!Responsive.isMobile(context)) SizedBox(height: defaultPadding),
          if (!Responsive.isMobile(context)) rowFormCiSolapin(context, size),
          Divider()
        ],
      ),
    );
  }

  Widget rowFormNameSpell(context, size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(width: size.width / 3, child: NameVisitor()),
        Container(width: size.width / 3, child: SpellVisitor()),
      ],
    );
  }

  Widget rowFormCiSolapin(context, size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(width: size.width / 3, child: CiVisitor()),
        Container(width: size.width / 3, child: SolapinVisitor()),
      ],
    );
  }

  Widget columnFormNameSpell(context, size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(width: size.width, child: NameVisitor()),
        Container(width: size.width, child: SpellVisitor()),
      ],
    );
  }

  Widget columnFormCiSolapin(context, size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(width: size.width, child: CiVisitor()),
        Container(width: size.width, child: SolapinVisitor()),
      ],
    );
  }
}

DataRow recentFileDataRow(RecentFile fileInfo) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            SvgPicture.asset(
              fileInfo.icon!,
              height: 30,
              width: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(fileInfo.title!),
            ),
          ],
        ),
      ),
      DataCell(Text(fileInfo.date!)),
      DataCell(Text(fileInfo.size!)),
    ],
  );
}
