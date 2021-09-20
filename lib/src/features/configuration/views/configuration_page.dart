import 'package:admin/src/core/styles.dart';
import 'package:flutter/material.dart';

import 'upload_view.dart';
import 'widgets/header_configuration.dart';

class ConfigurationPage extends StatelessWidget {
  const ConfigurationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            HeaderConfiguration(),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      SizedBox(height: defaultPadding),
                      Container(child: UploadView()),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
