import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PollController extends GetxController {
  final optionControllers = <TextEditingController>[].obs;
  final pollTextController = TextEditingController();
  RxBool canPost = false.obs;

  @override
  void onInit() {
    super.onInit();
    optionControllers.addAll([
      TextEditingController(),
      TextEditingController(),
    ]);
  }

  void addOption() {
    optionControllers.add(TextEditingController());
  }

  void removeOption(int index) {
    optionControllers.removeAt(index);
  }

  @override
  void onClose() {
    pollTextController.dispose();
    for (var option in optionControllers) {
      option.dispose();
    }
    super.onClose();
  }
}
