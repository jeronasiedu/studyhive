import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studyhive/shared/utils/pick_file.dart';

class DiscussionsController extends GetxController {
  final textEditingController = TextEditingController();
  RxBool canPost = false.obs;
  RxList<File> attachments = <File>[].obs;

  @override
  void onInit() {
    super.onInit();
    textEditingController.addListener(() {
      canPost.value = textEditingController.text.isNotEmpty;
    });
  }

  Future<void> chooseImage() async {
    final results = await pickFile(option: FileTypeOption.image, dialogTitle: "Choose Image");
    if (results != null) {
      attachments.add(results);
    }
  }

  Future<void> chooseVideo() async {
    final results = await pickFile(option: FileTypeOption.video, dialogTitle: "Choose Video");
    if (results != null) {
      attachments.add(results);
    }
  }

  Future<void> chooseDocument() async {
    final results = await pickFile(option: FileTypeOption.document, dialogTitle: "Choose Document");
    if (results != null) {
      attachments.add(results);
    }
  }

  Future<void> post() async {}
}
