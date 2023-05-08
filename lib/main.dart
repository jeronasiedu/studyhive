import 'dart:async';

import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studyhive/routes/app_pages.dart';
import 'package:studyhive/services/init_services.dart';
import 'package:studyhive/shared/theme/theme.dart';
import 'package:studyhive/src/auth/presentation/manager/auth_binding.dart';
import 'package:studyhive/src/home/presentation/manager/home_binding.dart';
import 'package:studyhive/src/profile/data/local/data_sources/profile_local_database.dart';
import 'package:studyhive/translations/translation.dart';

import 'firebase_options.dart';

void main() async {
  await initServices();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final profileLocalDb = Get.find<ProfileLocalDatabase>();
  final bool isAuthenticated = await profileLocalDb.authStatus();
  final bool isProfileSetup = await profileLocalDb.finishedSetup();

  runZonedGuarded(
      () => runApp(DevicePreview(
            enabled: !kReleaseMode,
            builder: (context) => MyApp(
              isAuthenticated: isAuthenticated,
              isProfileSetup: isProfileSetup,
            ),
          )), (error, stack) {
    print('runZonedGuarded: Caught error in my root zone. $error');
    print(error);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isAuthenticated, required this.isProfileSetup});

  final bool isAuthenticated;
  final bool isProfileSetup;

  String get initialRoute {
    if (isAuthenticated) {
      if (isProfileSetup) {
        return AppRoutes.home;
      } else {
        return AppRoutes.setupProfile;
      }
    } else {
      return AppRoutes.onboarding;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // locale: Get.deviceLocale,
      useInheritedMediaQuery: true,
      locale: Get.deviceLocale,
      builder: DevicePreview.appBuilder,
      translations: Localization(),
      title: 'Study Hive',
      theme: lightTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: isAuthenticated ? HomeBinding() : AuthBinding(),
      initialRoute: initialRoute,
      getPages: RouteGet.getPages,
    );
  }
}

//  flutter pub run build_runner build --delete-conflicting-outputs
