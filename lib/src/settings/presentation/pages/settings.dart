import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studyhive/shared/extensions/strings.dart';
import 'package:studyhive/shared/ui/custom_bottomsheet.dart';
import 'package:studyhive/shared/ui/spinner.dart';
import 'package:studyhive/src/settings/presentation/manager/settings_controller.dart';
import 'package:studyhive/src/settings/presentation/widgets/no_avatar.dart';
import 'package:studyhive/src/settings/presentation/widgets/user_avatar.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("your_account".tr),
      ),
      body: controller.obx(
        (profile) {
          return ListView(
            children: [
              ListTile(
                onTap: () {
                  showCustomBottomSheet(
                      hasHorizontalPadding: 0,
                      height: profile.photoUrl != null ? Get.height * 0.25 : Get.height * 0.20,
                      child: Column(
                        children: [
                          ListTile(
                            onTap: () {
                              Get.back();
                              controller.chooseProfile(ImageSource.camera);
                            },
                            leading: const Icon(IconlyLight.camera),
                            title: const Text("Take a photo"),
                          ),
                          ListTile(
                            onTap: () {
                              Get.back();
                              controller.chooseProfile(ImageSource.gallery);
                            },
                            leading: const Icon(IconlyLight.image),
                            title: const Text("Choose from gallery"),
                          ),
                          if (profile.photoUrl != null)
                            ListTile(
                              onTap: () {
                                Get.back();
                                controller.deleteProfile();
                              },
                              leading: const Icon(IconlyLight.delete),
                              title: const Text("Delete photo"),
                            ),
                        ],
                      ));
                },
                leading: Obx(() {
                  if (controller.uploading.value) {
                    return const Spinner();
                  }
                  return profile!.photoUrl != null
                      ? UserAvatar(url: profile.photoUrl!)
                      : NoAvatar(initials: profile.name.initials);
                }),
                subtitle: Text(profile!.bio ?? "your_personal_account".tr),
                title: Text(
                  profile.name,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                trailing: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Edit",
                    style: Theme.of(context).textTheme.button!.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ),
              )
            ],
          );
        },
        onLoading: const Center(
          child: Spinner(),
        ),
      ),
    );
  }
}
