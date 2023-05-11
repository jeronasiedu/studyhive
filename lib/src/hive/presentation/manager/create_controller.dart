import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanoid/nanoid.dart';
import 'package:studyhive/shared/ui/snackbars.dart';
import 'package:studyhive/shared/usecase/usecase.dart';
import 'package:studyhive/shared/utils/upload_image.dart';
import 'package:studyhive/src/hive/domain/entities/hive.dart';
import 'package:studyhive/src/hive/domain/use_cases/create.dart';
import 'package:studyhive/src/profile/domain/use_cases/retrieve.dart';

import '../../../../shared/utils/pick_image.dart';
import '../../../profile/domain/entities/profile.dart';

class CreateHiveController extends GetxController {
  CreateHiveController(this.createHive);

  final nameController = TextEditingController();
  final CreateHive createHive;
  final profileUseCase = Get.find<RetrieveProfile>();
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
    final pickedImage = await pickImage(maxHeight: 512, maxWidth: 512);
    if (pickedImage != null) {
      final croppedImage = await cropImage(imagePath: pickedImage.path, title: 'Choose Hive Profile');
      if (croppedImage != null) {
        hiveProfile.value = croppedImage.path;
      }
    }
  }

  Future<Profile> _retrieveProfile() async {
    final result = await profileUseCase(Params(FirebaseAuth.instance.currentUser!.uid));
    return result.fold(
      (failure) => Profile.empty(),
      (profile) => profile,
    );
  }

  Future<void> create() async {
    loading.value = true;
    final profile = await _retrieveProfile();

    late String? downloadUrl;
    if (hiveProfile.value.isNotEmpty) {
      try {
        downloadUrl = await uploadImage(imagePath: hiveProfile.value, folder: "hive_profiles");
      } on Exception {
        showErrorSnackbar(message: "Check your connectivity and try again");
      }
    } else {
      downloadUrl = null;
    }

    final hive = Hive(
      id: nanoid(),
      name: nameController.text,
      createdBy: profile.id,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      members: [profile.id],
      photoUrl: downloadUrl,
      conversations: [],
    );
    final result = await createHive(Params(hive));

    result.fold(
      (failure) {
        showErrorSnackbar(message: failure.message);
        loading.value = false;
      },
      (hiveId) {
        loading.value = false;
        Get.offNamedUntil('/hive/$hiveId', (route) => route.isFirst, arguments: hive);
        showSuccessSnackbar(message: "Hive created successfully");
      },
    );
  }
}
