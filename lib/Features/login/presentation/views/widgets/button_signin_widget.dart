import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/core/constants/radius.dart';
import 'package:foody/core/constants/spacing.dart';
import 'package:get/get.dart';

class ButtonSigninWidget extends StatelessWidget {
  final VoidCallback onPress;
  final String title;
  final String icon;
  final Color buttonColor, titleColor, shadowColor;

  const ButtonSigninWidget({
    super.key,
    required this.onPress,
    required this.title,
    required this.buttonColor,
    required this.icon,
    required this.titleColor,
    required this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        alignment: Alignment.center,
        shadowColor: shadowColor,
        elevation: 1,
        padding: EdgeInsets.symmetric(
          vertical: AppSpacing.space16,
          horizontal: AppSpacing.space16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.border16),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              width: 18.w,
              height: 18.h,
            ),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.button?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: titleColor,
                      fontSize: 10.sp,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
