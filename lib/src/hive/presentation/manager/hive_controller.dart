import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:studyhive/src/hive/domain/use_cases/details.dart';
import 'package:studyhive/src/hive/presentation/pages/discussion.dart';
import 'package:studyhive/src/hive/presentation/pages/work.dart';

import '../../../../shared/ui/snackbars.dart';
import '../../../../shared/usecase/usecase.dart';
import '../../../profile/domain/entities/profile.dart';
import '../../../profile/domain/use_cases/retrieve.dart';
import '../../domain/entities/hive.dart';
import '../pages/members.dart';

class HiveController extends GetxController {
  final String id = Get.parameters['id'] ?? '';
  final Hive hive = Get.arguments['hive'] ?? Hive.empty();
  final int index = Get.arguments['tab'] ?? 0;
  final hiveDetails = Get.find<HiveDetails>();
  final retrieveProfile = Get.find<RetrieveProfile>();
  Profile _profile = Profile.empty();
  RxBool retrievingProfile = false.obs;

  RxInt get activePageIndex => index.obs;

  final List<Widget> _pages = [const DiscussionsPage(), const WorkPage(), const MembersPage()];
  final List<Widget> icons = [
    const Icon(IconlyLight.voice),
    const Icon(IconlyLight.work),
    const Icon(IconlyLight.user_1),
  ];

  void changePage(int index) {
    activePageIndex.value = index;
  }

  Widget get currentPage => _pages[activePageIndex.value];

  Widget get currentIcon => icons[activePageIndex.value];

  Stream<Hive> details() async* {
    final result = await hiveDetails(Params(id));
    yield* result.fold((failure) async* {
      showErrorSnackbar(message: failure.message);
      yield Hive.empty();
    }, (hives) async* {
      yield* hives;
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
