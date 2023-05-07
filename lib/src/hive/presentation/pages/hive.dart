import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studyhive/src/hive/presentation/manager/hive_controller.dart';

class HivePage extends GetView<HiveController> {
  const HivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Hive Page ${controller.id}'),
      ),
    );
  }
}
