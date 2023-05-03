import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:studyhive/shared/extensions/buttons.dart';

import '../manager/auth_controller.dart';

class VerifyPhone extends StatelessWidget {
  VerifyPhone({Key? key, required this.verificationId, this.resendToken}) : super(key: key);
  final authController = Get.find<AuthController>();
  final String verificationId;
  final int? resendToken;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(6),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Theme.of(context).colorScheme.primary),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      ),
    );
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Center(
            child: Column(
              children: [
                Text(
                  'we_sent_you_an_sms_code'.tr,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6.0, bottom: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("on_this_number".tr),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Text(
                          authController.phoneNumber!,
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                        ),
                      )
                    ],
                  ),
                ),
                Pinput(
                  length: 6,
                  onChanged: authController.onOtpChanged,
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  androidSmsAutofillMethod: AndroidSmsAutofillMethod.none,
                  controller: authController.otpController,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  onCompleted: (value) {
                    // authController.smsCode = value;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: RichText(
                    text: TextSpan(
                      text: "didnt_get_code".tr,
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: [
                        TextSpan(
                          text: "resend_code".tr,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              authController.resendOtp(
                                phoneNumber: authController.phoneNumber!,
                                resendToken: resendToken,
                              );
                            },
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                        )
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: GetBuilder<AuthController>(
                    builder: (controller) => ElevatedButton(
                      onPressed: controller.enableVerifyButton
                          ? () {
                              controller.verifyOtp(
                                verificationId: verificationId,
                              );
                            }
                          : null,
                      child: Text('verify_and_proceed'.tr),
                    ).withLoading(
                      loading: controller.isVerifying,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
