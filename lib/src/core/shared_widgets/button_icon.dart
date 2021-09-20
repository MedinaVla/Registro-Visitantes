import 'package:admin/src/core/styles.dart';
import 'package:flutter/material.dart';

import 'responsive.dart';

class ElevatedButtonIcon extends StatelessWidget {
  ElevatedButtonIcon({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.label,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final IconData icon;
  final Widget label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: defaultPadding * 1.5,
          vertical: defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
        ),
      ),
      onPressed: onPressed,
      icon: Icon(icon),
      label: label,
    );
  }
}
