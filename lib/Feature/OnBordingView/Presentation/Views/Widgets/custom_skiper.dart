import 'package:bagstore/Core/themaing/app_stayle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSkiper extends StatelessWidget {
  const CustomSkiper({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(
          right: 40.w,
          left: 40.w,
          top: 60.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Skip',
              textAlign: TextAlign.end,
              style: getSemiboldStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
