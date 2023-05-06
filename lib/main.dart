import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studyhive/routes/app_pages.dart';
import 'package:studyhive/services/init_services.dart';
import 'package:studyhive/shared/theme/theme.dart';
import 'package:studyhive/src/auth/data/local/data_sources/auth_local_database.dart';
import 'package:studyhive/src/auth/presentation/manager/auth_binding.dart';
import 'package:studyhive/src/home/presentation/manager/home_binding.dart';
import 'package:studyhive/translations/translation.dart';

import 'firebase_options.dart';

void main() async {
  await initServices();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final authDb = Get.find<AuthLocalDatabase>();
  final bool isAuthenticated = await authDb.authStatus();
  runZonedGuarded(
      () => runApp(MyApp(
            isAuthenticated: isAuthenticated,
          )), (error, stack) {
    print('runZonedGuarded: Caught error in my root zone.');
    print(error);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isAuthenticated});

  final bool isAuthenticated;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Get.deviceLocale,
      translations: Localization(),
      title: 'Study Hive',
      theme: lightTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: isAuthenticated ? HomeBinding() : AuthBinding(),
      initialRoute: isAuthenticated ? AppRoutes.home : AppRoutes.onboarding,
      getPages: RouteGet.getPages,
    );
  }
}

//  flutter pub run build_runner build --delete-conflicting-outputs
