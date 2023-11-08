import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trinity_wizards/core/commons/colors_const.dart';
import 'package:trinity_wizards/presentation/widgets/organisms/text_form_field.dart';

class DateTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) dateTimeUnformatted;
  final String? Function(String?)? validator;
  final DateTime? initialDate;
  final DateTime? lastDate;
  final DateTime? firstDate;
  final TextInputAction? textInputAction;

  const DateTextFormField({
    super.key,
    required this.controller,
    this.validator,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    required this.dateTimeUnformatted,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: InkWell(
            onTap: () {
              showDatePicker(
                builder: (context, child) {
                  return Theme(
                    data: ThemeData.light().copyWith(
                      colorScheme: const ColorScheme.light(primary: ColorConstant.primary),
                      buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.accent),
                    ),
                    child: child!,
                  );
                },
                context: context,
                initialDate: initialDate ??
                    DateTime(
                      DateTime.now().year,
                      DateTime.now().month,
                      DateTime.now().day,
                    ),
                firstDate: firstDate ?? DateTime(1925),
                lastDate: lastDate ??
                    DateTime(
                      DateTime.now().year,
                      DateTime.now().month,
                      DateTime.now().day,
                    ),
              ).then((date) {
                final DateTime? _dateTime = date;
                if (_dateTime != null) {
                  controller.text = DateFormat("dd/MM/yyyy").format(_dateTime);
                  dateTimeUnformatted(_dateTime.toString());
                }
              });
            },
            child: AbsorbPointer(
              child: TextFormFieldCustom(
                controller: controller,
                hintText: "dd/mm/yyyy",
                validator: validator,
                textInputAction: textInputAction,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
