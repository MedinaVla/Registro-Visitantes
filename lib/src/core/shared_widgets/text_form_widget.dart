import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({
    Key? key,
    this.switchValue = false,
    this.inputFormatters,
    this.obscureText = false,
    required this.nameController,
    required this.errorFont,
    required this.labelText,
    required this.validator,
    required this.iconValue,
    required this.maxLength,
  }) : super(key: key);

  final bool switchValue;
  final TextEditingController nameController;
  final double errorFont;
  final String labelText;
  final FormFieldValidator<String>? validator;
  final IconData iconValue;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        readOnly: switchValue,
        obscureText: obscureText,
        controller: nameController,
        textInputAction: TextInputAction.next,
        validator: validator,
        maxLength: maxLength,
        inputFormatters: inputFormatters,
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
