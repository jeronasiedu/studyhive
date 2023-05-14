import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studyhive/src/hive/domain/use_cases/details.dart';

import '../../../../shared/ui/snackbars.dart';
import '../../../../shared/usecase/usecase.dart';
import '../../../profile/domain/entities/profile.dart';
import '../../../profile/domain/use_cases/retrieve.dart';
import '../../domain/entities/hive.dart';

class HiveController extends GetxController {
  final String id = Get.parameters['id'] ?? '';
  final Hive hive = Get.arguments['hive'] ?? Hive.empty();
  final hiveDetails = Get.find<HiveDetails>();
  final retrieveProfile = Get.find<RetrieveProfile>();
  final textController = TextEditingController();
  Profile _profile = Profile.empty();
  RxBool retrievingProfile = false.obs;

  RxInt activePageIndex = 0.obs;

  Stream<Hive> details() async* {
    final result = await hiveDetails(Params(id));
    yield* result.fold((failure) async* {
      showErrorSnackbar(message: failure.message);
      yield Hive.empty();
    }, (hive) async* {
      yield* hive;
    });
  }

  Future<void> _retrieveProfile() async {
    retrievingProfile.value = true;
    final result = await retrieveProfile(Params(FirebaseAuth.instance.currentUser!.uid));
    return result.fold((failure) {
      retrievingProfile.value = false;
      showErrorSnackbar(message: failure.message);
    }, (profile) {
      _profile = profile;
      retrievingProfile.value = false;
    });
  }

  @override
  void onInit() {
    _retrieveProfile();
    super.onInit();
  }
}
