import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({
    Key? key,
    this.switchValue = false,
    required this.name,
    required this.errorFont,
    required this.labelText,
    required this.validator,
    required this.iconValue,
  }) : super(key: key);

  final bool switchValue;
  final TextEditingController name;
  final double errorFont;
  final String labelText;
  final FormFieldValidator<String>? validator;
  final IconData iconValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        readOnly: switchValue,
        controller: name,
        maxLength: 30,
        textInputAction: TextInputAction.next,
        validator: validator,
        decoration: InputDecoration(
          icon: Icon(iconValue),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          labelText: labelText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          errorStyle: TextStyle(
            color: Colors.white,
            fontSize: errorFont,
          ),
        ));
  }
}
