import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

showErrorSnackbar({required String message}) {
  return Get
    ..closeAllSnackbars()
    ..snackbar(
      "Error",
      message,
      // backgroundColor: Get.theme.colorScheme.errorContainer,
      // colorText: Get.theme.colorScheme.onErrorContainer,
      shouldIconPulse: true,
      barBlur: 10,
      backgroundGradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomLeft,
        colors: [
          Color(0xFFE57373),
          Color(0xFFEF5350),
        ],
      ),
      icon: const Icon(
        Ionicons.warning_outline,
      ),
    );
}

showSuccessSnackbar({required String message}) {
  return Get
    ..closeAllSnackbars()
    ..snackbar(
      "Success",
      message,
      backgroundColor: Get.theme.colorScheme.primaryContainer,
      colorText: Get.theme.colorScheme.onPrimaryContainer,
      icon: const Icon(Ionicons.checkmark_circle_outline),
    );
}
