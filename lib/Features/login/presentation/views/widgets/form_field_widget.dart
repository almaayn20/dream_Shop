import 'package:flutter/material.dart';
import 'package:foody/core/constants/colors.dart';
import 'package:foody/core/constants/radius.dart';
import 'package:foody/core/constants/spacing.dart';

class FormFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final bool showObscureToggle;
  final int maxLength;
  final int? maxLines;
  final bool darkTheme;

  final VoidCallback? onPressSufixobscureTextIcon;
  final String? Function(String?)? onSubmitted;

  const FormFieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
    required this.darkTheme,
    this.validator,
    this.obscureText = false,
    this.showObscureToggle = false,
    this.maxLength = 30,
    this.maxLines,
    this.onSubmitted,
    this.onPressSufixobscureTextIcon,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppSpacing.space12,
      ),
      child: TextFormField(
        controller: controller,
        onFieldSubmitted: onSubmitted,
        maxLines: obscureText ? 1 : maxLines,
        maxLength: maxLength,
        //      autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: textInputType,
        textInputAction: textInputAction,
        validator: validator,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 0,
            vertical: AppSpacing.space20,
          ),
          prefix: Padding(
            padding: EdgeInsets.only(left: AppSpacing.space16),
          ),
          suffixIcon: showObscureToggle
              ? InkWell(
                  onTap: onPressSufixobscureTextIcon,
                  child: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.dark50,
                  ),
                )
              : null,
          hintStyle: Theme.of(context).textTheme.subtitle1?.copyWith(
                color: AppColors.gray100,
              ),
          counter: null,
          counterText: "",
          filled: true,
          isDense: true,
          errorMaxLines: 1,
          errorStyle: Theme.of(context).textTheme.caption?.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
          fillColor: darkTheme ? AppColors.dark80 : AppColors.white100,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.border12),
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.border12),
            borderSide: BorderSide(
              color: darkTheme ? AppColors.dark80 : AppColors.gray20,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.border12),
            borderSide: BorderSide(
              color: AppColors.orange100,
            ),
          ),
        ),
      ),
    );
  }
}
