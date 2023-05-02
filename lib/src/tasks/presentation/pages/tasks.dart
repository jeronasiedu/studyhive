import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../manager/tasks_controller.dart';

class TasksPage extends GetView<TasksController> {
  const TasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Tasks Page'),
    );
  }
}
