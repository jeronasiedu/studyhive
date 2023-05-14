import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:studyhive/shared/theme/theme.dart';
import 'package:studyhive/shared/ui/custom_bottomsheet.dart';
import 'package:studyhive/src/hive/presentation/manager/hive_controller.dart';

import '../../../../generated/assets.dart';
import '../../../../shared/ui/custom_listtile.dart';
import '../../../../shared/ui/empty_state.dart';
import 'new_material.dart';
import 'new_poll.dart';
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: IconButton(
              splashRadius: 22,
              onPressed: () {},
              icon: const Icon(IconlyLight.setting),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              child: EmptyState(
                text: 'Start a discussion with your colleagues!',
                asset: Assets.discussion,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                controller: controller.textController,
                maxLines: 5,
                minLines: 1,
                decoration: InputDecoration(
                  contentPadding: inputPadding,
                  hintText: 'Share your thoughts...',
                  suffixIcon: const Icon(IconlyLight.send),
                  prefixIcon: IconButton(
                    onPressed: () {
                      showCustomBottomSheet(
                        horizontalPadding: 0,
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
                    },
                    icon: const Icon(IconlyLight.activity),
                  ),
                ),
                // onFieldSubmitted: (value) {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
