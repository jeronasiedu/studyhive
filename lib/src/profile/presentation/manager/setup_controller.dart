import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../../shared/usecase/usecase.dart';
import '../../domain/entities/profile.dart';
import '../../domain/use_cases/retrieve.dart';
import '../../domain/use_cases/update.dart';

class SetupProfileController extends GetxController {
  RxBool loading = false.obs;
  RxBool enableFinishButton = false.obs;
  final nameController = TextEditingController();
  final updateProfileUseCase = Get.find<UpdateProfile>();
  final retrieveProfileUseCase = Get.find<RetrieveProfile>();

  @override
  void onInit() {
    nameController.addListener(() {
      enableFinishButton.value = nameController.text.isNotEmpty;
    });
    super.onInit();
  }

  Future<Profile> _retrieveProfile() async {
    final result = await retrieveProfileUseCase(Params(FirebaseAuth.instance.currentUser!.uid));
    return result.fold((failure) => Profile.empty(), (profile) => profile);
  }

  Future<void> updateProfile() async {
    loading.value = true;
    final profile = await _retrieveProfile();
    final updatedProfile = profile.copyWith(name: nameController.text.trim());
    final result = await updateProfileUseCase(Params(updatedProfile));
    result.fold((failure) => loading.value = false, (profile) {
      loading.value = false;
      Get.offAllNamed(AppRoutes.home);
    });
  }
}
