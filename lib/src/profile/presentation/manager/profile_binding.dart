import 'package:get/get.dart';
import 'package:studyhive/src/profile/presentation/manager/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
}
