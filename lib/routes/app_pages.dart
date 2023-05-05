import 'package:get/get.dart';

import '../src/auth/presentation/manager/auth_binding.dart';
import '../src/auth/presentation/pages/phone_auth.dart';
import '../src/home/presentation/manager/home_binding.dart';
import '../src/home/presentation/pages/home.dart';
import '../src/onboarding/presentation/manager/onboarding_binding.dart';
import '../src/onboarding/presentation/pages/onboarding.dart';

part './app_routes.dart';

class RouteGet {
  static final List<GetPage> getPages = [
    GetPage(name: AppRoutes.HOME, page: () => const HomePage(), binding: HomeBinding()),
    GetPage(name: AppRoutes.ONBOARDING, page: () => const OnboardingPage(), binding: OnboardingBinding()),
    GetPage(name: AppRoutes.PHONE_AUTH, page: () => const PhoneAuthPage(), binding: AuthBinding()),
  ];
}
