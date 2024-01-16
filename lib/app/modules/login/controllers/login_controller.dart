// ignore_for_file: unnecessary_overrides

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:zamovie/app/modules/home/views/toast/general_toast.dart';
import 'package:zamovie/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  postLogin() {
    if (usernameController.text == 'admin' &&
        passwordController.text == 'password') {
      GeneralToast().showSuccessToast(message: 'Selamat Datang!');
      Get.offAllNamed(Routes.HOME);
    } else {
      GeneralToast().showAlertToast(message: 'Username / Password Salah!');
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
