import 'package:get/get.dart';
import 'package:studyhive/src/calendar/presentation/manager/calendar_controller.dart';
import 'package:studyhive/src/community/presentation/manager/community_controller.dart';
import 'package:studyhive/src/home/presentation/manager/home_controller.dart';

import '../../../account/presentation/manager/profile_controller.dart';
import '../../../tasks/presentation/manager/tasks_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => CommunityController());
    Get.lazyPut(() => TasksController());
    Get.lazyPut(() => CalendarController());
    Get.lazyPut(() => AccountController());
  }
}
