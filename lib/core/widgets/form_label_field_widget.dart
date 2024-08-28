import 'package:flutter/material.dart';
import 'package:foody/core/constants/colors.dart';
import 'package:foody/core/widgets/form_field_widget.dart';

class FormLabelFieldWidget extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final VoidCallback? onPressSufixobscureTextIcon;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final String hintText;
  final bool showObscureToggle;
  final int maxLength;
  final int? maxLines;
  final bool? darkTheme;
  final bool? enabled;
  final String? initialValue;
  const FormLabelFieldWidget({
    super.key,
    required this.label,
    required this.hintText,
    this.controller,
    this.darkTheme,
    this.validator,
    this.obscureText = false,
    this.showObscureToggle = false,
    this.maxLength = 30,
    this.maxLines,
    this.onPressSufixobscureTextIcon,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.enabled,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
        ),
        FormFieldWidget(
          initialValue: initialValue,
          hintText: hintText,
          controller: controller,
          obscureText: obscureText,
          textInputType: textInputType,
          maxLength: maxLength,
          validator: validator,
          textInputAction: textInputAction,
          enabled: enabled,
          showObscureToggle: showObscureToggle,
          onPressSufixobscureTextIcon: onPressSufixobscureTextIcon,
        ),
      ],
    );
  }
}
