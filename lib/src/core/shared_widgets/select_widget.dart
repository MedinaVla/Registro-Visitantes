import 'package:flutter/material.dart';

class AppDropdownInput<T> extends StatelessWidget {
  final String hintText;
  final List<T> options;
  final T value;
  final Widget icon;
  final String Function(T) getLabel;
  final void Function(Object?) onChanged;
  final void Function()? onTap;
  final EdgeInsetsGeometry contentPadding;

  AppDropdownInput(
      {this.hintText = 'Seleccione una opción',
      this.options = const [],
      this.onTap,
      required this.icon,
      required this.getLabel,
      required this.value,
      required this.onChanged,
      this.contentPadding =
          const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0)});

  @override
  Widget build(BuildContext context) {
    return FormField<T>(
      builder: (FormFieldState<T> state) {
        return InputDecorator(
          decoration: InputDecoration(
            contentPadding: contentPadding,
            labelText: hintText,
            icon: icon,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
          isEmpty: value == null || value == '',
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              value: value,
              isDense: true,
              onChanged: onChanged,
              onTap: onTap,
              items: options.map((T value) {
                return DropdownMenuItem<T>(
                  value: value,
                  child: Center(child: Text(getLabel(value))),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
