import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/core/constants/colors.dart';
import 'package:foody/core/constants/radius.dart';
import 'package:foody/core/constants/shadow.dart';
import 'package:foody/core/widgets/material.dart';
import 'package:get/get.dart';

class GetBackCustom extends StatelessWidget {
  const GetBackCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Container(
        width: 38.w,
        height: 38.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.white100,
          borderRadius: circularRadius(AppRadius.border12),
          boxShadow: AppShadow.buttonWhite,
        ),
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 14.w,
        ),
      ),
    );
  }
}
