import 'package:admin/src/core/colors.dart';
import 'package:admin/src/core/styles.dart';
import 'package:admin/src/features/configuration/views/widgets/buttons/buttons.dart';
import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class UploadView extends StatelessWidget {
  const UploadView({
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Subir listado de areas de visita',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            width: double.infinity,
          ),
          UploadForm(),
        ],
      ),
    );
  }
}
