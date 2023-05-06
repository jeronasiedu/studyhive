import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ionicons/ionicons.dart';

class HomeController extends GetxController {
  final data = "Jeron";

  @override
  void onInit() async {
    InternetConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          Get.closeAllSnackbars();

          break;
        case InternetConnectionStatus.disconnected:
          Get.showSnackbar(GetSnackBar(
            message: "Disconnected",
            snackStyle: SnackStyle.FLOATING,
            snackPosition: SnackPosition.TOP,
            isDismissible: false,
            barBlur: 20,
            overlayBlur: 10,
            backgroundGradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
              Colors.purpleAccent,
              Colors.blue,
            ]),
            shouldIconPulse: true,
            icon: Icon(Ionicons.warning),
          ));
      }
    });

    super.onInit();
  }
}
