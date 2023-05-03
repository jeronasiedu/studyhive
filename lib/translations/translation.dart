import 'package:get/get.dart';

class Localization extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'welcome': 'Welcome to Study Hive!',
          'welcome_sub_text': 'Join the over 1000 students using Study Hive to study together and ace their exams!',
          'continue_with_google': 'Continue with Google',
          'signing_in': 'Signing in...',
          'continue_with_phone': 'Continue with Phone',
          'what_is_your_phone_number': 'What is your phone number?',
          'phone_number': 'Phone Number',
          'send_verification_code': 'We will send you a verification code',
          'continue': 'Continue',
          'enter_verification_code': 'Enter the verification code sent to',
        },
      };
}
