import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GeneralToast {
  showSuccessToast({required String message}) {
    Get.snackbar(
      'Success',
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  showAlertToast({required String message}) {
    Get.snackbar(
      'Alert',
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }
}
