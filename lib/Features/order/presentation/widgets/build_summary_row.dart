import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/core/constants/colors.dart';
import 'package:foody/core/constants/spacing.dart';

Widget buildSummaryRow(String label, String amount, {bool isTotal = false}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: AppSpacing.space5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16.0.sp,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isTotal ? AppColors.dark100 : AppColors.gray150,
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            fontSize: 16.0.sp,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isTotal ? AppColors.dark100 : AppColors.gray150,
          ),
        ),
      ],
    ),
  );
}
