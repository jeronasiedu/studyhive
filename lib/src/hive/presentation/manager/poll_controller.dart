import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/utils/pick_file.dart';

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

  Future<void> chooseImage() async {
    final results = await pickFile(option: FileTypeOption.image, dialogTitle: "Choose Image");
    if (results != null) {}
  }

  Future<void> chooseVideo() async {
    final results = await pickFile(option: FileTypeOption.video, dialogTitle: "Choose Video");
    if (results != null) {}
  }

  Future<void> chooseDocument() async {
    final results = await pickFile(option: FileTypeOption.document, dialogTitle: "Choose Document");
    if (results != null) {}
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
