import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trinity_wizards/core/commons/colors_const.dart';
import 'package:trinity_wizards/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:trinity_wizards/presentation/widgets/molecules/required_text.dart';
import 'package:trinity_wizards/presentation/widgets/organisms/ui_helper.dart';

class TextFormFieldCustom extends StatelessWidget {
  final TextInputType? keyboardType;
  final TextStyle? style;
  final TextEditingController? controller;
  final String? hintText;
  final TextAlign? textAlign;
  final String? Function(String?)? validator;
  final String? title;
  final Widget? preffixIcon;
  final TextInputAction? textInputAction;

  const TextFormFieldCustom({
    Key? key,
    this.keyboardType,
    this.style,
    this.controller,
    this.hintText,
    this.textAlign,
    this.validator,
    this.title,
    this.preffixIcon,
    this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          RequiredText(
            title: title,
          ),
        TextFormField(
          textAlignVertical: TextAlignVertical.center,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          textAlign: textAlign ?? TextAlign.left,
          controller: controller,
          autovalidateMode: AutovalidateMode.always,
          style: style ?? context.textTheme.bodyMedium,
          validator: validator,
          decoration: InputDecoration(
            prefixIconColor: ColorConstant.primary,
            prefixIcon: preffixIcon,
            prefixIconConstraints: BoxConstraints(minWidth: UIHelper.setSp(50)),
            hintText: hintText,
            contentPadding: UIHelper.padding(vertical: 5, horizontal: 5),
            errorStyle: context.textTheme.bodySmall!.copyWith(color: Colors.red),
            isDense: true,
            prefixStyle: context.textTheme.bodyMedium!,
            filled: true,
            fillColor: ColorConstant.whiteColor,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(UIHelper.setWidth(5)),
              borderSide: const BorderSide(
                color: ColorConstant.primary,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(UIHelper.setWidth(5)),
              borderSide: BorderSide(
                color: ColorConstant.grey.withOpacity(0.8),
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(UIHelper.setWidth(5)),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
            errorMaxLines: 2,
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(UIHelper.setFont(5)),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(UIHelper.setFont(5)),
              borderSide: BorderSide(
                color: ColorConstant.grey.withOpacity(0.7),
              ),
            ),
            hintStyle: context.textTheme.bodyMedium!.copyWith(color: ColorConstant.grey.withOpacity(0.7)),
          ),
        ),
      ],
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return newValue.copyWith(
      text: newValue.text.toUpperCase(),
    );
  }
}
