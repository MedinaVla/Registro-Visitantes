import 'package:admin/src/admin_visitor/providers.dart';
import 'package:admin/src/core/colors.dart';
import 'package:admin/src/core/shared_widgets/responsive.dart';
import 'package:admin/src/core/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderConfiguration extends ConsumerWidget {
  const HeaderConfiguration({
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
        if (Responsive.isDesktop(context))
          Text(
            "Configuración",
            style: Theme.of(context).textTheme.headline6,
          ),
        if (Responsive.isTablet(context))
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: watch(menuProvider).controlMenu,
          ),
        if (Responsive.isTablet(context))
          Text(
            "Configuración",
            style: Theme.of(context).textTheme.headline6,
          ),
        if (Responsive.isMobile(context))
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: watch(menuProvider).controlMenu,
          ),
      ],
    );
  }
}
