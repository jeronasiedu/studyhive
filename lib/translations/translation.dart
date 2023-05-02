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
        },
      };
}
