import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foody/core/constants/colors.dart';
import 'package:foody/core/constants/spacing.dart';

class SettingsItem extends StatelessWidget {
  final void Function()? onTap;
  final String icon;
  final String label;

  const SettingsItem({
    Key? key,
    this.onTap,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppSpacing.space16),
      child: InkWell(
        onTap: onTap,
        borderRadius:
            BorderRadius.circular(8.0), // Adjust the border radius as needed
        child: Padding(
          padding: EdgeInsets.only(bottom: AppSpacing.space16),
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                width: 20.w,
                height: 20.w,
              ),
              SizedBox(width: 12.w),
              Text(
                label,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w300,
                  color: AppColors.dark80,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
