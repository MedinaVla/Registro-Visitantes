import 'package:admin/src/admin_visitor/providers.dart';
import 'package:admin/src/features/configuration/views/configuration_page.dart';
import 'package:admin/src/features/listar/views/listar_page.dart';
import 'package:admin/src/features/registro/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'side_menu.dart';

class MainScreen extends ConsumerWidget {
  final List<Widget> _pages = [
    RegistrationPage(),
    ListarPage(),
    ListarPage(),
    ConfigurationPage(),
  ];
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      key: watch(menuProvider).scaffoldKey,
      drawer: SideMenu(),
      body: _pages[watch(pagesProvider).state],
    );
  }
}
/**SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: DashboardScreen(),
            ),
          ],
        ),
      ), */