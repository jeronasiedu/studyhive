import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studyhive/shared/ui/snackbars.dart';

import '../../../../shared/utils/pick_image.dart';

class CreateHiveController extends GetxController {
  final nameController = TextEditingController();
  RxBool enableButton = false.obs;
  RxBool loading = false.obs;
  RxString hiveProfile = ''.obs;

  @override
  void onInit() {
    super.onInit();
    nameController.addListener(() {
      enableButton.value = nameController.text.isNotEmpty;
    });
  }

  Future<void> chooseHiveProfile() async {
    final pickedImage = await pickImage();
    if (pickedImage != null) {
      final croppedImage = await cropImage(imagePath: pickedImage.path, title: 'Choose Hive Profile');
      if (croppedImage != null) {
        hiveProfile.value = croppedImage.path;
      }
    } else {
      showErrorSnackbar(message: "No image selected");
    }
  }

  Future<void> create() async {
    loading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    loading.value = false;
    Get.back();
  }
}
