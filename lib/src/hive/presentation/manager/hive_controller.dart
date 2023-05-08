import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studyhive/src/hive/domain/use_cases/details.dart';
import 'package:studyhive/src/hive/presentation/pages/chat.dart';
import 'package:studyhive/src/hive/presentation/pages/work.dart';

import '../../../../shared/ui/snackbars.dart';
import '../../../../shared/usecase/usecase.dart';
import '../../domain/entities/hive.dart';
import '../pages/members.dart';

class HiveController extends GetxController {
  final String id = Get.parameters['id'] ?? '';
  final Hive hive = Get.arguments ?? Hive.empty();
  final hiveDetails = Get.find<HiveDetails>();

  // active page index
  RxInt activePageIndex = 0.obs;

  final List<Widget> _pages = [const ChatPage(), const WorkPage(), const MembersPage()];

  void changePage(int index) {
    activePageIndex.value = index;
  }

  // get the current page
  Widget get currentPage => _pages[activePageIndex.value];

  Stream<Hive> details() async* {
    final result = await hiveDetails(Params(id));
    yield* result.fold((l) async* {
      showErrorSnackbar(message: l.message);
      yield Hive.empty();
    }, (r) async* {
      yield* r;
    });
  }
}
