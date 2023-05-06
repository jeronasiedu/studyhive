import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:studyhive/routes/app_pages.dart';
import 'package:studyhive/src/home/presentation/manager/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          splashRadius: 22,
          onPressed: () {
            Get.toNamed(AppRoutes.settings);
          },
          icon: const Icon(IconlyLight.setting),
        ),
        actions: [
          IconButton(
            splashRadius: 22,
            onPressed: () {},
            tooltip: 'notifications'.tr,
            icon: const Icon(IconlyLight.notification),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: [],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'create',
        onPressed: () {
          Get.toNamed(AppRoutes.createHive);
        },
        child: const Icon(IconlyLight.plus),
      ),
    );
  }
}
