import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset("assets/images/no_internet.svg",
            width: 200.w, height: 200.w, fit: BoxFit.cover),
        SizedBox(
          height: 10.h,
        ),
        Text(
          'No Connection,Check your Network',
          style: TextStyle(fontSize: 15.sp),
        )
      ],
    ));
  }
}
