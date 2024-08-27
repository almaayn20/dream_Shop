import 'package:flutter/material.dart';
import 'package:foody/Features/login/presentation/views/widgets/form_field_widget.dart';
import 'package:foody/core/constants/colors.dart';

class FormLabelFieldWidget extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final VoidCallback? onPressSufixobscureTextIcon;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final String hintText;
  final bool showObscureToggle;
  final int maxLength;
  final int? maxLines;
  final bool darkTheme;

  const FormLabelFieldWidget({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    required this.darkTheme,
    this.validator,
    this.obscureText = false,
    this.showObscureToggle = false,
    this.maxLength = 30,
    this.maxLines,
    this.onPressSufixobscureTextIcon,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
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
          hintText: hintText,
          controller: controller,
          obscureText: obscureText,
          textInputType: textInputType,
          maxLength: maxLength,
          validator: validator,
          darkTheme: darkTheme,
          textInputAction: textInputAction,
          showObscureToggle: showObscureToggle,
          onPressSufixobscureTextIcon: onPressSufixobscureTextIcon,
        ),
      ],
    );
  }
}
