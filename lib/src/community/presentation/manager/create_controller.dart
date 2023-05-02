import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateCommunityController extends GetxController {
  late final TextEditingController nameController;

  RxBool loading = false.obs;

  set setLoading(bool value) {
    loading.value = !value;
    Future.delayed(
      const Duration(seconds: 2),
      () => loading.value = value,
    );
  }

  @override
  void onInit() {
    nameController = TextEditingController();
    super.onInit();
  }

  // on close
  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }
}
