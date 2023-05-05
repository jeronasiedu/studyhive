import 'package:get/get.dart';

import '../manager/join_controller.dart';

class JoinHiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => JoinHiveController());
  }
}
