import 'package:admin/src/core/shared_widgets/responsive.dart';
import 'package:admin/src/core/styles.dart';
import 'package:admin/src/features/registro/logic/registro_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'buttons/buttons.dart';
import 'dropdown/dropdown.dart';
import 'text_form/text_form.dart';

class VisitorForm extends ConsumerWidget {
  VisitorForm({
    Key? key,
  }) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final Size size = MediaQuery.of(context).size;
    final file = watch(fileStreamProvider.stream);

    return Form(
      key: _formKey,
      child: _buildForm(context, size),
    );
  }

  Column _buildForm(BuildContext context, Size size) {
    return Column(
      children: [
        if (Responsive.isMobile(context)) SizedBox(height: defaultPadding),
        if (Responsive.isMobile(context))
          columnTextForm(
            context,
            size,
            textForm1: NameVisitor(),
            textForm2: SpellVisitor(),
          ),
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
        if (Responsive.isMobile(context)) SizedBox(height: defaultPadding),
        if (Responsive.isMobile(context))
          columnSelectForm(
            context,
            size,
            textForm1: DropDownPlaces(),
            textForm2: DropDownWorkers(),
          ),
        SizedBox(height: defaultPadding),
        if (!Responsive.isMobile(context)) SizedBox(height: defaultPadding),
        if (!Responsive.isMobile(context))
          rowTextForm(
            context,
            size,
            textForm1: DropDownPlaces(),
            textForm2: DropDownWorkers(),
          ),
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

  Widget columnSelectForm(context, size,
      {required Widget textForm1, required Widget textForm2}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(width: size.width, child: textForm1),
        SizedBox(height: defaultPadding),
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
