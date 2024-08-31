import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class errorWidget extends StatelessWidget {
  const errorWidget({
    super.key,
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset("assets/images/erorr.svg",
            width: 200.w, height: 200.w, fit: BoxFit.cover),
        SizedBox(
          height: 10.h,
        ),
        Text(
          errorMessage,
          style: TextStyle(fontSize: 15.sp),
        )
      ],
    ));
  }
}
