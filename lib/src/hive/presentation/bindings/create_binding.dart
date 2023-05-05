import 'package:get/get.dart';
import 'package:studyhive/src/hive/presentation/manager/create_controller.dart';

class CreateHiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateHiveController());
  }
}
