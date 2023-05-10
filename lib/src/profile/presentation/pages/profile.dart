import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:studyhive/shared/extensions/strings.dart';
import 'package:studyhive/shared/ui/custom_listtile.dart';
import 'package:studyhive/src/profile/presentation/manager/profile_controller.dart';

import '../../../../shared/ui/custom_bottomsheet.dart';
import '../../../settings/presentation/widgets/no_avatar.dart';
import '../../../settings/presentation/widgets/user_avatar.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              SizedBox(
                height: 130,
                child: InkWell(
                    onTap: () {
                      showCustomBottomSheet(
                          horizontalPadding: 0,
                          height: controller.profile.photoUrl != null ? Get.height * 0.25 : Get.height * 0.18,
                          child: Column(
                            children: [
                              ListTile(
                                onTap: () {
                                  Get.back();
                                },
                                leading: const Icon(IconlyLight.camera),
                                title: Text("take_a_photo".tr),
                              ),
                              ListTile(
                                onTap: () {
                                  Get.back();
                                },
                                leading: const Icon(IconlyLight.image),
                                title: Text("choose_from_gallery".tr),
                              ),
                              if (controller.profile.photoUrl != null)
                                ListTile(
                                  onTap: () {
                                    Get.back();
                                  },
                                  leading: const Icon(IconlyLight.delete),
                                  title: Text("delete_photo".tr),
                                ),
                            ],
                          ));
                    },
                    child: controller.profile.photoUrl != null
                        ? Center(
                            child: Hero(
                              tag: controller.profile.id,
                              child: UserAvatar(
                                size: UserAvatarSize.lg,
                                url: controller.profile.photoUrl!,
                              ),
                            ),
                          )
                        : Center(
                            child: Hero(
                              tag: controller.profile.id,
                              child: NoAvatar(
                                size: NoAvatarSize.lg,
                                initials: controller.profile.name.initials,
                              ),
                            ),
                          )),
              ),
              const SizedBox(height: 20),
              CustomListTile(
                onTap: () {},
                title: controller.profile.name,
                subtitle: "This name will be visible to your friends",
                leading: const Icon(
                  IconlyLight.profile,
                ),
                trailing: const Icon(
                  IconlyLight.edit,
                ),
              ),
              if (controller.profile.phoneNumber != null)
                CustomListTile(
                  onTap: () {},
                  title: "Phone",
                  subtitle: controller.profile.phoneNumber!,
                  leading: const Icon(
                    IconlyLight.call,
                  ),
                  trailing: const Icon(
                    IconlyLight.edit,
                  ),
                ),
              if (controller.profile.email != null)
                CustomListTile(
                  onTap: () {},
                  title: "Email",
                  subtitle: controller.profile.email!,
                  leading: const Icon(
                    IconlyLight.call,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
