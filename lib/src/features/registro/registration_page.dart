import 'package:admin/src/core/styles.dart';
import 'package:admin/src/features/registro/views/widgets/header_registration_widget.dart';
import 'package:flutter/material.dart';

import 'views/visitor_form_view.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            HeaderRegistrationWidget(),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      SizedBox(height: defaultPadding),
                      Container(child: VisitorFormView()),
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
