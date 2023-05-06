import 'package:get/get.dart';
import 'package:studyhive/routes/app_pages.dart';
import 'package:studyhive/shared/ui/snackbars.dart';
import 'package:studyhive/src/auth/domain/repositories/auth_repository.dart';

import '../../../profile/domain/entities/profile.dart';

class OnboardingController extends GetxController {
  final AuthRepository _authRepository;

  OnboardingController(this._authRepository);

  final RxBool loading = false.obs;

  Future<void> signInWithGoogle() async {
    loading.value = true;
    final results = await _authRepository.continueWithGoogle(Profile.empty());
    results.fold((failure) {
      loading.value = false;
      showErrorSnackbar(message: failure.message);
    }, (r) {
      loading.value = false;
      Get.offAllNamed(AppRoutes.home);
    });
  }
}
