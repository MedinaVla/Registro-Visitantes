import 'package:admin/src/core/colors.dart';
import 'package:admin/src/core/styles.dart';
import 'package:admin/src/features/listar/logic/visitor_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class SelectedDateWidget extends ConsumerWidget {
  const SelectedDateWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Container(
        margin: EdgeInsets.only(left: defaultPadding),
        padding: EdgeInsets.symmetric(
          horizontal: defaultPadding,
          vertical: defaultPadding / 2,
        ),
        child: _buttonMonthDate(context));
  }

  _buttonMonthDate(context) {
    return Consumer(builder: (context, watch, child) {
      final dateSelected = watch(dateSelectedSateProvider);
      final StateController<String> _radioButton =
          watch(radioButtonStateProvider);
      return FloatingActionButton.extended(
        backgroundColor: secondaryColor,
        foregroundColor: Colors.white,
        onPressed: () => _radioButton.state == 'month'
            ? _monthPicker(context, dateSelected)
            : _dayPicker(context, dateSelected),
        icon: Icon(Icons.calendar_today),
        label: Text("Fecha"),
      );
    });
  }

  void _dayPicker(BuildContext context, StateController<String> dateSelected) {
    showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 1, 5),
      lastDate: DateTime(DateTime.now().year + 1, 9),
      initialDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.day,
      locale: Locale("es"),
    ).then((date) {
      if (date != null) {
        dateSelected.state = DateFormat('dd-MM-yyyy').format(date);
        context.read(visitorNotifierProvider.notifier).getVisitors();
      }
    });
  }

  void _monthPicker(
      BuildContext context, StateController<String> dateSelected) {
    showMonthPicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 1, 5),
      lastDate: DateTime(DateTime.now().year + 1, 9),
      initialDate: DateTime.now(),
      locale: Locale("es"),
    ).then((date) {
      if (date != null) {
        dateSelected.state = DateFormat('MM-yyyy').format(date);
        context.read(visitorNotifierProvider.notifier).getVisitors();
      }
    });
  }
}
