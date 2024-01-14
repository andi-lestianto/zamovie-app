import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingButtonWidget extends StatelessWidget {
  const LoadingButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: EdgeInsets.symmetric(vertical: 16.w),
      decoration: BoxDecoration(
        color: Colors.red.shade400,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Tunggu sebentar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
              )),
          SizedBox(
            width: 12.w,
          ),
          SizedBox(
            width: 24.w,
            height: 24.w,
            child: const CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
