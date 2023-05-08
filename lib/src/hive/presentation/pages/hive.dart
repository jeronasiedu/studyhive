import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:studyhive/shared/ui/custom_bottomsheet.dart';
import 'package:studyhive/shared/ui/custom_listtile.dart';
import 'package:studyhive/src/hive/presentation/manager/hive_controller.dart';

class HivePage extends GetView<HiveController> {
  const HivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: SafeArea(child: controller.currentPage),
        ),
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: controller.activePageIndex.value,
          onTap: controller.changePage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(IconlyLight.message),
              label: 'Chat',
              activeIcon: Icon(IconlyBold.message),
            ),
            BottomNavigationBarItem(
              icon: Icon(IconlyLight.work),
              label: 'Hive Work',
              activeIcon: Icon(IconlyBold.work),
            ),
            BottomNavigationBarItem(
              icon: Icon(IconlyLight.user_1),
              label: 'Members',
              activeIcon: Icon(IconlyBold.user_3),
            ),
          ],
        );
      }),
      floatingActionButton: Obx(
        () => AnimatedScale(
          scale: controller.activePageIndex.value == 1 ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 200),
          child: FloatingActionButton(
            onPressed: () {
              showCustomBottomSheet(
                child: Column(
                  children: [
                    CustomListTile(
                      onTap: () {
                        Get.back();
                      },
                      title: "Create Assignment",
                      leading: const Icon(IconlyLight.document),
                    ),
                    CustomListTile(
                      onTap: () {
                        Get.back();
                      },
                      title: "Post a Question",
                      leading: const Icon(IconlyLight.paper),
                    ),
                    CustomListTile(
                      onTap: () {
                        Get.back();
                      },
                      title: "Post a Material",
                      leading: const Icon(IconlyLight.paper_plus),
                    ),
                  ],
                ),
              );
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
