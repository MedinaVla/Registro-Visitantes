import 'package:admin/src/admin_visitor/providers.dart';
import 'package:admin/src/core/colors.dart';
import 'package:admin/src/core/shared_widgets/responsive.dart';
import 'package:admin/src/core/styles.dart';
import 'package:admin/src/features/listar/visitor/logic/visitor_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class Header extends ConsumerWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Row(
      children: [
        if (Responsive.isDesktop(context))
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: watch(menuProvider).controlMenu,
          ),
        if (!Responsive.isMobile(context))
          Text(
            "Visitantes",
            style: Theme.of(context).textTheme.headline6,
          ),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        Expanded(child: RadioDateWidget()),
        Expanded(child: SearchField()),
        SelectedDateWidget()
      ],
    );
  }
}

class RadioDateWidget extends ConsumerWidget {
  const RadioDateWidget({Key? key}) : super(key: key);

  ValueChanged<String?> _valueChangedHandler(_radioButton) {
    return (value) {
      _radioButton.state = value!;
    };
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final StateController<String> _radioButton =
        watch(radioButtonStateProvider);
    return Column(
      children: <Widget>[
        Row(
          children: [
            Text('Fecha por Dia '),
            Radio<String>(
              value: 'day',
              groupValue: _radioButton.state,
              toggleable: true,
              onChanged: _valueChangedHandler(_radioButton),
              activeColor: Colors.blue,
            ),
          ],
        ),
        Row(
          children: [
            Text('Fecha por Mes'),
            Radio<String>(
              value: 'month',
              groupValue: _radioButton.state,
              toggleable: true,
              onChanged: _valueChangedHandler(_radioButton),
              activeColor: Colors.blue,
            ),
          ],
        ),
      ],
    );
  }
}

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

class SearchField extends ConsumerWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final search = watch(searchStateProvider);
    return TextField(
      onChanged: (value) {
        search.state = value;
      },
      decoration: InputDecoration(
        hintText: "Buscar",
        fillColor: secondaryColor,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          child: Container(
            padding: EdgeInsets.all(defaultPadding * 0.75),
            margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset("assets/icons/Search.svg"),
          ),
        ),
      ),
    );
  }
}
