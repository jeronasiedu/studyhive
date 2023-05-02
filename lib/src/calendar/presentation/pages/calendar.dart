import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../manager/calendar_controller.dart';

class CalendarPage extends GetView<CalendarController> {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Calendar Page'),
    );
  }
}
