import 'package:admin/src/core/shared_widgets/button_icon.dart';
import 'package:admin/src/core/styles.dart';
import 'package:admin/src/features/configuration/logic/place_provider.dart';
import 'package:admin/src/features/configuration/views/widgets/passowrd_form_upload.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UploadForm extends ConsumerWidget {
  UploadForm({
    Key? key,
  }) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final Size size = MediaQuery.of(context).size;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: defaultPadding),
          columnTextForm(
            context,
            size,
            textForm1: PasswordFormUpload(),
          ),
          Divider(),
          SizedBox(height: defaultPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButtonIcon(
                icon: Icons.save,
                label: Text('Aceptar'),
                onPressed: () {},
              ),
              Container(
                width: size.width / 10,
              ),
            ],
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButtonIcon(
                icon: Icons.upload_file_outlined,
                label: Text('Cargar '),
                onPressed: () {
                  context.read(placeNotifierProvider.notifier).uploadPlaces();
                },
              ),
              Container(
                width: size.width / 10,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget columnTextForm(context, size, {required Widget textForm1}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(width: size.width / 3, child: textForm1),
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
