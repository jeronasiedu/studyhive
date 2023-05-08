import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studyhive/routes/app_pages.dart';
import 'package:studyhive/shared/extensions/strings.dart';
import 'package:studyhive/shared/ui/custom_bottomsheet.dart';
import 'package:studyhive/shared/ui/custom_listtile.dart';
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
                      horizontalPadding: 0,
                      height: profile.photoUrl != null ? Get.height * 0.25 : Get.height * 0.18,
                      child: Column(
                        children: [
                          ListTile(
                            onTap: () {
                              Get.back();
                              controller.chooseProfile(ImageSource.camera);
                            },
                            leading: const Icon(IconlyLight.camera),
                            title: Text("take_a_photo".tr),
                          ),
                          ListTile(
                            onTap: () {
                              Get.back();
                              controller.chooseProfile(ImageSource.gallery);
                            },
                            leading: const Icon(IconlyLight.image),
                            title: Text("choose_from_gallery".tr),
                          ),
                          if (profile.photoUrl != null)
                            ListTile(
                              onTap: () {
                                Get.back();
                                controller.deleteProfile();
                              },
                              leading: const Icon(IconlyLight.delete),
                              title: Text("delete_photo".tr),
                            ),
                        ],
                      ));
                },
                leading: Obx(() {
                  if (controller.uploading.value) {
                    return const Spinner();
                  }
                  return profile!.photoUrl != null
                      ? Hero(
                          tag: profile.id,
                          child: UserAvatar(url: profile.photoUrl!),
                        )
                      : Hero(
                          tag: profile.id,
                          child: NoAvatar(initials: profile.name.initials),
                        );
                }),
                subtitle: Text(profile!.bio ?? "your_personal_account".tr),
                title: Text(
                  profile.name,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                trailing: TextButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.profile, arguments: profile);
                  },
                  child: Text(
                    "Edit",
                    style: Theme.of(context).textTheme.button!.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 18,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "General",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const Divider(),
                  ],
                ),
              ),
              CustomListTile(
                onTap: () {},
                title: "Theme",
                subtitle: "Light mode",
                leading: const Icon(IconlyLight.filter),
                trailing: const Icon(IconlyLight.arrow_right_3),
              ),
              CustomListTile(
                onTap: () {},
                title: "Privacy & Security",
                subtitle: "Privacy, Security, Data",
                leading: const Icon(IconlyLight.lock),
                trailing: const Icon(IconlyLight.arrow_right_3),
              ),
              CustomListTile(
                onTap: () {},
                title: "Invite a friend",
                subtitle: "Share StudyHive with your friends",
                leading: const Icon(IconlyLight.heart),
                trailing: const Icon(IconlyLight.arrow_right_3),
              ),
              CustomListTile(
                onTap: () {
                  showCustomBottomSheet(
                    height: Get.height * 0.14,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 14),
                          child: Text(
                            "Are you sure you want to log out?",
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Get.back();
                              controller.signOut();
                            },
                            icon: const Icon(IconlyLight.logout),
                            label: Text("logout".tr),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                leading: const Icon(IconlyLight.logout),
                title: 'logout'.tr,
                subtitle: "logout_from_studyhive".tr,
                trailing: const Icon(IconlyLight.arrow_right_3),
              ),
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
