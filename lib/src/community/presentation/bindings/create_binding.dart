import 'package:get/get.dart';
import 'package:studyhive/src/community/presentation/manager/create_controller.dart';

class CreateCommunityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateCommunityController());
  }
}
