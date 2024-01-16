import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GeneralButtonWidget extends StatelessWidget {
  final String title;
  final Function onTap;
  final bool isSecondary;
  final Widget? icon;
  const GeneralButtonWidget(
      {super.key,
      required this.title,
      required this.onTap,
      this.isSecondary = false,
      this.icon});

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
            color: isSecondary ? Colors.white : Colors.red.shade400,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(width: 1.w, color: Colors.red)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,
                style: TextStyle(
                  color: isSecondary ? Colors.red.shade400 : Colors.white,
                  fontSize: 18.sp,
                )),
            if (icon != null)
              Container(margin: EdgeInsets.only(left: 8.w), child: icon!)
          ],
        ),
      ),
    );
  }
}
