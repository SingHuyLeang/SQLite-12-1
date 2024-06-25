import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/common/style/colors.dart';

class Loader {
  static successSnackBar({title = 'Note App', required message, duration = 3}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: NColors.light,
      backgroundColor: NColors.primary,
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: const Icon(Icons.check, color: NColors.light),
    );
  }

  static warningSnackBar({title = 'Note App', required message}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: NColors.light,
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Icons.warning_rounded, color: NColors.light),
    );
  }

  static errorSnackBar({title = 'Note App', required message}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: NColors.light,
      backgroundColor: Colors.pink[900],
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Icons.error_sharp, color: NColors.light),
    );
  }
}
