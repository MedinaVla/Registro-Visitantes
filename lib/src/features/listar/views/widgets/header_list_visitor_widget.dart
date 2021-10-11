import 'package:admin/src/admin_visitor/providers.dart';
import 'package:admin/src/core/shared_widgets/responsive.dart';
import 'package:admin/src/features/listar/views/widgets/radio_date_widget.dart';
import 'package:admin/src/features/listar/views/widgets/search_visitor_name_widget.dart';
import 'package:admin/src/features/listar/views/widgets/selected_date_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HeaderListVisitorsWidget extends ConsumerWidget {
  const HeaderListVisitorsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Row(
      children: [
        if (Responsive.isDesktop(context))
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: watch(menuProvider).controlMenu,
          ),
        if (!Responsive.isMobile(context))
          Text(
            "Visitantes",
            style: Theme.of(context).textTheme.headline6,
          ),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        Expanded(child: RadioDateWidget()),
        Expanded(child: SearchField()),
        SelectedDateWidget()
      ],
    );
  }
}
