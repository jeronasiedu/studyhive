import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:studyhive/shared/ui/snackbars.dart';

class HomeController extends GetxController {
  @override
  void onInit() async {
    InternetConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          Get.closeAllSnackbars();
          break;
        case InternetConnectionStatus.disconnected:
          showLoadingSnackbar(message: "Trying to reconnect...");
      }
    });

    super.onInit();
  }
}
