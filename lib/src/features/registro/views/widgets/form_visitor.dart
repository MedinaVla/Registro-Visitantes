import 'package:admin/src/core/shared_widgets/responsive.dart';
import 'package:admin/src/core/styles.dart';
import 'package:flutter/material.dart';

import 'ci_form_visitor.dart';
import 'name_form_visitor.dart';
import 'save_button_form.dart';
import 'solapin_form_visitor.dart';
import 'spell_form_visitor.dart';

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
          if (Responsive.isMobile(context))
            columnTextForm(context, size,
                textForm1: NameVisitor(), textForm2: SpellVisitor()),
          if (Responsive.isMobile(context)) SizedBox(height: defaultPadding),
          if (Responsive.isMobile(context))
            columnTextForm(
              context,
              size,
              textForm1: CiVisitor(),
              textForm2: SolapinVisitor(),
            ),
          if (!Responsive.isMobile(context)) SizedBox(height: defaultPadding),
          if (!Responsive.isMobile(context))
            rowTextForm(
              context,
              size,
              textForm1: NameVisitor(),
              textForm2: SpellVisitor(),
            ),
          if (!Responsive.isMobile(context)) SizedBox(height: defaultPadding),
          if (!Responsive.isMobile(context))
            rowTextForm(
              context,
              size,
              textForm1: CiVisitor(),
              textForm2: SolapinVisitor(),
            ),
          Divider(),
          SizedBox(height: defaultPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SaveButtonForm(formKey: _formKey),
              Container(
                width: size.width / 10,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget columnTextForm(context, size,
      {required Widget textForm1, required Widget textForm2}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(width: size.width, child: textForm1),
        Container(width: size.width, child: textForm2),
      ],
    );
  }

  Widget rowTextForm(context, size,
      {required Widget textForm1, required Widget textForm2}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(width: size.width / 3, child: textForm1),
        Container(width: size.width / 3, child: textForm2),
      ],
    );
  }
}

// DataRow recentFileDataRow(RecentFile fileInfo) {
//   return DataRow(
//     cells: [
//       DataCell(
//         Row(
//           children: [
//             SvgPicture.asset(
//               fileInfo.icon!,
//               height: 30,
//               width: 30,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
//               child: Text(fileInfo.title!),
//             ),
//           ],
//         ),
//       ),
//       DataCell(Text(fileInfo.date!)),
//       DataCell(Text(fileInfo.size!)),
//     ],
//   );
// }
