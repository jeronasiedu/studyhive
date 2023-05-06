import 'package:get/get.dart';
import 'package:studyhive/src/hive/presentation/bindings/create_binding.dart';
import 'package:studyhive/src/hive/presentation/pages/create.dart';
import 'package:studyhive/src/settings/presentation/manager/settings_binding.dart';
import 'package:studyhive/src/settings/presentation/pages/settings.dart';

import '../src/auth/presentation/manager/auth_binding.dart';
import '../src/auth/presentation/pages/phone_auth.dart';
import '../src/home/presentation/manager/home_binding.dart';
import '../src/home/presentation/pages/home.dart';
import '../src/onboarding/presentation/manager/onboarding_binding.dart';
import '../src/onboarding/presentation/pages/onboarding.dart';

part './app_routes.dart';

class RouteGet {
  static final List<GetPage> getPages = [
    GetPage(name: AppRoutes.home, page: () => const HomePage(), binding: HomeBinding()),
    GetPage(name: AppRoutes.onboarding, page: () => const OnboardingPage(), binding: OnboardingBinding()),
    GetPage(name: AppRoutes.phoneAuth, page: () => const PhoneAuthPage(), binding: AuthBinding()),
    GetPage(name: AppRoutes.createHive, page: () => const CreateHivePage(), binding: CreateHiveBinding()),
    GetPage(name: AppRoutes.settings, page: () => const SettingsPage(), binding: SettingsBinding()),
  ];
}
