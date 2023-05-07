import 'package:get/get.dart';
import 'package:studyhive/src/hive/presentation/manager/hive_controller.dart';

class HiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HiveController());
  }
}
