import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GeneralButtonWidget extends StatelessWidget {
  final String title;
  final Function onTap;
  const GeneralButtonWidget(
      {super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        width: 1.sw,
        padding: EdgeInsets.symmetric(vertical: 16.w),
        decoration: BoxDecoration(
          color: Colors.red.shade400,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: Text(title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
              )),
        ),
      ),
    );
  }
}
