import 'package:admin/src/admin_visitor/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideMenu extends ConsumerWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final page = watch(pagesProvider);
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo.png"),
          ),
          DrawerListTile(
            title: "Inicio",
            svgSrc: "assets/icons/menu_dashbord.svg",
            press: () {
              page.state = 0;
              Navigator.pop(context);
            },
          ),
          DrawerListTile(
            title: "Listado Visitantes",
            svgSrc: "assets/icons/menu_tran.svg",
            press: () {
              page.state = 1;

              Navigator.pop(context);
            },
          ),
          DrawerListTile(
            title: "Marcar Salida Visitantes",
            svgSrc: "assets/icons/menu_task.svg",
            press: () {
              Navigator.pop(context);
            },
          ),
          DrawerListTile(
            title: "Configuracion",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {
              Navigator.pop(context);
            },
          ),
          // DrawerListTile(
          //   title: "Store",
          //   svgSrc: "assets/icons/menu_store.svg",
          //   press: () {},
          // ),
          // DrawerListTile(
          //   title: "Notification",
          //   svgSrc: "assets/icons/menu_notification.svg",
          //   press: () {},
          // ),
          // DrawerListTile(
          //   title: "Profile",
          //   svgSrc: "assets/icons/menu_profile.svg",
          //   press: () {},
          // ),
          // DrawerListTile(
          //   title: "Settings",
          //   svgSrc: "assets/icons/menu_setting.svg",
          //   press: () {},
          // ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
