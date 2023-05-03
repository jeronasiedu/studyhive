import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:studyhive/shared/extensions/buttons.dart';
import 'package:studyhive/src/auth/presentation/manager/auth_controller.dart';

class PhoneAuthPage extends GetView<AuthController> {
  const PhoneAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Center(
            child: Column(
              children: [
                Text(
                  'what_is_your_phone_number'.tr,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6.0, bottom: 40),
                  child: Text(
                    'send_verification_code'.tr,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                Form(
                  key: controller.formKey,
                  child: InternationalPhoneNumberInput(
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    onInputValidated: (value) {},
                    onInputChanged: controller.onPhoneNumberChanged,
                    keyboardType: TextInputType.phone,
                    formatInput: true,
                    autoFocus: true,
                    countries: const ['US', 'GB', 'GH', 'NG'],
                    selectorConfig: const SelectorConfig(
                      selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                      useEmoji: true,
                    ),
                    inputDecoration: InputDecoration(
                      hintText: 'phone_number'.tr,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: GetBuilder<AuthController>(
                    init: controller,
                    builder: (controller) {
                      return ElevatedButton.icon(
                        onPressed: controller.enableContinueButton ? controller.submitPhoneNumber : null,
                        label: Text('get_otp'.tr),
                        icon: const Icon(IconlyBold.arrow_right),
                      ).withLoading(
                          loading: controller.gettingOtp, icon: const Icon(IconlyBold.arrow_right), text: 'get_otp'.tr);
                    },
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
