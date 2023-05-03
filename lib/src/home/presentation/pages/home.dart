import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:studyhive/routes/app_pages.dart';
import 'package:studyhive/src/home/presentation/manager/home_controller.dart';

import '../../../../shared/ui/custom_bottomsheet.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Study Hive".toUpperCase(),
          style: const TextStyle(
            letterSpacing: 1.5,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Obx(() {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: controller.currentPage,
        );
      }),
      bottomNavigationBar: Obx(() {
        return NavigationBar(
          selectedIndex: controller.currentIndex,
          onDestinationSelected: (index) {
            controller.currentIndex = index;
          },
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(IconlyBold.home),
              icon: Icon(IconlyBroken.home),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(IconlyBold.paper),
              icon: Icon(IconlyBroken.paper),
              label: 'Tasks',
            ),
            NavigationDestination(
              selectedIcon: Icon(IconlyBold.calendar),
              icon: Icon(IconlyBroken.calendar),
              label: 'Calendar',
            ),
            NavigationDestination(
              selectedIcon: Icon(IconlyBold.user_2),
              icon: Icon(IconlyBroken.user_2),
              label: 'Account',
            ),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showCustomBottomSheet(
            height: Get.height * 0.18,
            hasHorizontalPadding: false,
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    Get.back();
                    Get.toNamed(AppRoutes.CREATE_COMMUNITY);
                  },
                  leading: const Icon(IconlyBroken.plus),
                  title: const Text("Create Community"),
                ),
                ListTile(
                  onTap: () {
                    Get.back();
                    Get.toNamed(AppRoutes.JOIN_COMMUNITY);
                  },
                  leading: const Icon(IconlyBroken.add_user),
                  title: const Text("Join Community"),
                ),
              ],
            ),
          );
        },
        child: const Icon(IconlyBroken.plus),
      ),
    );
  }
}
