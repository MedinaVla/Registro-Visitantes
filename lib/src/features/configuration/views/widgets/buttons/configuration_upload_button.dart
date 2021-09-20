import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConfigurationUploadButton extends ConsumerWidget {
  const ConfigurationUploadButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(Icons.upload_file),
      label: Text('Cargar json'),
    );
  }
}
