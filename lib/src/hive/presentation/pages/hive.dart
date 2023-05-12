import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:studyhive/src/hive/presentation/manager/hive_controller.dart';
import 'package:studyhive/src/hive/presentation/pages/invite.dart';
import 'package:studyhive/src/hive/presentation/pages/new_discussion.dart';
import 'package:studyhive/src/hive/presentation/pages/new_material.dart';
import 'package:studyhive/src/hive/presentation/pages/new_poll.dart';

import '../../../../shared/ui/custom_bottomsheet.dart';
import '../../../../shared/ui/custom_listtile.dart';
import 'new_question.dart';

class HivePage extends GetView<HiveController> {
  const HivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const BackButtonIcon(),
          onPressed: () {
            Get.back();
          },
          splashRadius: 20,
        ),
      ),
      body: Obx(
        () => AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: controller.currentPage,
        ),
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: controller.activePageIndex.value,
          onTap: controller.changePage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(IconlyLight.voice),
              label: 'Discussions',
              activeIcon: Icon(IconlyBold.voice),
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
      floatingActionButton: Obx(() {
        return FloatingActionButton(
          onPressed: () {
            switch (controller.activePageIndex.value) {
              case 0:
                Get.to(
                  () => const NewDiscussionPage(),
                  fullscreenDialog: true,
                );

                break;
              case 1:
                showCustomBottomSheet(
                  height: Get.height * 0.24,
                  child: Column(
                    children: [
                      CustomListTile(
                        onTap: () {
                          Get.back();
                          Get.to(() => const NewQuestion(), fullscreenDialog: true);
                        },
                        title: "Ask a Question",
                        leading: const Icon(IconlyLight.paper),
                      ),
                      CustomListTile(
                        onTap: () {
                          Get.back();
                          Get.to(() => const NewMaterial(), fullscreenDialog: true);
                        },
                        title: "Share a Material",
                        leading: const Icon(IconlyLight.paper_plus),
                      ),
                      CustomListTile(
                        onTap: () {
                          Get.back();
                          Get.to(() => const NewPoll(), fullscreenDialog: true);
                        },
                        title: "Create a Poll",
                        leading: const Icon(IconlyLight.chart),
                      ),
                    ],
                  ),
                );
                break;
              case 2:
                Get.to(
                  () => const InviteMemberPage(),
                  fullscreenDialog: true,
                );
                break;
              default:
            }
          },
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: controller.currentIcon,
          ),
        );
      }),
    );
  }
}
