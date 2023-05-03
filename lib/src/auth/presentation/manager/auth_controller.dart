import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:pinput/pinput.dart';

import '../../../../routes/app_pages.dart';
import '../../../../shared/ui/snackbars.dart';
import '../../../account/domain/entities/profile.dart';
import '../../domain/repositories/auth_repository.dart';
import '../pages/verify_phone.dart';

class AuthController extends GetxController {
  bool enableContinueButton = false;
  bool enableVerifyButton = false;
  String? phoneNumber;
  RxBool isVerifying = false.obs;
  RxBool gettingOtp = false.obs;
  final formKey = GlobalKey<FormState>();
  final AuthRepository _authRepository;

  AuthController(this._authRepository);

  final otpController = TextEditingController();

  void onPhoneNumberChanged(PhoneNumber? value) {
    phoneNumber = value!.phoneNumber;
  }

  void onOtpChanged(String value) {
    enableVerifyButton = value.length == 6;
    update();
  }

  Future<void> submitPhoneNumber() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      gettingOtp.value = true;
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber!,
        verificationCompleted: (PhoneAuthCredential credential) {
          otpController.setText(credential.smsCode!);
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            gettingOtp.value = false;
            showErrorSnackbar(message: 'invalid_phone_number'.tr);
          }
        },
        codeSent: (String verificationId, int? resendToken) {
          gettingOtp.value = false;
          Get.to(() => VerifyPhone(
                verificationId: verificationId,
                resendToken: resendToken,
              ));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          gettingOtp.value = false;
          // showErrorSnackbar(message: 'code_auto_retrieval_timeout'.tr);
        },
      );
    }
  }

  Future<void> verifyOtp({required String verificationId}) async {
    isVerifying.value = true;
    PhoneAuthCredential credential =
        PhoneAuthProvider.credential(verificationId: verificationId, smsCode: otpController.text);

    final user = await FirebaseAuth.instance.signInWithCredential(credential);
    final results = await _authRepository.continueWithPhone(Profile.empty().copyWith(
      phoneNumber: user.user!.phoneNumber,
      id: user.user!.uid,
    ));
    results.fold((failure) {
      isVerifying.value = false;
      showErrorSnackbar(message: failure.message);
    }, (r) {
      isVerifying.value = false;
      Get.offAllNamed(AppRoutes.HOME);
    });
  }

  Future<void> resendOtp({required String phoneNumber, int? resendToken}) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {
        otpController.setText(credential.smsCode!);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          showErrorSnackbar(message: 'invalid_phone_number'.tr);
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        showSuccessSnackbar(message: 'code_sent'.trParams({'phoneNumber': phoneNumber}));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // showErrorSnackbar(message: 'code_auto_retrieval_timeout'.tr);
      },
      forceResendingToken: resendToken,
    );
  }
}
