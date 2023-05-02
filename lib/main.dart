import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studyhive/routes/app_pages.dart';
import 'package:studyhive/shared/theme/theme.dart';
import 'package:studyhive/translations/translation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Get.deviceLocale,
      translations: Localization(),
      title: 'Study Hive',
      theme: lightTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.ONBOARDING,
      getPages: RouteGet.getPages,
    );
  }
}
