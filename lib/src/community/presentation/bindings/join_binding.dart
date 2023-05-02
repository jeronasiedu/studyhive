import 'package:get/get.dart';
import 'package:studyhive/src/community/presentation/manager/join_controller.dart';

class JoinCommunityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => JoinCommunityController());
  }
}
