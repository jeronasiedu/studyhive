import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:studyhive/shared/extensions/buttons.dart';

import '../manager/create_controller.dart';

class CreateHivePage extends GetView<CreateHiveController> {
  const CreateHivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(14),
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                "Create Your Hive",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            const Text(
              "A hive is a community of people who share a common interest.",
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 25),
              child: SizedBox(
                height: 120,
                child: InkWell(
                  onTap: controller.chooseHiveProfile,
                  child: Obx(() {
                    if (controller.hiveProfile.value.isNotEmpty) {
                      return CircleAvatar(
                        radius: 45,
                        backgroundImage: FileImage(
                          File(controller.hiveProfile.value),
                        ),
                      );
                    }
                    return CircleAvatar(
                      radius: 40,
                      backgroundColor: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
                      child: const Icon(IconlyBroken.image_2),
                    );
                  }),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Obx(() {
                return TextFormField(
                  controller: controller.nameController,
                  autofocus: true,
                  enabled: !controller.loading.value,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    labelText: "Name",
                    hintText: "Study Buddies",
                  ),
                );
              }),
            ),
            Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Obx(() => ElevatedButton(
                        onPressed: controller.enableButton.value ? () => controller.create() : null,
                        child: const Text('Create Hive'))
                    .withLoading(loading: controller.loading))),
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodySmall,
                text: "By creating a Hive, you agree to Study Hive's ",
                children: [
                  TextSpan(
                    text: "community guidelines",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
