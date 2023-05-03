import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studyhive/src/calendar/presentation/pages/calendar.dart';
import 'package:studyhive/src/community/presentation/pages/community.dart';
import 'package:studyhive/src/tasks/presentation/pages/tasks.dart';

import '../../../account/presentation/pages/account.dart';

class HomeController extends GetxController {
  final RxInt _currentIndex = 0.obs;

  int get currentIndex => _currentIndex.value;

  set currentIndex(int value) => _currentIndex.value = value;

  List<Widget> pages = [const CommunityPage(), const TasksPage(), const CalendarPage(), const AccountPage()];

  Widget get currentPage => pages[currentIndex];
}
