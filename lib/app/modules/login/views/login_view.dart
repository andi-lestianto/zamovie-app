import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:zamovie/app/modules/home/views/widget/generalbutton_widget.dart';
import 'package:zamovie/app/modules/home/views/widget/generaltextfield_dialog.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (_) {
      return Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                        decoration: BoxDecoration(
                      color: Colors.red.shade400,
                    ))),
                Expanded(
                    flex: 3,
                    child: Container(
                        decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                    )))
              ],
            ),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('WELCOME!!!',
                          style: TextStyle(
                              fontSize: 36.sp,
                              fontWeight: FontWeight.w900,
                              color: Colors.white)),
                      Text('Silahkan login untuk mengakses ZAMovie Apps',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.white)),
                      SizedBox(
                        height: 12.w,
                      ),
                      Container(
                        width: 1.sw,
                        padding: EdgeInsets.all(24.w),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24.r)),
                        child: Column(
                          children: [
                            GeneralTextField(
                                title: 'Username',
                                textEditingController: _.usernameController),
                            SizedBox(
                              height: 12.w,
                            ),
                            GeneralTextField(
                              title: 'Password',
                              textEditingController: _.passwordController,
                              isPassword: true,
                            ),
                            SizedBox(
                              height: 24.w,
                            ),
                            GeneralButtonWidget(
                                title: 'Login',
                                onTap: () {
                                  _.postLogin();
                                })
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(vertical: 12.w),
          decoration: BoxDecoration(color: Colors.grey.shade100),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Powered by',
                style:
                    TextStyle(fontSize: 10.sp, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 4.w,
              ),
              Text(
                'Zaed Muhtar Effendi',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
